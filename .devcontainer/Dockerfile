# 基于官方 Ubuntu 20.04 镜像
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# 安装常用工具及 Python3.9
RUN apt-get update && apt-get install -y \
    locales \
    curl \
    gnupg2 \
    lsb-release \
    build-essential \
    python3.9 \
    python3.9-venv \
    python3.9-dev \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# 设置 python3 指向 python3.9
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

# 添加 ROS Noetic 源
RUN curl -sSL "http://packages.ros.org/ros/ubuntu/setup.bash" | bash && \
    apt-get update && apt-get install -y \
      ros-noetic-desktop-full \
      python3-rosdep \
      python3-rosinstall \
      python3-rosinstall-generator \
      python3-wstool \
      python3-rosdep \
    && rm -rf /var/lib/apt/lists/*

# 初始化 rosdep
RUN rosdep init || true && \
    rosdep update

# 设置环境
SHELL ["/bin/bash", "-lc"]
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# 默认工作目录
WORKDIR /workspace
