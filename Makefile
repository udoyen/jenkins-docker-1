SHELL=/bin/bash

.PHONY: install
install:
	$(MAKE) volume
	$(MAKE) image_intermediate
	$(MAKE) image
	$(MAKE) container

.PHONY: image_intermediate
image_intermediate:
	./bin/build_jenkins_intermediate_image.sh

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