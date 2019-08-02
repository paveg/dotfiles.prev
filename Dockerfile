FROM linuxbrew/linuxbrew:latest
LABEL maintainer="pav <pavegy@gmail.com>"

ENV TZ "Asia/Tokyo"
RUN sudo apt-get update && sudo apt-get install -y bison tzdata && \
  sudo locale-gen ja_JP.UTF-8 && \
  sudo update-locale LANG=ja_JP.UTF-8 && \
  sudo ln -sf /usr/share/zoneinfo/Azia/Tokyo /etc/localtime

COPY . .
RUN make install

CMD ["zsh"]
