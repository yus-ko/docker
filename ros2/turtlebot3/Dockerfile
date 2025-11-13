FROM ros:humble

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
    screen \
    tmux \
    gdb \
    tree \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN locale-gen  ja_JP ja_JP.UTF-8
RUN update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8
RUN export LANG=ja_JP.UTF-8

RUN apt update && apt install -y \
    ros-humble-rviz2 \
    ros-humble-rqt-* \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    ros-humble-turtlebot3-gazebo \
    ros-humble-turtlebot3-navigation2 && \
    rm -rf /var/lib/apt/lists/*

# RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
# RUN chmod u+x nvim-linux-arm64.appimage && ./nvim-linux-arm64.appimage
# ENV PATH="$PATH:/squashfs-root/usr/bin"
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage \
# RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage \
    && chmod +x nvim-linux-x86_64.appimage \
    && ./nvim-linux-x86_64.appimage --appimage-extract \
    && mv squashfs-root /opt/nvim \
    && ln -s /opt/nvim/AppRun /usr/local/bin/nvim \
    && rm nvim-linux-x86_64.appimage

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

CMD ["bash"]