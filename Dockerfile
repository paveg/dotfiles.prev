FROM paveg/dot-ubuntu-base:latest

COPY . .
RUN ./install.sh
