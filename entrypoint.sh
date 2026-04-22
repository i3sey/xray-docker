#!/bin/sh
set -e

exec 0</dev/null

chmod 644 /etc/xray/config.json 2>/dev/null || true

TMP=/tmp/cfg.json
envsubst '${PROXY_TARGET_HOST}' < /etc/xray/config.json > "$TMP"
mv "$TMP" /etc/xray/config.json

exec "$@"