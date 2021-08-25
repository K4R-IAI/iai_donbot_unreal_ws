#!/bin/bash
xhost +local:root
docker-compose up k4r-rviz

# cleanup after rviz has been closed
xhost -local:root
