FROM ubuntu:20.04

RUN apt update && \
    apt install -y curl sudo git gcc

ARG UID=1000
ARG USER=docker
ARG PASSWORD=docker
RUN useradd -m -u ${UID} ${USER} && \
    echo ${USER}:${PASSWORD} | chpasswd

ENV HOME=/home/docker

USER ${USER}
