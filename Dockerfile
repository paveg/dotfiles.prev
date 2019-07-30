FROM ubuntu:xenial

COPY install.sh ./
RUN ./install.sh
