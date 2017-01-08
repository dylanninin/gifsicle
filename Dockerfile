FROM alpine

# https://github.com/Starefossen/docker-gifsicle
MAINTAINER Dylan <dylanninin@gmail.com> version: lossy

# RUN apt-get update
#RUN apt-get install -y --no-install-recommends dh-autoreconf && rm -rf /var/lib/apt/lists/*
RUN apk add --no-cache alpine-sdk autoconf automake

WORKDIR /app

ADD . .

RUN autoreconf -i && ./configure && make && make install

ENTRYPOINT ["/usr/local/bin/gifsicle"]
CMD ["--help"]
