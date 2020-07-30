#!/bin/bash

set -ex

export AWS_DEFAULT_REGION=us-west-2

services="cart \
          catalogue \
          dispatch \
          load-gen \
          mongo \
          mysql \
          payment \
          ratings \
          shipping \
          user \
          web"

for service in $services; do
    aws ecr create-repository \
        --repository-name robot-shop/$service \
        --image-tag-mutability IMMUTABLE \
        --image-scanning-configuration scanOnPush=true \
        --region us-west-2 || true
done