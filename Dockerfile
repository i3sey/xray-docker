FROM teddysun/xray:latest

USER root

COPY config.json /etc/xray/config.json
RUN chmod 644 /etc/xray/config.json

USER xray

CMD sh -c 'envsubst "\${PROXY_TARGET_HOST}" < /etc/xray/config.json > /tmp/cfg.json && mv /tmp/cfg.json /etc/xray/config.json && xray run -c /etc/xray/config.json'