FROM teddysun/xray:latest

COPY config.json /etc/xray/config.json

CMD ["sh", "-c", "sed -i 's/\\${PROXY_TARGET_HOST}/$PROXY_TARGET_HOST/g' /etc/xray/config.json && xray run -c /etc/xray/config.json"]