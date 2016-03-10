FROM alpine:latest
MAINTAINER o_tee_one <o_tee_one@r0x.tw>

ENV PASSWORD "changeme"
ENV GAME_NAME "r0x.tw - new server"
ENV MAX_CLIENTS 64
ENV GAME_MAP "blmapV3"

RUN apk add --update pwgen && apk add --update openssl && rm -rf /var/cache/apk/*
RUN cd / \
  && wget http://ddnet.tw/downloads/DDNet-9.2-linux_x86_64.tar.gz \
  && tar -zxvf DDNet-9.2-linux_x86_64.tar.gz \
  && mv DDNet-9.2-linux_x86_64 DDNet \

COPY blmapV3.map /DDNet/data/maps/blmapV3.map
COPY run.bash /run.bash
COPY ddrace.cfg /ddrace.cfg
COPY blocker.cfg /blocker.cfg

RUN chmod +x /run.bash

EXPOSE 8303/udp
CMD ["/run.bash"]
