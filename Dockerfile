FROM debian

# https://github.com/Starefossen/docker-gifsicle
MAINTAINER Dylan <dylanninin@gmail.com> version: latest

RUN apt-get update
RUN apt-get install -y --no-install-recommends dh-autoreconf && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ADD . .

RUN autoreconf -i && ./configure && make && make install

ENTRYPOINT ["/usr/local/bin/gifsicle"]
CMD ["--help"]
