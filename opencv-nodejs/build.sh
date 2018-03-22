#!/bin/bash
tag=node$3-opencv$1
with_contrib=""
if [ "$2" == "y" ]; then
	tag+="-contrib";
	with_contrib=1;
fi;
image=justadudewhohacks/opencv-nodejs:$tag
echo building $image
docker build -t $image --build-arg OPENCV_VERSION=$1 --build-arg WITH_CONTRIB=$with_contrib --build-arg NODEJS_MAJOR_VERSION=$3 .