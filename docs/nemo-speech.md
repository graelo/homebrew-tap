# nemo-speech

[`nemo-speech`](https://github.com/NVIDIA/NeMo-Speech.cpp) runs NVIDIA NeMo speech
models on-device: ASR transcription, speaker diarization, and speech-LLM (SALM)
transcription, including [Nemotron 3.5 Transcribe
30B-A4B](https://huggingface.co/nvidia/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B) with
word timestamps and speaker labels. This tap builds it from source with a
minimal, upstream-supported configuration: ASR + diarization + speech-LLM.
TTS, translation, HTTP serving, gRPC, and microphone capture are not built.

## Install

```bash
brew install graelo/tap/nemo-speech
```

The formula compiles the `v0.3.0` release from source and stages the exact
`llama.cpp` commit pinned by upstream's submodule (both archives are
SHA-256-pinned). Build-time dependencies: `cmake`, `ninja` (plus `git` where
upstream's ggml patch series is applied). Runtime dependencies: `sentencepiece`
and `abseil`. Nothing outside the Homebrew prefix is touched: no `sudo`, no
shell startup files, no services, and **no model is downloaded at install or
test time**.

## Backends

| Platform | Backend | ggml/llama.cpp |
|---|---|---|
| macOS, Apple Silicon | Metal (CPU fallback built in) | pristine, per upstream `metal-*` presets |
| macOS, Intel | CPU | patched, per upstream `cpu-*` presets |
| Linux, x86_64 & arm64 | CPU | patched, per upstream `cpu-*` presets |

CUDA is not offered: Homebrew has no CUDA toolkit package, so a CUDA build
could not be expressed cleanly within Homebrew's conventions. Linux users who
need CUDA should build upstream's `cuda-server` preset against their toolkit.
Metal kernel sources are embedded in the binary and compiled at runtime, so
the build needs only the Command Line Tools (not full Xcode).

## Verify the backend

```bash
nemo-speech doctor            # human-readable
nemo-speech doctor --json     # machine-readable features and devices
```

On Apple Silicon, `backend_metal: true` in the `features` object confirms the
Metal backend is compiled in, and the `devices` array lists the GPU (with its
memory). `doctor` exits non-zero when a compiled-in GPU backend finds no
device — that is a runtime/driver report, not a build defect.

## Models (downloaded only when you ask)

Nothing is downloaded at install or test time. Downloads happen only when you
run a model command: `pull` pre-downloads explicitly, and inference with an
indexed name (e.g. `--model nemotron-3.5`) also downloads the model if it is
missing — pass the path of a local model file to avoid that. Model files land
in a cache outside Homebrew:

- macOS: `~/Library/Caches/NeMoSpeech/models`
- Linux: `$XDG_CACHE_HOME/nemo-speech/models`, or `~/.cache/nemo-speech/models`
- Override, e.g. to keep models on an external volume:
  `export NEMO_SPEECH_MODEL_DIR=/Volumes/Models/nemo-speech`

Prebuilt ASR and diarization models can be pulled explicitly:

```bash
nemo-speech pull nvidia/nemotron-3.5-asr-streaming-0.6b   # alias: nemotron-3.5
nemo-speech model list
```

The speech-LLM model (Nemotron 3.5 Transcribe 30B-A4B) is a decoder plus an
encoder file that must live in the same directory, the encoder's file name
unchanged (the decoder names its encoder). It is not in the `pull` index —
`pull` covers the smaller indexed ASR/diarization/TTS models above — so get
the pair one of two ways:

### Ready-made GGUFs (no conversion)

[AtomicChat/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B-GGUF](https://huggingface.co/AtomicChat/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B-GGUF)
publishes ready-to-run decoder/encoder pairs built for NeMo-Speech.cpp (no
license gate, no 67 GB checkpoint, no Python). Its `AD-IQ4_NL` decoder
(19.7 GB) is the recommended pick for Metal — importance-matrix IQ4_NL
experts, measured within noise of BF16:

```bash
hf download AtomicChat/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B-GGUF \
    "NVIDIA-Nemotron-3.5-Transcribe-30B-A4B-AD-IQ4_NL.gguf" \
    "NVIDIA-Nemotron-3.5-Transcribe-30B-A4B-Encoder-F16.gguf" \
    --local-dir "$NEMO_SPEECH_MODEL_DIR"

nemo-speech transcribe meeting.wav \
    --model "$NEMO_SPEECH_MODEL_DIR/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B-AD-IQ4_NL.gguf" \
    --format json --diarize
```

The same repo has larger decoders (`AD-IQ4_NL_L` 22.6 GB, `AD-Q5_0_XL`
29.3 GB, `Q8_0` 35 GB) and a 13.6 GB one for 16 GB GPUs (`AD-Q2_0_M`), plus
the optional DFlash2 drafter (CUDA-only speculative decoding). Check a
download with `nemo-speech model info FILE`.

### Convert the BF16 checkpoint yourself

The official [nvidia/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B](https://huggingface.co/nvidia/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B)
checkpoint is BF16 and converts once with `convert_model.py` from an upstream
source checkout (see [upstream's SALM
guide](https://github.com/NVIDIA/NeMo-Speech.cpp/blob/main/docs/salm/models.md)).
On Metal, use the `iq4_nl` decoder precision (the unpatched-llama.cpp path):

```bash
hf download nvidia/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B \
    --local-dir ~/checkpoints/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B
python3 convert_model.py ~/checkpoints/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B \
    --architecture salm --outtype iq4_nl \
    --outfile "$NEMO_SPEECH_MODEL_DIR/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B-IQ4_NL.gguf"
```

The conversion also writes the encoder file (`…-Encoder-F16.gguf`) next to the
decoder. It needs ~60 GB of free disk for the BF16 intermediate. An IQ4_NL
decoder fits comfortably in 128 GB of unified memory.

### About the FP8 release

[nvidia/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B-FP8](https://huggingface.co/nvidia/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B-FP8)
is an FP8 checkpoint for serving frameworks (vLLM, TensorRT-LLM). This runtime
does not consume it: the converter takes the BF16 checkpoint, and the GGUF
quantization (IQ4_NL and friends) is chosen at conversion time. Use it for
serving-stack deployments, not for `nemo-speech`.

## Transcribe, diarize, word timestamps

```bash
MODEL="$NEMO_SPEECH_MODEL_DIR/NVIDIA-Nemotron-3.5-Transcribe-30B-A4B-IQ4_NL.gguf"

# plain transcript
nemo-speech transcribe meeting.wav --model "$MODEL"

# JSON with a start/end time and a speaker label per word
nemo-speech transcribe meeting.wav --model "$MODEL" --format json --diarize

# subtitles
nemo-speech transcribe meeting.wav --model "$MODEL" --format srt
```

`--diarize` distinguishes up to eight speakers. Word timestamps come from the
encoder's CTC head and are included in `--format json` (and in SRT/VTT);
`--word-times` requests them without changing the output format. Pass
`-l fr` (etc.) when you know the language. ASR-only models work the same way:

```bash
nemo-speech transcribe recording.wav --model nemotron-3.5
nemo-speech diarize meeting.wav --model nemotron-3-diarization
```

### Recipes

All recipes use the speech-LLM decoder from above as `$MODEL` and write to
stdout (add `--output FILE` to write a file, `--output-dir DIR` for a
directory of recordings with `-c N` for N concurrent files):

| What you want | Command |
|---|---|
| Plain transcript | `nemo-speech transcribe meeting.wav --model $MODEL` |
| Every word timed, every speaker labeled (JSON) | `… --format json --diarize` |
| Speaker turns in readable text | `… --diarize` (labels per turn; per word in JSON) |
| Word times only, no speakers (JSON) | `… --format json` |
| Subtitles | `… --format srt` or `--format vtt` |
| A known language | `… -l fr` |
| Custom instructions | `… --instruction "Transcribe with punctuation and capitalization. Context terms: CUDA, TensorRT."` |
| Speakers with punctuation | `… --instruction "Transcribe this audio with punctuation and capitalization. Include all spoken words and verbal fillers. Write numbers in their standard written form. Put speaker tags <spk:0> <spk:1> <spk:2> <spk:3> on the transcription."` |

Notes on the recipes:

- `--format json` returns each word with `start`, `end`, and (with
  `--diarize`) a speaker number from 1; `-c 8` batches a directory's files on
  the GPU.
- Plain `--diarize` switches the model to its speaker prompt, which produces
  lowercase, unpunctuated text; for speakers *and* punctuation use the
  instruction recipe instead — its labels arrive as inline `<spk:N>` tags in
  the transcript, not as JSON fields. More prompt recipes are in the model
  card's Prompt Guide.
- When the word-timestamp alignment fails, the transcript still comes back
  without word times rather than with invented ones.
- Recordings can be up to one hour; trim long noise or music stretches, which
  can come out as invented text. Near-digital silence returns an empty
  transcript without running the language model.

## Uninstall

```bash
brew uninstall graelo/tap/nemo-speech
```

This removes everything the formula installed. Model files you downloaded live
outside Homebrew and survive the uninstall; remove them explicitly if you
want them gone:

```bash
rm -rf ~/Library/Caches/NeMoSpeech   # macOS
rm -rf ~/.cache/nemo-speech          # Linux
```

## Not tested here

- The 30B speech-LLM model itself was not run during formula development:
  its transcription, diarization, and word timestamps are upstream-documented
  behavior of this build configuration, not verified end to end here.
- Intel macOS and Linux builds follow upstream's `cpu-*` presets but were not
  exercised locally; CI builds them on push.
- CUDA (all platforms) and Vulkan are not built.
