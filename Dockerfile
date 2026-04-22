FROM alpine:3.19

ENV XRAY_VERSION=1.8.6

RUN apk add --no-cache curl ca-certificates tzdata wget gettext

RUN curl --max-time 120 -L -o /tmp/xray.zip \
    "https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip" \
    && unzip -o /tmp/xray.zip -d /usr/local/bin \
    && rm /tmp/xray.zip

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN adduser -S -D -H xray 2>/dev/null || true

COPY config.json /etc/xray/config.json
RUN chown xray:xray /etc/xray/config.json

USER xray

EXPOSE 3002

ENTRYPOINT ["/entrypoint.sh"]
CMD ["xray", "run", "-c", "/etc/xray/config.json"]