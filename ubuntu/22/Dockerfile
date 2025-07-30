# Use the official Ubuntu 22.04 base image
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    sudo \
    passwd \
    curl \
    vim \
    tzdata \
    x11-apps \
    locales \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN locale-gen  ja_JP ja_JP.UTF-8
RUN update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8
RUN export LANG=ja_JP.UTF-8

RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
