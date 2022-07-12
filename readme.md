BUILD:
docker build --build-arg 3.4.6-1build3 -t zetanova/spamassassin:3.4.6 -t zetanova/spamassassin  .

INIT:
docker volume create spamassassin
docker run -it --rm \
	-v spamassassin:/var/lib/spamassassin \
	zetanova/spamassassin \
	sa-update -v

TEST:
docker run --rm -p 783:783 -v spamassassin:/var/lib/spamassassin zetanova/spamassassin

RUN
docker run -it -d --name spamassassin \
	--restart always \
	-p 783:783 -v spamassassin:/var/lib/spamassassin \
	zetanova/docker-spamassassin


UPDATE POLICY
1) docker exec --user root spamassassin sa-update -v
1) docker exec spamassassin sa-update -v --nogpg
