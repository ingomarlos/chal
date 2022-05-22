FROM ubuntu:20.04

RUN apt update
RUN apt install -y vim \
  wget \
  curl \
  make
  

RUN wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -O /usr/bin/lein && \
  chmod +x /usr/bin/lein
  
RUN cat /usr/bin/lein
WORKDIR ./kaniko/buildcontext

RUN ls -lR && \
  make libs && \
  make all
  
