FROM alpine:latest

WORKDIR /opt/knxd
ENV DEPS="automake libtool m4 argp-standalone linux-headers libusb-dev cmake make libev-dev autoconf gcc g++ bash automake pkgconfig git"
RUN CONFIG_SHELL=/bin/bash \
apk add --no-cache $DEPS && \
git clone https://github.com/knxd/knxd.git /opt/knxd && \
chmod +x bootstrap.sh &&\
./bootstrap.sh &&\
./configure \
--enable-busmonitor \
--disable-systemd \
--enable-ft12 \
--enable-tpuart \
--enable-eibnetip \
--enable-eibnetiptunnel \
--enable-usb \
--enable-eibnetipserver \
--enable-groupcache && \
make && \
make install && \
rm -rf /opt/knxd && \
apk del $DEPS

RUN apk add libstdc++ libusb libev
ADD ./start.sh /opt/start.sh
RUN chmod +x /opt/start.sh
WORKDIR /opt
CMD ["sh", "/opt/start.sh"]
