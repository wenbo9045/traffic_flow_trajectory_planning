# Adaptive Spatio-Temporal Voxels Based Trajectory Planning for Autonomous Driving in Highway Traffic Flow

This repo is the code for the paper "Adaptive Spatio-Temporal Voxels Based Trajectory Planning for Autonomous Driving in Highway Traffic Flow".

https://user-images.githubusercontent.com/20518317/235564429-abe2bb56-9fa1-48ae-b82a-2a1c8a98018b.mp4

# Requirements

For running code:

- Ubuntu20.04
  
- python3.8
  
- ros-noetic (https://wiki.ros.org/Installation/Ubuntu)
  
- sudo apt-get install -y gfortran libgfortran5

- rospkg (pip3 install rospkg)
  
- gym (pip3 install gym)
  
- pygame (pip3 install pygame)
  
- pip3 install scipy
  
- pip3 install pandas
  
- ooqp

- glog

- tk_spline

- odeint-v2

# Install

1. create a root directory

```
mkdir catkin_ws
cd catkin_ws
mkdir src
cd src
catkin_init_workspace
```

2. clone the code

```
git clone https://github.com/wenbo9045/traffic_flow_trajectory_planning.git
```

3. install

```
catkin_make -DCMAKE_BUILD_TYPE=Debug

catkin_make -DCMAKE_BUILD_TYPE=Release
```

在服务器安装桌面环境

sudo apt update

sudo apt install -y xfce4 xfce4-goodies lightdm dbus-x11 x11-xserver-utils

安装过程中如果提示选择显示管理器（Display Manager），请选择 lightdm

在服务器上安装 NoMachine 服务端

wget https://download.nomachine.com/download/9.0/Linux/nomachine_9.0.188_11_amd64.deb -O nomachine.deb

sudo dpkg -i nomachine.deb


# How to use

1. start roscore

```
roscore
```

2. launch the simulator

```
cd catkin_ws
source devel/setup.bash
roslaunch simulator start_gym.launch
```

3. start the planner

```
cd catkin_ws
source devel/setup.bash
roslaunch local_planning test.launch
```

press "Enter" key in the terminal to start the program.

# Acknowledgement

https://github.com/HKUST-Aerial-Robotics/EPSILON

https://github.com/Farama-Foundation/HighwayEnv
