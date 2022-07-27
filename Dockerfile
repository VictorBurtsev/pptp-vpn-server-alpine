FROM alpine:3.16

RUN apk add --no-cache \
            pptpd=~1 \
            iptables=~1 \
                && rm -rf /var/cache/apk/*

COPY ./etc/pptpd.conf /etc/pptpd.conf
COPY ./etc/ppp/pptpd-options /etc/ppp/pptpd-options

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["pptpd", "--fg"]
