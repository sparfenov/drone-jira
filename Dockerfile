FROM alpine

ADD jira.sh /bin/

RUN apk update && \
	apk add curl ca-certificates && \
    rm -rf /var/cache/apk/*

RUN chmod +x /bin/jira.sh
RUN apk -Uuv add curl ca-certificates

ENTRYPOINT /bin/jira.sh
