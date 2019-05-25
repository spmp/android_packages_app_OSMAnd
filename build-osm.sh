#!/bin/bash

cd android/OsmAnd
../gradlew  --refresh-dependencies assembleFullLegacyFatDebug
cd ../../
