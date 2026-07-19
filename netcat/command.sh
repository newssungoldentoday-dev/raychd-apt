#!/usr/bin/env bash
#
# command.sh — prints the raychd command reference
#
# Usage:
#   ./command.sh

cat <<'EOF'
raychd command reference
=========================

  /join #channel               join a channel
  /part #channel [msg]         leave a channel
  /msg <target> <text>         send a message to a channel or user
  /me <text>                   send an action to the current channel
  /nick <newnick>              change your nickname
  /topic #channel [text]       view or set a channel topic
  /kick #channel <nick> [msg]  kick a user from a channel
  /mode <target> <flags>       set user or channel modes
  /whois <nick>                look up info on a user
  /whowas <nick>               look up info on a disconnected user
  /invite <nick> #channel      invite a user to a channel
  /notice <target> <text>      send a notice
  /away [msg]                  mark yourself away (no arg clears it)
  /list                        list channels on the server
  /names #channel              list users in a channel
  /ctcp <target> <cmd>         send a CTCP request (e.g. VERSION)
  /raw <text>                  send a raw IRC line to the server
  /quit [msg]                  disconnect and exit
  /help                        show this list again

Anything typed without a leading "/" is sent as a message to the
current channel.
EOF
