.PHONY: clean

PACKAGE_NAME = argcomplete
VERSION = 3.1.6
DIR = /deb_dist/$(PACKAGE_NAME)-$(VERSION)


default: build

build:
	python3 setup.py --command-packages=stdeb.command sdist_dsc
	cd $(DIR) && dpkg-buildpackage -rfakeroot -uc -us
install:
	apt install ./deb_dist/python3-$(PACKAGE_NAME)_$(VERSION)-1_all.deb

uninstall:
	apt remove --purge python3-$(PACKAGE_NAME) -y

clean:
	rm -rf deb_dist
	rm -rf build