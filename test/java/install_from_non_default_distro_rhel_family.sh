#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

check "java version openjdk 24 installed" grep "openjdk 24." <(java --version)

# Report result
reportResults
