#!/usr/bin/env bash

set -eu

build_version() {
  if [[ -z "${BUILDKITE_TAG:-}" ]];
  then
    local new_version;
    new_version="${npm_package_version:-}-b${BUILDKITE_BUILD_NUMBER}"
    echo "New version is ${new_version}"
    npm version --no-git-tag-version "${new_version}"
  else
    echo "Commit is tagged. Not adding build number"
  fi
}

if [[ -n ${BUILDKITE:-} ]]; then
  build_version
fi
