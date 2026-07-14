#!/data/data/com.termux/files/usr/bin/bash

# Define the repository source
REPO_URL="https://raw.githubusercontent.com/newssungoldentoday-dev/raychd-apt/main/"
SOURCES_FILE="$PREFIX/etc/apt/sources.list.d/raychd.list"

# Add the repo to Termux
echo "deb [arch=aarch64 allow-insecure=yes] $REPO_URL stable main" > "$SOURCES_FILE"

# Update and install
pkg update
pkg install raychd -y

echo "Raychd has been installed successfully!"
