CONDA_ENV_NAME = demo_docker_api
VERSION := $(shell cat _version.py | sed -En 's/version = "(.+)"/\1/p')


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
