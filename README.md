# iai_donbot_unreal_ws

This repository contains docker images for deploying ROS packages with https://github.com/K4R-IAI/K4R_Development
### 0. Prerequisites: https://docs.docker.com/compose/install
```
docker-compose version 1.29.2, build 5becea4c
docker-py version: 5.0.0
```

### 1. If you want to use a package simulator from Unreal Engine, download it at https://seafile.zfn.uni-bremen.de/f/e49379520efc48c69c8f and unzip it
### 2. Clone this repository and go into docker folder
```
cd docker
```
### 3. Follow these steps to build docker images:
#### 3.1. Clone the packages with wstool
```
./setup_ros_packages.bash
```
#### 3.2. Install nvidia-docker2 to enable GPU access with Compose (sudo required)
```
./setup_rviz.bash
```
#### 3.3. Build the docker images
```
docker-compose build
```
### 4. Using the docker images
#### 4.1. Start k4r-ros-core and k4r-iai-donbot-unreal-ws
```
docker-compose up k4r-iai-donbot-unreal-ws
```
#### 4.2. Start the simulation (either by clicking Play in Unreal Engine or from the unziped package)
```
cd LinuxNoEditor
sh K4R_Development.sh
```
#### 4.3. On the menu, click Load, then click Random Shop. You should see the connection in both terminals (one from 4.1 and one from 4.2)
#### 4.4. Execute ROS command inside k4r-iai-donbot-unreal-ws-container by opening a new terminal
```
docker exec -it k4r-iai-donbot-unreal-ws-container bash
source devel/setup.bash
roslaunch iai_donbot_unreal iai_donbot_control.launch
```
#### 4.5. You can visualize everything with rviz from docker container
```
./run_rviz.bash
```
### 5. Stop docker containers 
#### 5.1. Cancel every terminals with Ctrl + C
#### 5.2. Remove docker containers and network
```
docker-compose down
```
