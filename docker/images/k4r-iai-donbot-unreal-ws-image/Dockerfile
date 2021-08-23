ARG ROS_DISTRO
FROM ros:${ROS_DISTRO}-robot

COPY src /home/iai_donbot_unreal_ws/src

# Install prerequisites
RUN apt-get update && apt-get install -y \
  apt-utils \
  ros-${ROS_DISTRO}-navigation \
  && rm -rf /var/lib/apt/lists/*

# Install dependencies
WORKDIR /home/iai_donbot_unreal_ws
RUN apt-get update \
   && rosdep install --from-paths src --ignore-src -r -y \
   && rm -rf /var/lib/apt/lists/*

# Build catkin workspace
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && catkin_make

SHELL ["/bin/bash", "-c"]
COPY ./entrypoint.bash /entrypoint.bash
RUN chmod +x /entrypoint.bash
