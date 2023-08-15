# Weed Robot Simulation

Simulation of the soybean crop weeding robot developed by CIFASIS.

## Video
<a href="https://youtu.be/NlTgNNLH3LA" target="_blank">
  <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/6648400/260785714-3ec3388d-eb23-4e74-a1d2-6f0e85e57144.png" alt="weed_robot_simulation" width="700" />
</a>

## License

weed_robot_simulation is released under BSD-2-Clause license.

If you use weed_robot_simulation in an academic work, please cite:

@article{ait2023travelling,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  title = {{A Travelling Salesman Problem Approach to Efficiently Navigate Crop Row Fields with a Car-Like Robot}},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  author = {Ait, Ismael and Kofman, Ernesto and Pire, Taih{\\'u}},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  journal = {IEEE Latin America Transactions},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  volume = {21},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  number = {5},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  pages = {643-–651},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  month = {April},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  year = {2023},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  issn = {1548-0992},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  url = {https://latamt.ieeer9.org/index.php/transactions/article/view/7751} 
  
}

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
