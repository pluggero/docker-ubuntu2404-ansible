#!/bin/bash
# Fail on error
set -euo pipefail

# Change to the repository root directory
cd "$(dirname "$0")"/..

# Initialize Packer
packer init packer/

# Run the Packer build
packer build -force -on-error=ask packer/

# Create version.txt with commit hash
COMMIT_HASH=$(git rev-parse HEAD 2>/dev/null || echo "unknown")
echo "$COMMIT_HASH" > "packer/outputs/version.txt"

echo "Build completed: packer/outputs/ubuntu2404-ansible.tar"
