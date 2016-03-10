FROM alpine:latest
MAINTAINER o_tee_one <o_tee_one@r0x.tw>

ENV GAME_NAME "r0x.tw - new server"
ENV MAX_CLIENTS 64
ENV GAME_MAP "blmapV3"

RUN apk add --update pwgen && rm -rf /var/cache/apk/*
RUN cd / \
  wget https://ddnet.tw/downloads/DDNet-9.2-linux_x86_64.tar.gz \
  && tar -zxvf DDNet-9.2-linux_x86_64.tar.gz \
  && mv DDNet-9.2-linux_x86_64 DDNet
  && cd DDNet
  
COPY run.bash /run.bash
COPY ddrace.cfg /ddrace.cfg
COPY blocker.cfg /blocker.cfg

RUN chmod +x /run.bash

EXPOSE 8303/udp
CMD ["/run.bash"]
