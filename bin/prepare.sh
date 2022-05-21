#!/bin/bash
set -Eeuo pipefail

prepare_wildmatch() {
  cp Dependencies/wildmatch/wildmatch/wildmatch.h Sources/WildmatchC/include/
  cp Dependencies/wildmatch/wildmatch/wildmatch.c Sources/WildmatchC/
}

prepare_fzy() {
  pushd Dependencies/fzy >/dev/null
    make clean
    make
  popd >/dev/null

  declare -r fzy_c_source_folder="Sources/FzyC/fzy"
  cp Dependencies/fzy/config.h "${fzy_c_source_folder}/.."
  cp Dependencies/fzy/src/match.h "${fzy_c_source_folder}/../include"
  cp Dependencies/fzy/src/{match.c,bonus.h} "${fzy_c_source_folder}"
}

main() {
  pushd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null
    prepare_wildmatch
    prepare_fzy
  popd >/dev/null
}

main