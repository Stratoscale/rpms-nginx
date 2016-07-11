
all: build

mkfile_path := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
mkfile_dir:=$(shell cd $(shell dirname $(mkfile_path)); pwd)
current_dir:=$(notdir $(mkfile_dir))

build:
	sudo docker run --rm -i --name=rpm-builder -v `pwd`:/home/makerpm/$(current_dir) rackattack-nas.dc1:5000/stratoscale/fedora-binary-rpm-builder-base:latest /bin/bash -c "make -f Makefile.nginx -C /home/makerpm/$(current_dir) && make -f Makefile.nginx -C /home/makerpm/$(current_dir) publish"
