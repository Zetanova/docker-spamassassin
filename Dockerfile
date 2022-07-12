FROM ubuntu:jammy

ENV SPAMASSASSIN_VERSION=3.4.6-1build3

RUN apt-get update && apt-get install -y spamassassin=${SPAMASSASSIN_VERSION} \
	&& rm -rf /var/lib/apt/lists/*

#RUN sa-update

USER spamassassin

VOLUME /var/lib/spamassassin

EXPOSE 783

ENTRYPOINT ["spamd", "-i"]
