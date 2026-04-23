FROM teddysun/xray:latest

RUN apt-get update && apt-get install -y gettext && rm -rf /var/lib/apt/lists/*

COPY config.json /etc/xray/config.json

CMD ["sh", "-c", "envsubst '${PROXY_TARGET_HOST}' < /etc/xray/config.json > /tmp/cfg.json && mv /tmp/cfg.json /etc/xray/config.json && xray run -c /etc/xray/config.json"]