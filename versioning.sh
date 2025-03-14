#!/bin/bash

# Get current branch name
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Base version (update manually for major releases)
BASE_VERSION="1.0.0"

# Determine version based on branch
if [[ "$BRANCH" == "master" ]]; then
    VERSION="$BASE_VERSION"
elif [[ "$BRANCH" == "develop" ]]; then
    VERSION="$BASE_VERSION-beta.$(git rev-list --count HEAD)"
elif [[ "$BRANCH" =~ ^feature/.* ]]; then
    VERSION="$BASE_VERSION-alpha.$(git rev-list --count HEAD)"
elif [[ "$BRANCH" =~ ^release/.* ]]; then
    VERSION="${BASE_VERSION%-*}-rc.$(git rev-list --count HEAD)"
else
    VERSION="$BASE_VERSION-dev.$(git rev-list --count HEAD)"
fi

# Update version in gradle.properties
sed -i "s/VERSION_NAME=.*/VERSION_NAME=$VERSION/" gradle.properties

echo "Updated version to: $VERSION"
