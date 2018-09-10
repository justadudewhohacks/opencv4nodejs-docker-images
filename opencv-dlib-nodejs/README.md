# node-opencv-dlib

Scripts to build image with nodejs, opencv and dlib.

# Usage

``` bash
./build.sh <NODE_VERSION> <OPENCV_VERSION> <DLIB_VERSION>
```

Build OpenCV 3.4.1, node 9.9.0 and dlib 19.8:
``` bash
./build.sh 9.9.0 3.4.1 19.8
```

# Installing face-detection or opencv4nodejs

1. Install build deps:

1.1 Stretch

```Dockerfile
RUN apt-get install -y python build-essential 
```

1.2 Alpine

```Dockerfile
RUN apk -u --no-cache build-base python
```

2. Install face-detection or opencv4nodejs or both
3. Delete build deps in order to reduce image size
