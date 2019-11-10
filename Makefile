SHELL=/bin/bash

.PHONY: install
install:
	$(MAKE) image
	$(MAKE) volume
	$(MAKE) container

.PHONY: image
image:
	./bin/build_jenkins_image.sh

.PHONY: volume
volume:
	./bin/create_jenkins_home_volume.sh

.PHONY: container
container:
	./bin/start_docker.sh

.PHONY: clean
clean:
	./bin/clean.sh

.PHONY: nuke
nuke: clean
	docker image remove -f openjdk:8-jdk-slim