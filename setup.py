#!/usr/bin/env python

import glob

from setuptools import find_packages, setup

setup(
    name='argcomplete',
    version='3.1.6',
    packages=find_packages(exclude=["test", "test.*"]),
    scripts=glob.glob("scripts/*"),
    package_data={"argcomplete": ["bash_completion.d/_python-argcomplete", "py.typed"]},
    zip_safe=False,
    include_package_data=True,
    platforms=["MacOS X", "Posix"],
    install_requires=[
    ],
)
