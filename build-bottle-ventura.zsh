#!/usr/bin/env zsh

function build-bottle() {
  local formula_name=$1
  local formula_path="Formula/${formula_name}.rb"

  brew uninstall ${formula_name}

  brew install --build-bottle graelo/tap/${formula_name}
  brew bottle --json --no-rebuild ${formula_name}

  echo "copy the above in ${formula_path}, and align shas"

  rename 's/--/-/' *.tar.gz

  local bottle_file=$(ls ${formula_name}*.tar.gz)

  echo "enter: gh release upload <TAG-NAME> ${bottle_file}"
  echo "\nthen delete local files: rm -rf ${formula_name}-*"
}

build-bottle $1
