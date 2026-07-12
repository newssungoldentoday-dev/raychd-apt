mkdir -p ~/repo/dists/stable/main/binary-aarch64/
mv ~/raychd-irc-1.0.0.deb ~/repo/dists/stable/main/binary-aarch64/
pkg install dpkg-dev
pkg install ./raychd-irc-1.0.0.deb
dpkg -i raychd-irc-1.0.0.deb
dpkg -i ~/repo/dists/stable/main/binary-aarch64/raychd-irc-1.0.0.deb
raychd-irc
cat << 'EOF' > /data/data/com.termux/files/usr/bin/raychd-irc
#!/data/data/com.termux/files/usr/bin/bash

# Configuration
CONFIG_FILE="/data/data/com.termux/files/usr/share/raychd/conf/ircd.conf"
SERVER="irc.libera.chat"
PORT=6667
NICK="RaychdUser"

echo "Starting raychd-irc engine..."

if [ -f "$CONFIG_FILE" ]; then
    echo "Loading configuration from $CONFIG_FILE"
fi

echo "Engine initialized. Ready to load modules."
echo "Connecting to $SERVER on port $PORT..."

# Create a temporary pipe for communication
PIPE=/tmp/raychd_pipe
if [ -p $PIPE ]; then
    rm $PIPE
fi
mkfifo $PIPE

# Run the connection in the background
{
    echo "NICK $NICK"
    echo "USER $NICK 0 * :Real Raychd IRC Client"
    tail -f $PIPE
} | nc $SERVER $PORT | while read line; do
    echo "$line"
    # Auto-reply to PING
    if [[ "$line" =~ ^PING ]]; then
        echo "PONG ${line#PING :}" > $PIPE
    fi
done
EOF

PING
raychd-irc
Ping
cat << 'EOF' > /data/data/com.termux/files/usr/bin/raychd-irc
#!/data/data/com.termux/files/usr/bin/bash

# Configuration
CONFIG_FILE="/data/data/com.termux/files/usr/share/raychd/conf/ircd.conf"
SERVER="irc.libera.chat"
PORT=6667
NICK="RaychdUser"

echo "Starting raychd-irc engine..."

if [ -f "$CONFIG_FILE" ]; then
    echo "Loading configuration from $CONFIG_FILE"
fi

echo "Engine initialized. Ready to load modules."
echo "Connecting to $SERVER on port $PORT..."

# Create a temporary pipe in a user-writable location
PIPE="$HOME/.raychd_pipe"
if [ -p "$PIPE" ]; then
    rm "$PIPE"
fi
mkfifo "$PIPE"

# Run the connection in the background
{
    echo "NICK $NICK"
    echo "USER $NICK 0 * :Real Raychd IRC Client"
    tail -f "$PIPE"
} | nc $SERVER $PORT | while read line; do
    echo "$line"
    # Auto-reply to PING
    if [[ "$line" =~ ^PING ]]; then
        echo "PONG ${line#PING :}" > "$PIPE"
    fi
done
EOF

cd ~/raychd
dpkg-scanpackages -m dists/stable/main/binary-aarch64/ > dists/stable/main/binary-aarch64/Packages
gzip -k dists/stable/main/binary-aarch64/Packages
mkdir -p ~/raychd/dists/stable/main/binary-aarch64/
mv ~/raychd-irc-1.0.0.deb ~/raychd/dists/stable/main/binary-aarch64/
find ~ -name "raychd-irc-1.0.0.deb"
mv ~/repo/dists/stable/main/binary-aarch64/raychd-irc-1.0.0.deb ~/raychd/dists/stable/main/binary-aarch64/
cd ~/raychd
dpkg-scanpackages -m dists/stable/main/binary-aarch64/ > dists/stable/main/binary-aarch64/Packages
gzip -k dists/stable/main/binary-aarch64/Packages
pkg install dpkg-dev
cd ~/raychd
dpkg-scanpackages -m dists/stable/main/binary-aarch64/ > dists/stable/main/binary-aarch64/Packages
apt --fix-broken install
rm $PREFIX/var/lib/dpkg/lock-frontend
rm $PREFIX/var/lib/dpkg/lock
pkg update
pkg install -f
pkg install gettext
rm /data/data/com.termux/files/usr/var/lib/dpkg/info/dpkg-perl.postinst
dpkg --configure -a
cd ~/raychd
dpkg-scanpackages -m dists/stable/main/binary-aarch64/ > dists/stable/main/binary-aarch64/Packages
gzip -k dists/stable/main/binary-aarch64/Packages
ls -l ~/raychd/dists/stable/main/binary-aarch64/
gzip -f ~/raychd/dists/stable/main/binary-aarch64/Packages
git init
git add dists/
git commit -m "Initial commit for raychd-irc apt repository"
git branch -M main
git remote add origin https://github.com/YOUR-GITHUB-USERNAME/raychd-repo.git
git push -u origin main
git init
git add dists/
git commit -m "Initial commit for raychd-irc apt repository"
git branch -M main
git remote add origin https://github.com/newssungoldentoday-dev/raychd.git
git push -u origin main
git add dists/
git commit -m "Initial commit for raychd-irc apt repository"
git push -u origin main
git config user.email "newssungoldentoday@gmail.com"
git config user.name "newssungoldentoday-dev"
exit
mkdir -p raychd-irc-1.0.0/DEBIAN
mkdir -p raychd-irc-1.0.0/data/data/com.termux/files/usr/bin
mkdir -p raychd-irc-1.0.0/data/data/com.termux/files/usr/share/raychd/modules
mkdir -p raychd-irc-1.0.0/data/data/com.termux/files/usr/share/raychd/conf
chmod 755 raychd-irc-1.0.0/DEBIAN
chmod 644 raychd-irc-1.0.0/DEBIAN/control
chmod 755 raychd-irc-1.0.0/data/data/com.termux/files/usr/bin/raychd-irc
cat raychd-irc-1.0.0/DEBIAN/control
cd raychd-irc-1.0.0
ls -R
cat << 'EOF' > DEBIAN/control
Package: raychd-irc
Version: 1.0.0
Architecture: aarch64
Maintainer: Lead Developer <newssungoldentoday@gmail.com>
Description: Modular IRC engine inspired by InspIRCd.
Depends: bash
EOF

cat << 'EOF' > data/data/com.termux/files/usr/bin/raychd-irc
#!/data/data/com.termux/files/usr/bin/bash

echo "Starting raychd-irc engine..."
CONFIG_FILE="/data/data/com.termux/files/usr/share/raychd/conf/ircd.conf"

if [ -f "$CONFIG_FILE" ]; then
    echo "Loading configuration from $CONFIG_FILE"
else
    echo "Warning: No config file found at $CONFIG_FILE"
fi

echo "Engine initialized. Ready to load modules."
EOF

chmod 755 data/data/com.termux/files/usr/bin/raychd-irc
cd ..
dpkg-deb --build raychd-irc-1.0.0
pkg install ./raychd-irc-1.0.0.deb
raychd-irc
mkdir -p /data/data/com.termux/files/usr/share/raychd/conf/
touch /data/data/com.termux/files/usr/share/raychd/conf/ircd.conf
raychd-irc
cat << 'EOF' > /data/data/com.termux/files/usr/share/raychd/conf/ircd.conf
# Raychd IRC Configuration
server_name = "raychd.local"
port = 6667
admin_email = "newssungoldentoday@gmail.com"
max_connections = 100

# Module loading
load_module "auth"
load_module "channels"
EOF

cat << 'EOF' > /data/data/com.termux/files/usr/bin/raychd-irc
#!/data/data/com.termux/files/usr/bin/bash

# Configuration
CONFIG_FILE="/data/data/com.termux/files/usr/share/raychd/conf/ircd.conf"
SERVER="irc.libera.chat"
PORT=6667
NICK="RaychdUser"

echo "Starting raychd-irc engine..."

if [ -f "$CONFIG_FILE" ]; then
    echo "Loading configuration from $CONFIG_FILE"
fi

# IRC Connection Logic using netcat
echo "Connecting to $SERVER on port $PORT..."
{
    echo "NICK $NICK"
    echo "USER $NICK 0 * :Real Raychd IRC Client"
    # Keep the connection open to read
    cat
} | nc $SERVER $PORT
EOF

pkg install netcat
pkg install netcat-openbsd
raychd-irc
exit
