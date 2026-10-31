# Changelog

## [1.0.0] - 2026-10-31

First public release.

- Traditional OpenCV pipeline (no deep learning, no GPU) for Raspberry Pi 5.
- Four modes: 6-color slots, multi-ring digit recognition, black cylinder,
  idle heartbeat.
- Kalman-filtered coordinates, serial protocol, YAML-driven configuration,
  watchdog/autostart scripts.
- MIT license.
- Repository cleanup: removed committed build artifacts, replaced
  machine-specific paths, removed the stored sudo password, renamed the
  project to `visionpost`, and documented the pinned OpenCV 4.8.0
  environment.
