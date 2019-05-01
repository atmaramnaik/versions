#!/bin/bash

set -e
set -o pipefail
version=$(git describe --long | sed 's/-g[a-f\d]*$//')
# Remove commit hash with leading "g"
version=$(sed 's/-g[A-Fa-f0-9]*$//' <<< "$version")
echo $version
version="$version.${GO_PIPELINE_COUNTER:-0}.${GO_STAGE_COUNTER:-0}"
echo $version