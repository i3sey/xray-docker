#!/bin/sh
set -e

# Substitute environment variables in config
envsubst < /etc/xray/config.json > /etc/xray/config.json

exec "$@"