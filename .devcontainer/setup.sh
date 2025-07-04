#!/bin/bash
# 更新依赖
apt-get update
rosdep update

# 创建工作空间
mkdir -p catkin_ws/src
cd catkin_ws
catkin_make
source devel/setup.bash

# 克隆示例代码 (替换为你的实际仓库)
git clone https://github.com/wenbo9045/traffic_flow_trajectory_planning.git
rosdep install --from-paths src --ignore-src -y
catkin_make -DCMAKE_BUILD_TYPE=Release