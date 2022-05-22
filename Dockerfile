FROM alpine:3.4

RUN apk update
RUN apk add vim \
  wget \
  curl \
  make \
  bash \
  openjdk12-jdk-12.0.2_p10-r3
  

RUN wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -O /usr/bin/lein && \
  chmod +x /usr/bin/lein
  
RUN cat /usr/bin/lein
WORKDIR ./kaniko/buildcontext

RUN ls -lR && \
  make libs && \
  make all
