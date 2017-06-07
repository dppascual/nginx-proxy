# dppascual/nginx-proxy:0.1

- [Introduction](#introduction)
- [Getting started](#getting-started)
  - [Installation](#installation)
  - [Quickstart](#quickstart)

# Introduction

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [Nginx](http://nginx.org/en/).

Nginx [engine x] is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server.

# Getting started

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/u/dppascual/nginx-proxy) and is the recommended method of installation.

```bash
docker pull dppascual/nginx-proxy:0.1
```

Alternatively you can build the image yourself.

```bash
docker build -t dppascual/nginx-proxy:0.1 github.com/dppascual/nginx-proxy
```

## Quickstart

The configuration related to websites is stored in the websites directory so if you want to add a new website behind this HTTP proxy, you should set up a new configuration file as you can see below and store it in that directory:

```nginx
upstream api {
    server webapp;
}

server {
    listen 80;
        server_name api.kernoslabs.com;

        location / {
                proxy_pass http://api;
        }

        include websites/request-denied.include;
}
```

Start Nginx using:

```bash
docker service create --name proxy-server --mode=global \
  --publish "80:80" \
  dppascual/nginx-proxy:0.1
```
