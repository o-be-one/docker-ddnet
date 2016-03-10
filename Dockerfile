FROM alpine:latest
MAINTENER o_tee_one <o_tee_one@r0x.tw>

ENV GAME_TYPE ddrace

RUN cd / \
  wget https://ddnet.tw/downloads/DDNet-9.2-linux_x86_64.tar.gz \
  && tar -zxvf DDNet-9.2-linux_x86_64.tar.gz \
  && cd DDNet-9.2-linux_x86_64
  
COPY run.bash /run.bash
COPY ddrace.cfg
COPY blocker.cfg

RUN chmod +x /run.bash

EXPOSE 8303/udp
CMD ["/run.bash"]
