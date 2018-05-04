#!/bin/bash

set -e

[ -f jenkins-env ] && cat jenkins-env | grep -e ghprbAuthorRepoGitUrl -e ghprbSourceBranch > inherit-env
[ -f inherit-env ] && . inherit-env

echo "Running https://github.com/rhoar-qe/booster-catalog-verifier.git"
git clone --depth=1 https://github.com/rhoar-qe/booster-catalog-verifier.git
cd booster-catalog-verifier
mvn -B clean test -DLAUNCHER_BOOSTER_CATALOG_REPOSITORY=${ghprbAuthorRepoGitUrl} -DLAUNCHER_BOOSTER_CATALOG_REF=${ghprbSourceBranch}
