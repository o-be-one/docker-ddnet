#### TODO !!!!!!!!!!!!!!!!!

FROM alpine:latest
MAINTENER o_tee_one <o_tee_one@r0x.tw>

ENV GAME_TYPE ddrace

RUN wget https://ddnet.tw/downloads/DDNet-9.2-linux_x86_64.tar.gz \
  && tar -zxvf DDNet-9.2-linux_x86_64.tar.gz \
  && cd DDNet-9.2-linux_x86_64
  
COPY tw.bash /tw.bash
COPY ddrace.cfg

RUN chmod +x /tw.bash

EXPOSE 8303/udp
CMD ["/rtw.bash"]
