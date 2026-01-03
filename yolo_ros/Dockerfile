FROM ros:humble

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    ros-humble-rviz2 \
    ros-humble-rqt-* \
    ros-humble-vision-opencv \
    ros-humble-usb-cam && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]