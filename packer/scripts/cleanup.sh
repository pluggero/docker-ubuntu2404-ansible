#!/bin/bash
# Cleanup script to finalize the container image
set -euo pipefail

# Remove apt cache and lists
rm -rf /var/lib/apt/lists/*

# Remove documentation to reduce image size
rm -Rf /usr/share/doc
rm -Rf /usr/share/man

# Clean apt cache
apt-get clean

# Remove unnecessary getty and udev targets that result in high CPU usage when using
# multiple containers with Molecule (https://github.com/ansible/molecule/issues/1104)
rm -f /lib/systemd/system/systemd*udev*
rm -f /lib/systemd/system/getty.target
