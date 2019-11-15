SHELL=/bin/bash

.PHONY: install
install:
	$(MAKE) volume
	$(MAKE) image_intermediate
	$(MAKE) image
	$(MAKE) setup_docker

.PHONY: image_intermediate
image_intermediate:
	./bin/build_jenkins_intermediate_image.sh

.PHONY: image
image:
	./bin/build_jenkins_image.sh

.PHONY: volume
volume:
	./bin/create_jenkins_home_volume.sh

.PHONY: setup_docker
container:
	./bin/setup_docker.sh

.PHONY: start_docker
start_docker:
	./bin/start_docker.sh

.PHONY: stop_docker
stop_docker:
	./bin/stop_docker.sh

.PHONY: clean
clean:
	./bin/clean.sh

.PHONY: nuke
nuke: clean
	docker image remove -f openjdk:8-jdk-slim
