#!/bin/bash

sed -i -e "s/^PACKAGE_NAME.*/PACKAGE_NAME = $PACKAGE_NAME/" -e "s/^VERSION.*/VERSION = $VERSION/" Makefile
sed -i -e "s/argcomplete/$PACKAGE_NAME/g" -e "s/3.1.6/$VERSION/g" setup.py
make