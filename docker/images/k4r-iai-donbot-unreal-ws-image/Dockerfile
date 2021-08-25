ARG ROS_DISTRO
FROM ros:${ROS_DISTRO}-robot

COPY src /home/iai_donbot_unreal_ws/src

# Install prerequisites
WORKDIR /home/iai_donbot_unreal_ws
RUN apt-get update && apt-get install -y \
  apt-utils \
  python-pip \
  python-matplotlib \
  ros-${ROS_DISTRO}-py-trees-ros \
  ros-${ROS_DISTRO}-navigation \
  ros-${ROS_DISTRO}-joint-trajectory-action
RUN pip install casadi numpy==1.16.6 scipy==1.2.2 cython pybullet==3.0.6 sortedcontainers pandas==0.24.2
RUN rosdep install --from-paths src --ignore-src -r -y \
   && rm -rf /var/lib/apt/lists/*

# Build catkin workspace
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && catkin_make

# Create entrypoint
SHELL ["/bin/bash", "-c"]
COPY ./entrypoint.bash /entrypoint.bash
RUN chmod +x /entrypoint.bash
