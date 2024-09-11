## BUILD
docker build --build-arg 4.0.0* -t zetanova/spamassassin:4.0.0 -t zetanova/spamassassin  .

## INIT
docker volume create spamassassin
docker run -it --rm \
	-v spamassassin:/var/lib/spamassassin \
	--user root \
	zetanova/spamassassin \
	sa-update -v

## TEST
docker run --rm -p 783:783 -v spamassassin:/var/lib/spamassassin zetanova/spamassassin --allowed-ips=0.0.0.0/0

## RUN
docker run -it -d --name spamassassin \
	--restart unless-stopped \
	-p 783:783 -v spamassassin:/var/lib/spamassassin \
	zetanova/spamassassin --allowed-ips=0.0.0.0/0


## UPDATE
docker exec --user root spamassassin sa-update -v
or) docker exec spamassassin sa-update -v --nogpg

## RELOAD
docker kill --signal=HUP spamassassin
