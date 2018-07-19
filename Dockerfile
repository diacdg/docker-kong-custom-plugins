FROM kong:0.12-centos

ENV KONG_VERSION 0.12.1

COPY custom-plugins/* /usr/local/share/lua/5.1/
# COPY kong-${KONG_VERSION}-0.rockspec /usr/local/lib/luarocks/rocks/kong/${KONG_VERSION}-0/kong-${KONG_VERSION}-0.rockspec

