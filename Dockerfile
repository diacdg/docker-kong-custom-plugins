ARG KONG_DOCKER_VERSION
FROM kong:$KONG_DOCKER_VERSION

ENV KONG_VERSION 0.12.1

COPY custom-plugins/* /usr/local/share/lua/5.1/

