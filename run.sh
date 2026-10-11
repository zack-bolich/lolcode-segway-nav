#!/usr/bin/env bash
set -euo pipefail

cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

if command -v lci >/dev/null 2>&1; then
  interpreter="$(command -v lci)"
else
  if [[ ! -x ./lci/lci ]]; then
    if [[ ! -d ./lci ]]; then
      git clone https://github.com/justinmeza/lci.git ./lci >&2
    fi
    (cd ./lci && cmake . && make) >&2
  fi
  interpreter=./lci/lci
fi

exec "$interpreter" segway_nav.lol
