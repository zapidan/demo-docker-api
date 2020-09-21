#!/bin/bash

# [description]
#     Pip install all Python dependencies to the active environment
#     The appropriate environment must be active prior to invoking this script.
# [usage]
#     ./bin/install-pip-dependencies.sh


# failure is a natural part of life
set -e

pip install -U pip
pip install -r infrastructure/demo-docker-api-requirements.txt