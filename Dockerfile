FROM alpine:3.4

RUN apk update
RUN apk add vim \
  wget \
  curl \
  make \
  bash
  

RUN wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -O /usr/bin/lein && \
  chmod +x /usr/bin/lein
  
RUN cat /usr/bin/lein
WORKDIR ./kaniko/buildcontext

RUN ls -lR && \
  make libs && \
  make all
