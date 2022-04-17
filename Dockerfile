FROM alpine:3.15.4
WORKDIR /opt
ADD webmin.tar.gz install.sh /opt/
COPY install.sh /opt
RUN apk add -U --no-cache perl perl-net-ssleay openrc
ENTRYPOINT [ "sh", "install.sh" ]
EXPOSE 10000