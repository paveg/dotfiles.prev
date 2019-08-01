FROM linuxbrew/linuxbrew:latest
LABEL maintainer="pav <pavegy@gmail.com>"

RUN sudo apt-get update && sudo apt-get install -y bison
COPY . .
RUN make install

CMD ["zsh"]
