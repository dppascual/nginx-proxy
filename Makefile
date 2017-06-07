#
# Summary: Makefile to create Docker container image for Nginx proxy automatically
# Author: Daniel Peña <dppascual@gmail.com>
#
all: build

build:
	@docker build -t "dppascual/nginx-proxy:$$(cat VERSION)" .
