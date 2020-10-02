#!/usr/bin/env bash

set -eu

scope() {
  if [[ ${npm_package_name:-} =~ @[A-Za-z]+/.* ]]; then
    echo "Package name already scoped"
  else
    echo "Package name not scoped"
    json -I -f package.json -e "this.name=\"@aurin/${npm_package_name}\""
    json -I -f package-lock.json -e "this.name=\"@aurin/${npm_package_name}\""
  fi
}

scope