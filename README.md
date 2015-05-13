# docker-nsd - a Docker container for NSD

# DOCKER HUB

https://registry.hub.docker.com/u/mcandre/docker-nsd/

# EXAMPLE

```
$ make
docker exec 8f28708c483527ba9a39e44ffe576029aaa8ccc4a060941b4f0326b2aff351c0 nsd-checkconf /etc/nsd3/nsd.conf
dig @$(boot2docker ip) www.google.com +short
dig @$(boot2docker ip) www.sneaky.net +short
3.141.59.26
dig @$(boot2docker ip) -x 3.141.59.26 +noall +authority

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
* [Vagrant](https://www.vagrantup.com/)
* [boot2docker](http://boot2docker.io/)

### Mac OS X

* [Xcode](http://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12)
* [Homebrew](http://brew.sh/)
* [brew-cask](http://caskroom.io/)

```
$ brew cask install virtualbox vagrant
$ brew install boot2docker
```

### Windows

* [Chocolatey](https://chocolatey.org/)

```
> chocolatey install docker bind-toolsonly make
```
