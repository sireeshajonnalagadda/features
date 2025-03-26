#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Check installation of cuda-nvtx-12-4 (12.4)
check "cuda-12-4+nvtx" test -e '/usr/local/cuda-12.4/targets/x86_64-linux/include/nvtx3/'

# Verify CUDA toolkit installation
check "nvcc" nvcc --version

# Verify PATH environment variable
check "cuda-path" echo $PATH | grep -q "/usr/local/cuda-12.4/bin"

# Report result
reportResults
