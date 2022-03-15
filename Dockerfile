FROM debian:stable
LABEL maintainer="Egidio Docile <egdoc.dev@gmail.com>"

ARG UID=1000
ENV PREFIX="/usr/local"
ENV WITH_FEATURES="huge"

RUN apt-get update && apt-get install -y \
  build-essential \
  libncurses5-dev \
  libatk1.0-dev \
  libcairo2-dev \
  libxpm-dev \
  libxt-dev \
  python2-dev \
  python3-dev \
  git

RUN useradd -m -s /bin/bash -u "${UID}" compiler
USER compiler
WORKDIR /home/compiler

COPY entrypoint.sh /bin/entrypoint
ENTRYPOINT ["entrypoint"]
