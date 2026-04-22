#!/bin/sh
set -e

# Substitute environment variables in config to a temp file first, then swap
# This avoids issues when input and output are the same file on certain filesystems/shells
tmpfile=$(mktemp)
envsubst < /etc/xray/config.json > "$tmpfile"
cat "$tmpfile" > /etc/xray/config.json
rm -f "$tmpfile"

exec "$@"