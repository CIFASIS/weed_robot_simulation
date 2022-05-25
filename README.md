# Weed Robot Simulation

Simulation of the soybean crop weeding robot developed by CIFASIS.

## Installation with Docker

### Dependencies

Install docker using apt and not the snap package.

```
sudo apt install docker.io
```

Install rocker

```
sudo apt-get install python3-rocker
```

Install Nvidia GPU and GUI support packages

```
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
	
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

curl -s -L https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
```

Restart docker daemon

```
sudo systemctl restart docker
```

### Build docker container

```
docker build . --tag navigation:latest
```

## Running

Run docker image

```
rocker --nvidia --x11 navigation:latest
```

In the opened shell run the navigation script *weed_robot.sh*, for example:

```
src/weed_robot_navigation/bin/weed_robot.sh -n -s -g -v -w field -m field \
	-t "[3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]" \
	-p "-x -14.56 -y -12.0 -Y 1.570796327"
```