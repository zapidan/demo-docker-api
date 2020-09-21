CONDA_ENV_NAME = demo_docker_api
DOCKERHUB_PREFIX := yourhubusername/demo-docker-api
VERSION := $(shell cat _version.py | sed -En 's/version = "(.+)"/\1/p')


# List all tasks here for better performance
.PHONY: install-py-pkg makecache/clear makecache/conda-env \
docker-build docker-run docker-push .docker-image-tag \
run-api-locally

install-py-pkg: makecache/conda-env
	source activate $(CONDA_ENV_NAME) && \
		./bin/install-py-package.sh

makecache/clear:
	rm -Rf $(PWD)/makecache

makecache/conda-env:
	./bin/make-conda-env.sh $(PWD)/infrastructure/demo-docker-api.yaml
	source activate $(CONDA_ENV_NAME) && \
		./bin/install-pip-dependencies.sh
	mkdir -p $(PWD)/makecache
	touch $(PWD)/makecache/conda-env

docker-build:
	cp ./infrastructure/Dockerfile ./Dockerfile
	docker build \
 		-t $(shell $(MAKE) .docker-image-tag) \
 		.
	rm ./Dockerfile

docker-run:
	docker run --rm \
        -e NAME="Daniela" \
		--entrypoint "/bin/bash" \
		-it -p 8080:8000 $(shell $(MAKE) .docker-image-tag) /start.sh

docker-push:
	#./bin/docker-push.sh docker-tag=$(shell $(MAKE) .docker-image-tag)

.docker-image-tag:
	@echo $(DOCKERHUB_PREFIX):$(VERSION)

run-api-locally: makecache/conda-env
	source activate $(CONDA_ENV_NAME) && \
	uvicorn demo-docker-api.main:app --reload