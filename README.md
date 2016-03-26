Travelling core
==========
# Overview
========== 
## Description
========== 
This is core project for all project in travelling
This working well in linux system. You can get it in Mac OS (window need to be verified)

## How to get it.
========== 

### Getting started
#### 1. System requirement 
- docker
- mysql
- composer
- git

#### 2. Installation
##### 1. Git
`
sudo apt-get install git
`
- or you can get it by step [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git "Here")
##### 2. Docker 
- [Here](https://docs.docker.com/engine/installation/linux/ubuntulinux/ "Here")
- `sudo apt-get update`
- `sudo apt-get install apt-transport-https ca-certificates`
- `sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D`
- Open the /etc/apt/sources.list.d/docker.list file in your favorite editor.
If the file doesn’t exist, create it.
Add an entry for your Ubuntu operating system.

- The possible entries are:

    On Ubuntu Precise 12.04 (LTS)

    `deb https://apt.dockerproject.org/repo ubuntu-precise main`

    On Ubuntu Trusty 14.04 (LTS)

    `deb https://apt.dockerproject.org/repo ubuntu-trusty main`

    Ubuntu Wily 15.10

    `deb https://apt.dockerproject.org/repo ubuntu-wily main`
- Save and close the `/etc/apt/sources.list.d/docker.list` file.
- `sudo apt-get update`
- `sudo apt-get purge lxc-docker`
- `sudo apt-cache policy docker-engine`
- `sudo apt-get install linux-image-extra-$(uname -r)`
- `sudo apt-get install docker-engine`
- `sudo service docker start`
- Config user system to use dokcer without sudo 
	`sudo usermod -aG docker ubuntu`
	with ubuntu is user logined
- Completed install by verify command: `docker run hello-world`

##### 3. Composer
- https://getcomposer.org/download/
- Require php in your system

##### 4. Mysql (is option, We will use mongodb or build docker images include mysql service)

#### 3 How to start project
* All you need is run this command after install all of above

	docker run --name travel-project  -d  -v `pwd`:/travel/www/travel_dev plusteam/xxxx
