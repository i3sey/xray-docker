#!/bin/sh
set -e

# Substitute environment variables in config
envsubst < /etc/xray/config.json > /tmp/config.json
mv /tmp/config.json /etc/xray/config.json

exec "$@"