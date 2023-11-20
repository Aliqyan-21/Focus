#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set the paths
CODE_DIR="${SCRIPT_DIR}"
LIB_NAME="libFocus.so"
EXEC_NAME="focus"
WRAPPER_NAME="Focus_wrapper.sh"

# Remove the wrapper script from the PATH
sudo rm -rf "/usr/local/bin/${EXEC_NAME}"

# Remove the shared library, object file, and wrapper script
rm -rf "${CODE_DIR}/${LIB_NAME}" "${CODE_DIR}/${EXEC_NAME}.o" "${CODE_DIR}/${WRAPPER_NAME}"

echo "Uninstall completed."
