#!/usr/bin/env bash

rm -rf Quikkly.xcframework

git clone --depth 1 --branch xcode13.1-xc https://github.com/quikkly/ios-sdk.git
mv ios-sdk/Quikkly.xcframework Quikkly.xcframework

rm -rf ios-sdk
zip -r Quikkly.xcframework.zip Quikkly.xcframework/
