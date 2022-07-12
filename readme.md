BUILD:
docker build -t spamassassin .

INIT:
docker run -it -v c:/temp/spamassassin:/var/lib/spamassassin --entrypoint sa-update spamassassin -v

RUN:
docker run -d -p 783:783 -v c:/temp/spamassassin:/var/lib/spamassassin spamassassin -A 0.0.0.0



docker pull registry.cwtech.at/zetanova/docker-spamassassin


docker run -it -v /srv/spamassassin:/var/lib/spamassassin --entrypoint sa-update \
	registry.cwtech.at/zetanova/docker-spamassassin -v

	
docker run -it -d --name spamassassin \
	--restart always \
	-p 783:783 -v /srv/spamassassin:/var/lib/spamassassin \
	registry.cwtech.at/zetanova/docker-spamassassin -A 0.0.0.0/0

