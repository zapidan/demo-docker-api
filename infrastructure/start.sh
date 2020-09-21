#!/bin/bash

# [description]
#     Launch the Python model runner wrapper inside a Job Service Docker container
#     Assumes this is running in the root container on the Docker container
#     in the same directory as the runner Python module.

# failure is a natural part of life
set -e

source activate demo_docker_api

echo "Starting Demo Docker API with the following environment:"

pip list

python runner.py