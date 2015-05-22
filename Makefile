IMAGE=mcandre/docker-nsd:4

all: run

build: Dockerfile
	docker build -t $(IMAGE) .

run: clean-containers build
	$(eval CONTAINER=$(shell docker run -d -p 53:53/udp -p 53:53/tcp $(IMAGE)))
	docker exec $(CONTAINER) nsd-checkconf /etc/nsd/nsd.conf
	dig @$$(boot2docker ip) www.google.com +trace
	dig @$$(boot2docker ip) www.sneaky.net +noall +authority
	dig @$$(boot2docker ip) -x 3.141.59.26 +noall +authority

clean-containers:
	-docker ps -a | grep -v IMAGE | awk '{ print $$1 }' | xargs docker rm -f

clean-images:
	-docker images | grep -v IMAGE | grep $(IMAGE) | awk '{ print $$3 }' | xargs docker rmi -f

clean-layers:
	-docker images | grep -v IMAGE | grep none | awk '{ print $$3 }' | xargs docker rmi -f

clean: clean-containers clean-images clean-layers

publish:
	docker push $(IMAGE)
