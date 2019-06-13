Scripts to build OpenCV on ubuntu 16.04. ([Repository](https://hub.docker.com/r/justadudewhohacks/opencv/tags/))

Usage:
``` bash
./build.sh <OpenCV version> <with contrib?> <build opencv_world?>
```

OpenCV 3.4.0 without contrib:
``` bash
./build.sh 3.4.0
```

OpenCV 3.4.0 with contrib:
``` bash
./build.sh 3.4.0 y
```

OpenCV 3.4.0 with contrib world:
``` bash
./build.sh 3.4.0 y y
```