FROM debian:stretch as stretch-node-opencv-dlib

ARG RUNTIME_DEPS='ca-certificates libpng-dev libjpeg-dev libwebp-dev libtiff5-dev libopenexr-dev libopenblas-dev libx11-6'
ARG BUILD_DEPS='wget unzip cmake build-essential python pkg-config libx11-dev'
ARG ARCH='x64'
ARG NODE_VERSION=9.9.0
ARG OPENCV_VERSION=3.4.1
ARG DLIB_VERSION=19.8
ARG LIB_PREFIX='/usr/local'

ENV OPENCV_VERSION=${OPENCV_VERSION} \
    DLIB_VERSION=${DLIB_VERSION} \
    NODE_VERSION=${NODE_VERSION} \
    LIB_PREFIX=${LIB_PREFIX} \
    OPENCV4NODEJS_DISABLE_AUTOBUILD=1 \
    DLIB_INCLUDE_DIR='$LIB_PREFIX/include' \
    DLIB_LIB_DIR='$LIB_PREFIX/lib'

RUN apt-get update && apt-get install -y ${BUILD_DEPS} ${RUNTIME_DEPS} --no-install-recommends \
    && wget https://nodejs.org/dist/v$NODE_VERSION/node-v${NODE_VERSION}-linux-$ARCH.tar.xz -O node.tar.xz \
    && wget https://github.com/Itseez/opencv/archive/${OPENCV_VERSION}.zip -O opencv.zip \
    && wget https://github.com/Itseez/opencv_contrib/archive/${OPENCV_VERSION}.zip -O opencv_contrib.zip \
    && wget https://github.com/davisking/dlib/archive/v${DLIB_VERSION}.zip -O dlib.zip \
    && tar -xJf node.tar.xz -C ${LIB_PREFIX} --strip-components=1 --no-same-owner \
    && rm node.tar.xz \
    && ln -s ${LIB_PREFIX}/bin/node ${LIB_PREFIX}/bin/nodejs \
    && mkdir /opencv \
    && mv opencv.zip opencv_contrib.zip /opencv \
    && cd /opencv \
    && unzip -qq opencv.zip \
    && mv opencv-${OPENCV_VERSION} opencv \
    && unzip -qq opencv_contrib.zip \
    && mv opencv_contrib-${OPENCV_VERSION} opencv_contrib \
    && ls -la \
    && mkdir opencv/build \
    && cd opencv/build \
    && opencv_cmake_flags="-D CMAKE_BUILD_TYPE=RELEASE \
	-D BUILD_DOCS=OFF \
	-D BUILD_TESTS=OFF \
	-D BUILD_PERF_TESTS=OFF \
	-D BUILD_JAVA=OFF \
	-D BUILD_opencv_apps=OFF \
	-D BUILD_opencv_aruco=OFF \
	-D BUILD_opencv_bgsegm=OFF \
	-D BUILD_opencv_bioinspired=OFF \
	-D BUILD_opencv_ccalib=OFF \
	-D BUILD_opencv_datasets=OFF \
	-D BUILD_opencv_dnn_objdetect=OFF \
	-D BUILD_opencv_dpm=OFF \
	-D BUILD_opencv_fuzzy=OFF \
	-D BUILD_opencv_hfs=OFF \
	-D BUILD_opencv_java_bindings_generator=OFF \
	-D BUILD_opencv_js=OFF \
    -D BUILD_opencv_img_hash=OFF \
    -D BUILD_opencv_line_descriptor=OFF \
    -D BUILD_opencv_optflow=OFF \
    -D BUILD_opencv_phase_unwrapping=OFF \
	-D BUILD_opencv_python3=OFF \
	-D BUILD_opencv_python_bindings_generator=OFF \
	-D BUILD_opencv_reg=OFF \
	-D BUILD_opencv_rgbd=OFF \
	-D BUILD_opencv_saliency=OFF \
	-D BUILD_opencv_shape=OFF \
	-D BUILD_opencv_stereo=OFF \
	-D BUILD_opencv_stitching=OFF \
	-D BUILD_opencv_structured_light=OFF \
	-D BUILD_opencv_superres=OFF \
	-D BUILD_opencv_surface_matching=OFF \
	-D BUILD_opencv_ts=OFF \
	-D BUILD_opencv_xobjdetect=OFF \
	-D BUILD_opencv_xphoto=OFF \
	-D CMAKE_INSTALL_PREFIX=$LIB_PREFIX \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules" \
    && cmake $opencv_cmake_flags .. \
    && make -j $(nproc) \
    && cd /opencv/opencv/build \
    && make install \
    && cd / \
    && rm -rf /opencv \
    && dlib_cmake_flags="-D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=$LIB_PREFIX \
    -D DLIB_NO_GUI_SUPPORT=OFF \
    -D DLIB_USE_BLAS=ON \
    -D DLIB_PNG_SUPPORT=ON \
    -D DLIB_JPEG_SUPPORT=ON \
    -D DLIB_USE_CUDA=OFF" \
    && unzip -qq dlib.zip \
    && mv dlib-${DLIB_VERSION} dlib \
    && rm dlib.zip \
    && cd dlib \
    && mkdir -p build \
    && cd build \
    && cmake $dlib_cmake_flags .. \
    && make -j $(nproc) \
    && cd /dlib/build \
    && make install \
    && cp /dlib/dlib/*.txt $LIB_PREFIX/include/dlib/ \
    && cd / \
    && rm -rf /dlib \
    && apt-get purge -y --auto-remove $BUILD_DEPS \
    && apt-get autoremove -y --purge \
    && apt-get install -y $RUNTIME_DEPS --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* /usr/share/man /usr/local/share/man /tmp/*
