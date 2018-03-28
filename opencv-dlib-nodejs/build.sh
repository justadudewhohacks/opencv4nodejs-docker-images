#!/bin/bash

NODE_VERSION=${1:-9.9.0}
OPENCV_VERSION=${2:-3.4.1}
DLIB_VERSION=${3:-19.8}
TAG_PREFIX=justadudewhohacks

for i in $(ls -d */); do
    base=${i%%/}
    echo "Building $base";
    image=${TAG_PREFIX}/node-opencv-dlib:${base}
    echo $image
    docker build -f $base/Dockerfile -t ${image} -t ${image}-${OPENCV_VERSION} --build-arg OPENCV_VERSION=$OPENCV_VERSION --build-arg NODE_VERSION=$NODE_VERSION --build-arg DLIB_VERSION=$DLIB_VERSION $base
    echo "Done $base";
done
