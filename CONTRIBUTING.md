# Contributing

Thanks for your interest in `visionpost`.

## Development environment

This project targets **Raspberry Pi 5 / Ubuntu 24.04 aarch64** only. See the
README for the pinned toolchain (GCC 13.3, CMake 3.28, OpenCV 4.8.0 installed
under `/usr/local`, yaml-cpp 0.8).

## Build

```bash
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j4
```

If CMake cannot find OpenCV 4.8, set:

```bash
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
  -DOpenCV_DIR=/usr/local/lib/cmake/opencv4
```

## Contribution terms

By submitting a pull request or patch, you agree that your contribution is
licensed under the MIT License used by this repository (inbound = outbound).
Please keep the existing SPDX header style and add your own copyright line if
you add a new file.

## Scope

- The `main` branch is the traditional-OpenCV implementation.
- The `yolo` branch is experimental (NCNN/YOLO) and is not covered by CI or the
  main project's support commitments.
- Please do not commit model weights, datasets, build artifacts, camera
  recordings, or machine-specific paths/passwords.

## Reporting issues

Include the output of:

```bash
pkg-config --modversion opencv4
cmake --version
g++ --version
bash scripts/autostart.sh doctor
```

and the exact command that failed.
