FROM ubuntu:xenial
MAINTAINER paveg <pavegy@gmail.com>
ARG USERNAME

RUN apt-get update && apt-get install -y sudo language-pack-ja-base language-pack-ja

RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

RUN groupadd -g 1000 developer && \
  useradd -g developer -G sudo -m -s /bin/bash ${USERNAME} && \
  echo "${USERNAME}:qwerty1234" | chpasswd

RUN echo 'Defaults visiblepw' >> /etc/sudoers
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USERNAME}

