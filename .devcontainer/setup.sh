#!/bin/bash

set -e

echo "[setup] Updating apt"
apt update && apt install -y ros-noetic-pcl-ros python3-pip python3-dev python3-venv

pip install rospkg

echo "[setup] Installing Gym"
pip install gym
pip install pygame

echo "[setup] Installing additional Python dependencies"
pip install numpy matplotlib rospkg catkin_pkg

echo "[setup] Setting up ROS environment"
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source /opt/ros/noetic/setup.bash

echo "[setup] Creating catkin workspace"
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws && catkin_make
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
