#!/bin/bash

set -e

GROUPID=io.fabric8.launcher
ARTIFACTID=booster-catalog-service
VERSION=59
# Don't increase the version! Version 59 will be the
# last version that supports the necessary code!

MAIN=io.fabric8.launcher.booster.BoosterSingleDoc
TARGET=target

mvn -q dependency:copy -Dartifact=${GROUPID}:${ARTIFACTID}:${VERSION}:pom -DoutputDirectory=${TARGET}
mvn -q dependency:copy -Dartifact=${GROUPID}:${ARTIFACTID}:${VERSION} -DoutputDirectory=${TARGET}
mvn -q dependency:copy-dependencies -f ${TARGET}/${ARTIFACTID}-${VERSION}.pom -DoutputDirectory=dependencies
java -cp ${TARGET}/\*:${TARGET}/dependencies/\* ${MAIN} "$1" "$2" "$3"
