#!/bin/bash
set -eu
# vars
CURRENT_TAG=$(git tag | tail -n1)
VERSION_MAJOR_MINOR="${TRAVIS_TAG:-$CURRENT_TAG}"
VERSION_RELEASE="${TRAVIS_BUILD_NUMBER:-$(date +%s)}"
VERSION="${VERSION_MAJOR_MINOR}.${VERSION_RELEASE}"
# clean
rm -rfv packages/*
# create packages
mkdir -vp packages
# build new package
fpm --package=packages/ -C package/os -s dir -t rpm -d java-1.8.0-openjdk -d rundeck --name=oasrundeck --version="${VERSION}" --after-install package/after-install --before-install package/before-install --rpm-os linux .
