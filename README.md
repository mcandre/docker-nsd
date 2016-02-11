# docker-nsd - a Docker container for NSD

# DOCKER HUB

https://registry.hub.docker.com/u/mcandre/docker-nsd/

# EXAMPLE

```
$ make
docker exec 583c66f769c41a81f803866a9250b0cf0e0c52612cddcbe8e549dc2f0830080a nsd-checkconf /etc/nsd/nsd.conf
dig @$(docker-machine ip default) www.google.com +trace

; <<>> DiG 9.8.3-P1 <<>> @192.168.59.103 www.google.com +trace
; (1 server found)
;; global options: +cmd
;; Received 17 bytes from 192.168.59.103#53(192.168.59.103) in 0 ms

dig @$(docker-machine ip default) www.sneaky.net +noall +authority

; <<>> DiG 9.8.3-P1 <<>> @192.168.59.103 www.sneaky.net +noall +authority
; (1 server found)
;; global options: +cmd
sneaky.net.		259200	IN	NS	root.localhost.
sneaky.net.		259200	IN	NS	localhost.
dig @$(docker-machine ip default) -x 3.141.59.26 +noall +authority

; <<>> DiG 9.8.3-P1 <<>> @192.168.59.103 -x 3.141.59.26 +noall +authority
; (1 server found)
;; global options: +cmd
59.141.3.in-addr.arpa.	10800	IN	SOA	root.localhost. root.sneaky.net. 2015050504 43200 900 1814400 10800
```

# ABOUT

docker-nsd is an example Docker container for a caching DNS resolver and master DNS authority.

# REQUIREMENTS

* [Docker](https://www.docker.com/)
* [dig](http://man.cx/dig)

## Optional

* [make](http://www.gnu.org/software/make/)
* [Node.js](https://nodejs.org/en/) (for dockerlint)

## Debian/Ubuntu

```
$ sudo apt-get install docker.io build-essential dnsutils
```

## RedHat/Fedora/CentOS

```
$ sudo yum install docker-io bind-utils
```

## non-Linux

* [VirtualBox](https://www.virtualbox.org/)
* [Docker Toolbox](https://www.docker.com/toolbox)

### Mac OS X

* [Xcode](http://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12)
* [Homebrew](http://brew.sh/)
* [brew-cask](http://caskroom.io/)

```
$ brew cask install dockertoolbox
```

### Windows

* [Chocolatey](https://chocolatey.org/)

```
> chocolatey install docker bind-toolsonly make
```

* [DockerToolbox-1.8.2c.exe](https://github.com/docker/toolbox/releases/download/v1.8.2c/DockerToolbox-1.8.2c.exe)
