FROM teddysun/xray:latest

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY config.json /etc/xray/config.json

ENTRYPOINT ["/entrypoint.sh"]
CMD ["xray", "run", "-c", "/etc/xray/config.json"]