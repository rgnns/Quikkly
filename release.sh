#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "No version supplied."
    echo "Usage: ./release.sh <version>"
    exit 0
fi

QUIKKLY_VERSION=$1

if [[ ! "$QUIKKLY_VERSION" =~ [0-9]+\.[0-9]+\.[0-9]+ ]]; then
    echo "Provided version does not have correct format."
    echo "Version format example: 3.4.20"
    exit 1
fi

git clone --depth 1 --branch "$QUIKKLY_VERSION" https://github.com/quikkly/ios-sdk.git
mv ios-sdk/Quikkly.framework Quikkly.framework
mv ios-sdk/Quikkly.xcframework Quikkly.xcframework

rm -rf ios-sdk
zip -r Quikkly.framework.zip Quikkly.framework/
zip -r Quikkly.xcframework.zip Quikkly.xcframework/
