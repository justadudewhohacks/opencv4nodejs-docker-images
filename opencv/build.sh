#!/bin/bash
tag=$1
with_contrib=""
build_world=""
build_list=""
if [ "$2" == "y" ]; then
	tag+="-contrib";
	with_contrib=1;
fi;
if [ "$3" == "y" ]; then
	tag+="-world";
	build_world=1;
fi;
if [ "$4" != "" ]; then
	tag+="-$4";
	build_list=$4;
fi;
echo building $tag
docker build -t justadudewhohacks/opencv:$tag \
	--build-arg OPENCV_VERSION=$1 \
	--build-arg WITH_CONTRIB=$with_contrib \
	--build-arg BUILD_WORLD=$build_world \
	--build-arg BUILD_LIST=$build_list \
	.