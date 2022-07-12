FROM ubuntu:jammy

ARG SPAMASSASSIN_VERSION=3.4.6-1build3

RUN apt-get update && apt-get install -y spamassassin=${SPAMASSASSIN_VERSION} \
	&& rm -rf /var/lib/apt/lists/*

#RUN sa-update

RUN groupadd -r spamd && useradd --no-log-init -r -g spamd spamd

USER spamd

VOLUME /var/lib/spamassassin

EXPOSE 783

CMD ["spamd", "-i", "--syslog=stderr", "--allowed-ips=0.0.0.0"]
