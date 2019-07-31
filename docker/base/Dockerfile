FROM ubuntu:xenial
MAINTAINER paveg <pavegy@gmail.com>
ARG USERNAME

RUN apt-get update && apt-get install -y sudo
RUN groupadd -g 1000 developer && \
  useradd -g developer -G sudo -m -s /bin/bash ${USERNAME} && \
  echo "${USERNAME}:qwerty1234" | chpasswd

RUN echo 'Defaults visiblepw' >> /etc/sudoers
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USERNAME}

