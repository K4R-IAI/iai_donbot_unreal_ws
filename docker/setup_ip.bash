#!/bin/bash
source .env
export ROS_MASTER_URI=http://${ROS_IP_CORE}:11311
export ROS_IP=192.168.0.1
