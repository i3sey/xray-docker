#!/bin/sh
set -e
exec 0</dev/null
envsubst '${PROXY_TARGET_HOST}' < /etc/xray/config.json > /tmp/cfg.json
mv /tmp/cfg.json /etc/xray/config.json
exec "$@"