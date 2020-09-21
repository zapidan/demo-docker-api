#!/bin/bash

# [description]
#     Install a Python package from source
# [usage]
#     ./bin/install-py-package.sh $(pwd)/py-pkg
#

# failure is a natural part of life
set -e

python3 setup.py develop || python3 setup.py develop --user