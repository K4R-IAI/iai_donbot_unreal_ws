#!/bin/bash
source .env
export ROS_MASTER_URI=http://${ROS_IP_CORE}:11311
export ROS_IP=172.17.0.1
