FROM ubuntu:10.04
MAINTAINER Andrew Pennebaker <andrew.pennebaker@gmail.com>
ADD nsd.conf /etc/nsd/nsd.conf
ADD sneaky.net.zone /etc/nsd/sneaky.net.zone
ADD 59.141.3.in-addr.arpa.zone /etc/nsd/59.141.3.in-addr.arpa.zone
RUN apt-get update && \
    apt-get install -y nsd && \
    mkdir -m 0775 -p /var/run/nsd && \
		chown -R nsd:nsd /var/run/nsd && \
    nsdc rebuild
EXPOSE 53/udp 53/tcp
ENTRYPOINT /usr/sbin/nsd -d
