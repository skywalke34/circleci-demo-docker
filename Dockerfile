FROM alpine:3.12

ENV AWS AIDAJQABLZS4A3QDU576

ADD ./workdir/contacts /usr/bin/contacts
ADD ./db/migrations /migrations
RUN apk update && \
    apk add --no-cache openssh-keygen
        
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keygen -f /root/.ssh/id_rsa

ENTRYPOINT contacts
