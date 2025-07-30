# Use the official Ubuntu 18.04 base image
FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    sudo \
    passwd \
    curl \
    vim \
    tzdata \
    x11-apps \
    locales \
    wget \
    screen \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN locale-gen  ja_JP ja_JP.UTF-8
RUN update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8
RUN export LANG=ja_JP.UTF-8

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

RUN apt-get update && apt-get install -y \
    ros-melodic-desktop-full \
    python-rosdep \ 
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    python-catkin-tools \
    python-pip \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

ARG USERNAME
ARG USER_UID
ARG USER_GID
ARG USER_HOME_DIR

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update && apt-get install -y sudo \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/*

USER $USERNAME
WORKDIR $USER_HOME_DIR

CMD ["sleep", "infinity"]
