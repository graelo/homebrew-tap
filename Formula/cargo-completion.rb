class CargoCompletion < Formula
   desc "Bash and Zsh completion for Cargo"
   homepage "https://github.com/rust-lang/cargo"
   url "https://github.com/rust-lang/cargo/archive/0.60.0.tar.gz"
   sha256 "96dfa69407e9c5493c0858aab1d89e8f8bad992ab9ee1f83f2c55f6c7fc3686a"
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
