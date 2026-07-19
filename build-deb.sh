#!/usr/bin/env bash
#
# build-deb.sh — builds raychd_1.0.0_all.deb from the raychd-deb/ tree
#
# Usage:
#   ./build-deb.sh
#
# Requires: dpkg-deb (Termux: pkg install dpkg)

set -eu

PKG_DIR="raychd-deb"
OUT="raychd_1.0.0_all.deb"

command -v dpkg-deb >/dev/null 2>&1 || {
    echo "build-deb.sh: 'dpkg-deb' not found."
    echo "  Termux:        pkg install dpkg"
    echo "  Debian/Ubuntu: sudo apt install dpkg-dev"
    exit 1
}

chmod 755 "$PKG_DIR/DEBIAN/postinst"
chmod 755 "$PKG_DIR/usr/local/bin/raychd" "$PKG_DIR/usr/local/bin/raychd-command"
find "$PKG_DIR" -type d -exec chmod 755 {} \;

dpkg-deb --build --root-owner-group "$PKG_DIR" "$OUT"

echo "Built: $OUT"
echo "Install locally with: sudo dpkg -i $OUT"
echo "Add it to your raychd-apt repo with: reprepro includedeb stable $OUT"
