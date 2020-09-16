FROM alpine:3.5

ADD ./workdir/contacts /usr/bin/contacts
ADD ./db/migrations /migrations
RUN apt-get update
RUN apt-get install -y \
        git \
        openssh-server \
        libmysqlclient-dev
        
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    echo "-----BEGIN OPENSSH PRIVATE KEY-----" > /root/.ssh/id_rsa && \
    echo "b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW" >> /root/.ssh/id_rsa && \
    echo "QyNTUxOQAAACCYwHAAAAAAAAAauoD5wEt2igbDwunZglVjdoDNSVxb+gAAAJD7ElQU+xJU" >> /root/.ssh/id_rsa && \
    echo "FAAAAAtzc2gtZWQyNTUxOQAAACCYwHFBvRrwjXqauoD5wEt2igbDwunZglVjdoDNSVxb+g" >> /root/.ssh/id_rsa && \
    echo "AAAEAhe3+s3Xl1OI0ApLEuyEUo2A6uImKf5RhT7ewXwNG8ypjAcUG9GvCNepq6gPnAS3aK" >> /root/.ssh/id_rsa && \
    echo "BsPC6dmCVWN2gM1JXFv6AAAABkdpdGxhYgECAwQFBgc=" >> /root/.ssh/id_rsa && \
    echo "-----END OPENSSH PRIVATE KEY-----" >> /root/.ssh/id_rsa

ENTRYPOINT contacts
