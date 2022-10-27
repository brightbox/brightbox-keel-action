FROM alpine:3.16

RUN apk add --no-cache --update curl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
