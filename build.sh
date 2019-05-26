#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${DIR}/android/OsmAnd"

OSM_LOG_FILE="${OSM_LOG_FILE:-/tmp/build_osmand.log}"

./gradlew --stop
../gradlew  --refresh-dependencies clean assembleFullLegacyFatDebug &> "${OSM_LOG_FILE}"

if [[ $? -eq 0 ]]
then
        echo "BUILD SUCCESSFUL!"
        ./gradlew --stop
        exit 0
else
        echo "FAIL"
        ./gradlew --stop
        exit 1
fi
