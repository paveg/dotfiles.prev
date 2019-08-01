FROM paveg/dot-ubuntu-base:latest

COPY . .
RUN ./installer.sh
