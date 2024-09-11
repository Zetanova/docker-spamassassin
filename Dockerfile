FROM ubuntu:noble

ARG SPAMASSASSIN_VERSION=4.0.0-8ubuntu5

ENV TZ="Europe/Vienna"

RUN apt-get update && apt-get install -yq \
    spamassassin=${SPAMASSASSIN_VERSION} \
    sa-compile=${SPAMASSASSIN_VERSION} \
	&& rm -rf /var/lib/apt/lists/*

#RUN sa-update

RUN groupadd -r spamd && useradd --no-log-init -r -g spamd spamd \
    && mkdir /home/spamd && chown spamd:spamd /home/spamd

USER spamd

VOLUME /var/lib/spamassassin

EXPOSE 783

CMD ["spamd", "-i", "--syslog=stderr", "--allowed-ips=0.0.0.0/0"]
