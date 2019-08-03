FROM linuxbrew/linuxbrew:latest
LABEL maintainer="pav <pavegy@gmail.com>"

ENV TZ "Asia/Tokyo"
RUN sudo apt-get update && \
  sudo apt-get install -y bison tzdata libssl-dev zlib1g-dev libffi-dev && \
  sudo locale-gen ja_JP.UTF-8 && \
  sudo update-locale LANG=ja_JP.UTF-8 && \
  sudo ln -sf /usr/share/zoneinfo/Azia/Tokyo /etc/localtime

RUN mkdir -p dotfiles
COPY . ./dotfiles
RUN cd dotfiles && make install

CMD ["zsh"]
