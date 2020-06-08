FROM ubuntu:20.04

RUN apt update && \
    apt install -y curl sudo git build-essential

ARG UID=1000
ARG USER=docker
ARG PASSWORD=docker
RUN useradd -m -u ${UID} ${USER} && \
    echo ${USER}:${PASSWORD} | chpasswd

ENV HOME=/home/docker

ENV DEBIAN_FRONTEND=noninteractive

RUN apt install -y tzdata language-pack-ja-base language-pack-ja locales && \
    locale-gen ja_JP.UTF-8

ENV TZ=Asia/Tokyo
ENV LANG='ja_JP.UTF-8'

USER ${USER}
