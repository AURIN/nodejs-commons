#!/usr/bin/env bash

set -eu

scope() {
  if [[ ${npm_package_name:-} =~ @[A-Za-z]+/.* ]]; then
    echo "Package name already scoped"
  else
    echo "Package name not scoped"
    npx json -f package.json -e "this.name=\"@AURIN/${npm_package_name}\""
  fi
}

scope