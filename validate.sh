#!/bin/bash

set -e

GROUPID=io.fabric8.launcher
ARTIFACTID=booster-catalog-service
VERSION=29
MAIN=io.fabric8.launcher.booster.BoosterValidator
TARGET=target

echo "Setting up the validator..."
mvn -q dependency:copy -Dartifact=${GROUPID}:${ARTIFACTID}:${VERSION}:pom -DoutputDirectory=${TARGET}
mvn -q dependency:copy -Dartifact=${GROUPID}:${ARTIFACTID}:${VERSION} -DoutputDirectory=${TARGET}
mvn -q dependency:copy-dependencies -f ${TARGET}/${ARTIFACTID}-${VERSION}.pom -DoutputDirectory=dependencies
java -cp ${TARGET}/\*:${TARGET}/dependencies/\* ${MAIN}
