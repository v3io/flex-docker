FROM alpine:3.21

COPY hack/scripts/deploy.sh /usr/local/bin
COPY hack/scripts/install.sh /install.sh

COPY docker-flexvol.sh /docker

CMD ["/bin/ash","/usr/local/bin/deploy.sh"]