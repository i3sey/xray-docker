FROM teddysun/xray:latest

RUN apk add --no-cache socat

CMD ["socat", "TCP-LISTEN:3002,fork,reuseaddr", "TCP:${PROXY_TARGET_HOST}:3001"]
