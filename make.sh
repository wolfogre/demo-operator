#!/bin/bash

set -e

MAIN_VERSION=$(cat version/version.go | grep Version | grep -E "[0-9]*(\.[0-9]*){2}" -o)

SUB_VERSION=$(cat .version)

let SUB_VERSION+=1

echo ${SUB_VERSION} > .version

VERSION=${MAIN_VERSION}.${SUB_VERSION}

operator-sdk build reg.qiniu.com/wolfogre-public/demo-operator:${VERSION}
docker push reg.qiniu.com/wolfogre-public/demo-operator:${VERSION}
sed 's|REPLACE_IMAGE|reg.qiniu.com/wolfogre-public/demo-operator:$(VERSION)|g' deploy/template_operator.yaml > deploy/operator.yaml

