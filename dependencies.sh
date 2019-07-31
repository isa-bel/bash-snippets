#!/usr/bin/env bash

# Verifies that a dependency is installed
# $1 dependency name
# $2 version command
# Example: verifyDep 'node' $(node --version)
function verifyDep {
  if [[ -z "$2" ]]; then
    echo "🙅 It looks like you don't have $1 installed, we need it!"
    return 1
  fi
  echo "🙆️ $1 installed"
  return 0
}

# Verifies that a dependency is installed and that the installed version is
# greater or equal than the minimum version
# $1 dependency name
# $2 version command
# $3 minimum version
# Example: verifyDepMin 'node' $(node --version) 'v8.11.4'
function verifyDepMin {
  MIN_VERSION=$3
  if [[ -z "$MIN_VERSION" ]]; then
    echo "🙅 It looks like you don't have $1 installed, we need it!"
    return 1
  fi

  LOWER_VERSION=$(printf '%s\n' $2 ${MIN_VERSION} | sort -V | head -n 1)
  if [[ ${LOWER_VERSION} !=  ${MIN_VERSION} ]]; then
    echo "🙅 Invalid $1 version, min version is $MIN_VERSION"
    return 1
  fi

  echo "🙆️ $1 $3 installed"
  return 0
}
