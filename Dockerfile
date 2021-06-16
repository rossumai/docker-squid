FROM alpine:3.14.0

RUN apk update \
    && apk upgrade \
    && apk add squid \
    && rm -rf /var/cache/apk/*

EXPOSE 3128

CMD ["sh", "-c", "(tail -F /var/log/squid/access.log &) && /usr/sbin/squid -f /etc/squid/squid.conf -NYCd 1"]
