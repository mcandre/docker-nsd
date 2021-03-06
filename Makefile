IMAGE=mcandre/docker-nsd:latest

all: run

build: Dockerfile
	docker build -t $(IMAGE) .

run: clean-containers build
	$(eval CONTAINER=$(shell docker run -d -p 53:53/udp -p 53:53/tcp $(IMAGE)))
	docker exec $(CONTAINER) nsd-checkconf /etc/nsd/nsd.conf
	dig @$$(docker-machine ip default) www.google.com +trace
	dig @$$(docker-machine ip default) www.sneaky.net +noall +authority
	dig @$$(docker-machine ip default) -x 3.141.59.26 +noall +authority

clean-containers:
	-docker ps -a | grep -v IMAGE | awk '{ print $$1 }' | xargs docker rm -f

clean-images:
	-docker images | grep -v IMAGE | grep $(IMAGE) | awk '{ print $$3 }' | xargs docker rmi -f

clean-layers:
	-docker images | grep -v IMAGE | grep none | awk '{ print $$3 }' | xargs docker rmi -f

clean: clean-containers clean-images clean-layers

editorconfig:
	flcl . | xargs -n 100 editorconfig-cli check

dockerlint:
	$(shell npm bin)/dockerlint

lint: editorconfig dockerlint

publish:
	docker push $(IMAGE)
