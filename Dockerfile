FROM teddysun/xray:latest

RUN apk add --no-cache gettext

COPY config.json /etc/xray/config.json

CMD ["sh", "-c", "envsubst '${PROXY_TARGET_HOST}' < /etc/xray/config.json > /tmp/cfg.json && mv /tmp/cfg.json /etc/xray/config.json && xray run -c /etc/xray/config.json"]