#!/data/data/com.termux/files/usr/bin/bash

# Define where the package should go
INSTALL_DIR=$PREFIX/bin

echo "--- Building Raychd ---"

# Copy your main script to the system bin directory
# Make sure your main script is named 'raychd' in your folder
cp raychd $INSTALL_DIR/raychd

# Set the correct permissions so it can be executed
chmod +x $INSTALL_DIR/raychd

echo "--- Build Complete: Raychd is now installed! ---"
echo "You can now run 'raychd' from anywhere."
