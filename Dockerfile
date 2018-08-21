FROM alpine:3.8

ENV SPAMASSASSIN_VERSION=3.4.1-r8

RUN apk add --update spamassassin=${SPAMASSASSIN_VERSION} && \
	rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

#COPY rootfs/ /

#RUN sa-update

VOLUME /var/lib/spamassassin

EXPOSE 783

ENTRYPOINT ["spamd", "-i"]

