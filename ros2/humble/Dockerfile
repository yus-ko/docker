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
    screen \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN locale-gen  ja_JP ja_JP.UTF-8
RUN update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8
RUN export LANG=ja_JP.UTF-8

RUN export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}') && \
    curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb" && \
    sudo dpkg -i /tmp/ros2-apt-source.deb

RUN apt-get update && apt-get install -y \
    ros-humble-desktop \
    python3-colcon-common-extensions \
    git \
    gazebo \
    ros-humble-gazebo-* \
    ros-humble-rqt-* \
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
