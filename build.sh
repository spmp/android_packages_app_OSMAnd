#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${DIR}/android/OsmAnd"

OSM_LOG_FILE="${OSM_LOG_FILE:-/tmp/build_osmand.log}"

../gradlew --stop
../gradlew --no-daemon --refresh-dependencies clean assembleFullLegacyFatDebug &> "${OSM_LOG_FILE}"

if [[ $? -eq 0 ]]
then
        ../gradlew --stop
        echo "BUILD SUCCESSFUL!"
        exit 0
else
        ../gradlew --stop
        echo "FAIL"
        exit 1
fi
