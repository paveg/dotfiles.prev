FROM ubuntu:xenial
MAINTAINER paveg <pavegy@gmail.com>
ARG USERNAME

RUN apt-get update && apt-get install -y sudo language-pack-en-base language-pack-en

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

RUN groupadd -g 1000 developer && \
  useradd -g developer -G sudo -m -s /bin/bash ${USERNAME} && \
  echo "${USERNAME}:qwerty1234" | chpasswd

RUN echo 'Defaults visiblepw' >> /etc/sudoers
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USERNAME}
