FROM osrf/ros:melodic-desktop-full-bionic

ENV HOME="/root"
ENV ROS_DISTRO="melodic"
ENV CATKIN_WS="${HOME}/catkin_ws"
ENV WEED_ROBOT_NAVIGATION_ROOT="${CATKIN_WS}/src/weed_robot_navigation"

# Install dependencies

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    openssh-client \
    ros-melodic-joint-state-controller \
    ros-melodic-effort-controllers \
    ros-melodic-position-controllers \
    ros-melodic-gazebo-ros-pkgs \
    ros-melodic-gazebo-ros-control \
    ros-melodic-ackermann-steering-controller \
    ros-melodic-global-planner \
    ros-melodic-teb-local-planner \
    ros-melodic-move-base \
    ros-melodic-map-server \
    ros-melodic-fake-localization \
    ros-melodic-move-base-msgs \
    ros-melodic-gazebo-dev \
    python-catkin-tools \
    python3-lxml && \
    rm -rf /var/lib/apt/lists/*

# Append ROS setup script to .bashrc
RUN echo "export ROS_PACKAGE_PATH=${CATKIN_WS}:\${ROS_PACKAGE_PATH}" >> ${HOME}/.bashrc
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ${HOME}/.bashrc
RUN echo "source ${CATKIN_WS}/devel/setup.bash" >> ${HOME}/.bashrc

# Catkin workspace setup
WORKDIR ${CATKIN_WS}
RUN catkin init

# Copy source
COPY ./weed_robot_description ./src/weed_robot_description/
COPY ./weed_robot_gazebo ./src/weed_robot_gazebo/
COPY ./weed_robot_navigation ./src/weed_robot_navigation/ 

# Copy docker scripts
COPY ./docker_scripts ./docker_scripts/

# Replace https://api.ignitionfuel.org by https://api.ignitionrobotics.org/ url in ignition configuration file
RUN cat /usr/share/ignition/fuel_tools/config.yaml
RUN ["/bin/bash", "-c", "sed -i 's/ignitionfuel/ignitionrobotics/g' /usr/share/ignition/fuel_tools/config.yaml"]
RUN cat /usr/share/ignition/fuel_tools/config.yaml

# in order to leave running the terminal we should leave running bash
RUN ["/bin/bash", "-c", "chmod +x ${CATKIN_WS}/docker_scripts/build.sh && chmod +x ${CATKIN_WS}/docker_scripts/modify_entrypoint.sh && sync && ${CATKIN_WS}/docker_scripts/build.sh && ${CATKIN_WS}/docker_scripts/modify_entrypoint.sh"]
