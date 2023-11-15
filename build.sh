#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set the paths
CODE_DIR="${SCRIPT_DIR}"
LIB_NAME="libFocus.so"
EXEC_NAME="focus"
WRAPPER_NAME="Focus_wrapper.sh"

# Compile the C code
gcc -c -fPIC "${CODE_DIR}/${EXEC_NAME}.c" -o "${CODE_DIR}/${EXEC_NAME}.o"
gcc -shared -o "${CODE_DIR}/${LIB_NAME}" "${CODE_DIR}/${EXEC_NAME}.o"
gcc ${EXEC_NAME}.c -o ${EXEC_NAME}

# Create the wrapper script
echo "#!/bin/bash" > "${CODE_DIR}/${WRAPPER_NAME}"
echo "export LD_LIBRARY_PATH=${CODE_DIR}:\$LD_LIBRARY_PATH" >> "${CODE_DIR}/${WRAPPER_NAME}"
echo "${CODE_DIR}/${EXEC_NAME} \"\$@\"" >> "${CODE_DIR}/${WRAPPER_NAME}"

# Set permissions
chmod +x "${CODE_DIR}/${WRAPPER_NAME}"
chmod +x "${CODE_DIR}/${EXEC_NAME}"

# Move the wrapper script to a directory in the PATH
sudo mv "${CODE_DIR}/${WRAPPER_NAME}" /usr/local/bin/${EXEC_NAME}

echo "Build completed. You can now run '${EXEC_NAME}' from anywhere from CLI, by just typing ${EXEC_NAME} in the CLI"