# 基于官方 ROS Noetic 镜像
FROM ros:noetic-ros-core

# 安装 ROS Desktop 完整版及常用工具
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      ros-noetic-desktop-full \
      python3-rosdep \
      python3-catkin-tools \
      python3-pip \
    && rm -rf /var/lib/apt/lists/*

# 初始化 rosdep（第一次启动可能需要几分钟）
RUN rosdep init && rosdep update

# 设置 shell
ENV SHELL /bin/bash
