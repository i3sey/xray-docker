#!/bin/sh
set -e

echo "[entrypoint] Starting..."

# Close stdin to prevent any process from hanging on it
echo "[entrypoint] Closing stdin..."
exec 0</dev/null
echo "[entrypoint] stdin closed"

# Ensure config is readable
echo "[entrypoint] Setting permissions on /etc/xray/config.json..."
chmod 644 /etc/xray/config.json
echo "[entrypoint] Permissions set"

# Show current config
echo "[entrypoint] Current PROXY_TARGET_HOST=${PROXY_TARGET_HOST}"
echo "[entrypoint] Current config content:"
cat /etc/xray/config.json
echo "[entrypoint] --- end config ---"

# Substitute variables via temp file + atomic rename
TMPFILE=/tmp/xray_config_subst.json
echo "[entrypoint] Running envsubst..."
envsubst '${PROXY_TARGET_HOST}' < /etc/xray/config.json > "$TMPFILE"
echo "[entrypoint] envsubst done"

mv "$TMPFILE" /etc/xray/config.json
echo "[entrypoint] Config updated"

echo "[entrypoint] Config after substitution:"
cat /etc/xray/config.json
echo "[entrypoint] --- end after ---"

echo "[entrypoint] Launching: $@"
exec "$@"