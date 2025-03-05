#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Definition specific tests for root user
check "root-default-shell-is-zsh" bash -c "getent passwd root | awk -F: '{ print $7 }' | grep '/bin/zsh'"
check "root-default-zshrc-is-dev-container-template" bash -c "cat /root/.zshrc | grep ZSH_THEME | grep devcontainers"
check "root-zsh-path-contains-local-bin" zsh -l -c "echo $PATH | grep '/root/.local/bin'"

check "Ensure .zprofile is owned by root" bash -c "stat -c '%U' /root/.zprofile | grep root"

# Report result
reportResults