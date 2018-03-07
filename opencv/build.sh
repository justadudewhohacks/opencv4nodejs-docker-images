#!/bin/bash
tag=$1
if [ -n "$2" ]; then
	tag+="-contrib";
fi;
echo building $tag
docker build -t justadudewhohacks/opencv:$tag --build-arg OPENCV_VERSION=$1 --build-arg WITH_CONTRIB=$2 .