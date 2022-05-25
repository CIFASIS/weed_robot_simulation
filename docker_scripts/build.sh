#!/bin/bash
source /opt/ros/melodic/setup.bash
catkin list
catkin build --cmake-args -Wno-dev -Dgazebo_DIR=/usr/lib/x86_64-linux-gnu/cmake/gazebo 
