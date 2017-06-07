# Version: latest
FROM ubuntu:latest
ENV REFRESHED_AT 2017-05-09
RUN apt-get -qq update \
 && apt-get install -qqy nginx
EXPOSE 80
ADD nginx.conf /etc/nginx/
ADD websites /etc/nginx/websites/
ENTRYPOINT ["/usr/sbin/nginx"]
