#!/bin/bash
# Bootstrap script to install base packages and Python for Ansible provisioning
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

# Update package lists and install base packages
apt-get update
apt-get install -y --no-install-recommends \
    sudo \
    python3
