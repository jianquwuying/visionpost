# Third-Party Notices

This repository contains only source code and does not redistribute any
third-party binary library. The following libraries are used at build/runtime
time and remain under their own licenses. They are **not** covered by this
project's MIT license.

| Dependency | Version used / tested | License | Upstream |
|---|---|---|---|
| OpenCV | 4.8.0 | `Apache-2.0 AND BSD-3-Clause` (upstream project; some files remain BSD-3-Clause) | <https://opencv.org/license/> |
| yaml-cpp | 0.8.0 | MIT / X11 | <https://github.com/jbeder/yaml-cpp/blob/master/LICENSE> |
| pthread / glibc | system | LGPL-2.1-or-later | <https://www.gnu.org/licenses/lgpl-2.1.html> |
| NCNN (optional, `yolo` branch only) | latest | BSD-3-Clause | <https://github.com/Tencent/ncnn/blob/master/LICENSE.txt> |

Notes:

- The `yolo` branch is an experimental alternative implementation that uses
  NCNN. It does not contain model weights. If you add weights trained with
  Ultralytics tooling, those weights are subject to the Ultralytics license
  (AGPL-3.0 or a commercial license) and must not be mixed into this MIT
  repository.
- If you redistribute a **binary** build, you are responsible for complying
  with the third-party licenses above (notices, source availability, etc.).
  Do not bundle a GPL-configured FFmpeg build with this project.
- The camera images under `docs/images/` are photographs taken by the author
  and are licensed under the repository's MIT license, unless otherwise noted.
  The target marker pattern itself is provided by the competition organizers.
