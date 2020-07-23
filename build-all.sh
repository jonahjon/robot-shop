#!/bin/bash

set -ex

COMMIT_SHA=${CODEBUILD_SOURCE_VERSION:-$(git rev-parse HEAD)}
AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-us-west-2}
ACCOUNT=${ACCOUNT:-164382793440}

for name in cart catalogue dispatch load-gen mongo mysql ratings shipping payment user web; do
    make -C $name ci-release \
        TAG=$COMMIT_SHA \
        AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
        ACCOUNT=$ACCOUNT
done


# Build all X-ray services
# for name in cart catalogue payment user shipping ratings; do make -C $name ci-release  ; done