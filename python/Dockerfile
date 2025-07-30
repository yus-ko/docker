# Use the official Ubuntu 22.04 base image
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    sudo \
    passwd \
    curl \
    vim \
    tzdata \
    x11-apps \
    locales \
    wget \
    python3 \
    python3-pip \
    python3-venv \
    python3-tk \
    python3-dev \
    build-essential \
    tk-dev \
    libgl1-mesa-glx \
    libx11-6 \
    fonts-ipafont-gothic \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
    matplotlib \
    numpy

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN locale-gen  ja_JP ja_JP.UTF-8
RUN update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8
RUN export LANG=ja_JP.UTF-8

RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*
