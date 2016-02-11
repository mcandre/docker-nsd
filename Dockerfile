FROM ubuntu
MAINTAINER Andrew Pennebaker <andrew.pennebaker@gmail.com>
COPY nsd.conf /etc/nsd/nsd.conf
COPY sneaky.net.zone /etc/nsd/sneaky.net.zone
COPY 59.141.3.in-addr.arpa.zone /etc/nsd/59.141.3.in-addr.arpa.zone
RUN apt-get update && \
    apt-get install -o Dpkg::Options::="--force-confold" --force-yes -y nsd openssl && \
    nsd-control-setup && \
    mkdir -p /run/nsd && \
    touch /run/nsd/nsd.pid
EXPOSE 53/udp 53/tcp
ENTRYPOINT ["/usr/sbin/nsd", "-d", "-c", "/etc/nsd/nsd.conf"]
