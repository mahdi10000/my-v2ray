FROM alpine:latest

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
    && mkdir /mtech \
    && curl -L -H "Cache-Control: no-cache" -o /mtech/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip /mtech/v2ray.zip -d /mtech \
    && chmod +x /mtech/v2ray \
    && rm -rf /mtech/v2ray.zip

COPY config.json /mtech/config.json

CMD ["/mtech/v2ray", "run", "-config", "/mtech/config.json"]
