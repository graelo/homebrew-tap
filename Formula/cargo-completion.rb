class CargoCompletion < Formula
  desc "Bash and Zsh completion for Cargo"
  homepage "https://github.com/rust-lang/cargo"
  url "https://github.com/rust-lang/cargo/archive/0.64.0.tar.gz"
  sha256 "79045afc3df858f2c8398cc231f67f9c4eda8ffbea91078fd7447d71864332b5"
  version_scheme 1
  head "https://github.com/rust-lang/cargo.git"

  def install
    bash_completion.install "src/etc/cargo.bashcomp.sh" => "cargo"
    zsh_completion.install "src/etc/_cargo"
  end

  test do
    # we need to define a dummy 'cargo' command to force the script to define
    # the completion function
    assert_match "-F _cargo",
      shell_output("cargo() { true;} && source #{bash_completion}/cargo && complete -p cargo")
  end
end
