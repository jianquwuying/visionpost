#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 jianquwuying
# ============================================================================
# install-opencv-4.8.sh — build and install OpenCV 4.8.0 into /usr/local
#
# The project is pinned to OpenCV >= 4.8.0. Ubuntu 24.04's libopencv-dev is
# 4.6.0, which is NOT sufficient, so this script builds the tested version
# from source.
#
# Usage:
#   bash scripts/install-opencv-4.8.sh
#
# It requires sudo for apt and for installing into /usr/local. The build takes
# roughly 30-60 minutes on a Raspberry Pi 5. Only the modules used by
# visionpost are built (core, imgproc, videoio, highgui, imgcodecs, video).
# ============================================================================
set -euo pipefail

OPENCV_VERSION="4.8.0"
PREFIX="/usr/local"
WORKDIR="${WORKDIR:-$HOME/opencv-4.8.0-build}"

echo "==> Installing build dependencies (sudo required)"
sudo apt-get update
sudo apt-get install -y \
    build-essential cmake git pkg-config \
    libgtk-3-dev libavcodec-dev libavformat-dev libswscale-dev \
    libv4l-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-dev \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev

echo "==> Fetching OpenCV ${OPENCV_VERSION} into ${WORKDIR}"
mkdir -p "${WORKDIR}"
cd "${WORKDIR}"
if [[ ! -d opencv ]]; then
    git clone --branch "${OPENCV_VERSION}" --depth 1 \
        https://github.com/opencv/opencv.git
fi
cd opencv
git fetch --depth 1 origin "refs/tags/${OPENCV_VERSION}:refs/tags/${OPENCV_VERSION}" 2>/dev/null || true
git checkout "${OPENCV_VERSION}"

echo "==> Configuring (minimal module set)"
cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DBUILD_LIST=core,imgproc,videoio,highgui,imgcodecs,video \
    -DWITH_V4L=ON \
    -DWITH_FFMPEG=ON \
    -DWITH_GTK=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_opencv_python3=OFF

echo "==> Building (this takes a while on a Pi 5)"
cmake --build build -j"$(nproc)"

echo "==> Installing to ${PREFIX} (sudo required)"
sudo cmake --install build
sudo ldconfig

echo "==> Verify:"
pkg-config --modversion opencv4
ls -l "${PREFIX}/lib/cmake/opencv4/OpenCVConfig.cmake"
echo "Done. If CMake still picks another OpenCV, pass:"
echo "  -DOpenCV_DIR=${PREFIX}/lib/cmake/opencv4"
