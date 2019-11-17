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
setup_docker:
	./bin/setup_docker.sh

.PHONY: container
container:
	./bin/make_container.sh

.PHONY: start_container
start_container:
	./bin/start_container.sh

.PHONY: stop_container
stop_container:
	./bin/stop_container.sh

.PHONY: clean
clean:
	./bin/clean.sh

.PHONY: nuke
nuke: clean
	docker image remove -f openjdk:8-jdk-slim
