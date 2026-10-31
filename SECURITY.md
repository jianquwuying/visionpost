# Security Policy

## Reporting a vulnerability

Please do **not** open a public issue for security problems. Report them
privately through GitHub Security Advisories on this repository, or contact the
maintainer at the email address in the commit history.

## Scope

This is an embedded vision application that runs with access to a camera and a
serial port. Relevant issues include, for example:

- unsafe handling of the serial protocol or configuration files,
- privilege or permission problems in `scripts/autostart.sh`,
- command injection in the startup/watchdog scripts.

## Known operational notes

- The startup script no longer stores a sudo password. Grant serial access
  through the `dialout` group or the provided udev rule
  (`scripts/99-visionpost.rules`).
- Do not run the application as root unless you understand the implications.
