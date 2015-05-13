IMAGE=mcandre/docker-nsd

all: run

build: Dockerfile
	docker build -t $(IMAGE) .

run: clean-containers build
	$(eval CONTAINER=$(shell docker run -d -p 53:53/udp -p 53:53/tcp $(IMAGE)))
	docker exec $(CONTAINER) nsd-checkconf /etc/nsd3/nsd.conf
	dig @$$(boot2docker ip) www.google.com +short
	dig @$$(boot2docker ip) www.sneaky.net +short
	dig @$$(boot2docker ip) -x 3.141.59.26 +noall +authority

clean-containers:
	-docker ps -a | grep -v IMAGE | awk '{ print $$1 }' | xargs docker rm -f

clean-images:
	-docker images | grep -v IMAGE | grep $(IMAGE) | awk '{ print $$3 }' | xargs docker rmi -f

clean: clean-containers clean-images

publish:
	docker push $(IMAGE)
