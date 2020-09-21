FROM continuumio/miniconda3
ENV CONDA_ENV_NAME="demo_docker_api"

# create conda env
COPY ./infrastructure/demo-docker-api.yaml /infra/manifest.yaml
COPY ./infrastructure/demo-docker-api-requirements.txt /infra/requirements.txt
RUN conda env create --file /infra/manifest.yaml

# install other required dependencies
RUN ["bin/bash", "-c", "source activate ${CONDA_ENV_NAME} && pip install -r /infra/requirements.txt"]

# Visually verify conda installations
RUN ["bin/bash", "-c", "source activate ${CONDA_ENV_NAME} && pip list"]

# copy start scripts
COPY ./infrastructure/start.sh /start.sh
COPY ./infrastructure/runner.py /runner.py

# copy source code
COPY ./demo-docker-api/ /app
COPY ./setup.py /app/setup.py
COPY ./_version.py /app/_version.py
COPY ./config.toml ./config.toml

# install the demo-docker-api package to the conda environment
RUN ["bin/bash", "-c", "source activate ${CONDA_ENV_NAME} && \
        pip install --user --upgrade pip setuptools && \
        pip install /app/"]

ENTRYPOINT ["/bin/bash", "start.sh"]