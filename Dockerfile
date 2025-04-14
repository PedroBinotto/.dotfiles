FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  git \
  make \
  sudo \
  bash \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash tester && echo "tester ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER tester

COPY . /home/tester/.dotfiles

WORKDIR /home/tester/.dotfiles

RUN ./install

CMD [ "bash" ]
