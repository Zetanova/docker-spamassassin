BUILD:
docker build -t spamassassin .

INIT:
docker run -it -v c:/temp/spamassassin:/var/lib/spamassassin --entrypoint sa-update spamassassin -v

RUN:
docker run -it -p 783:783 -v c:/temp/spamassassin:/var/lib/spamassassin spamassassin 0.0.0.0 -A 0.0.0.0