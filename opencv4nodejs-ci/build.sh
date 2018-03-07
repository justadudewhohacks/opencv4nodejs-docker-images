#!/bin/bash
docker build -t justadudewhohacks/opencv4nodejs-ci:$1 --build-arg TAG=$1 .