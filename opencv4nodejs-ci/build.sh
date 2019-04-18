#!/bin/bash
docker build -t justadudewhohacks/opencv4nodejs-ci:$1-node$2 --build-arg TAG=$1 --build-arg NODE_MAJOR_VERSION=$2 .