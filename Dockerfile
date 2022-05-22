FROM ubuntu:22.04

RUN apt update
RUN apt install -y vim \
  wget \
  curl \
  make \
  openjdk-11-jdk

RUN wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -O /usr/bin/lein && \
  chmod +x /usr/bin/lein
  
RUN cat /usr/bin/lein
WORKDIR ./kaniko/buildcontext
RUN make libs && \
  make all && \
  mkdir /app && \
  cp build/* /app/

WORKDIR /app

