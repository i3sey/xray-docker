#!/bin/sh
set -e

# Redirect stdin from /dev/null to prevent TTY issues
exec < /dev/null

# Substitute environment variables in config
envsubst '${PROXY_TARGET_HOST}' < /etc/xray/config.json > /tmp/cfg.json

# Move the substituted config to the correct location
mv /tmp/cfg.json /etc/xray/config.json

# Execute the original command (xray)
exec "$@"