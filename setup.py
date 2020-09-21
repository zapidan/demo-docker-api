#!/usr/bin/env python
# -*- coding: utf-8 -*-

# ************************************************************* #
# Copyright 2020 Uptake Technologies, Inc. All Rights Reserved. #
# ************************************************************* #

from setuptools import find_packages
from setuptools import setup

# -- PACKAGE VERSION -- #
# get `version` variable
import _version

#########################

testing_packages = [
    "black",
    "pycodestyle",
    "pytest",
    "requests",
    "responses",
]

setup(
    name="demo-docker-api",
    python_requires=">=3.8.0",
    version=_version.version,
    description="Launches the demo docker api",
    author="",
    author_email="",
    packages=find_packages(),
    extras_require={"all": testing_packages},
    test_suite="tests",
)