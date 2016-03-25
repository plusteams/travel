#!/bin/bash
#
#
#
#
ssh -i identity_files/key.pem $USER@$HOST <<EOF 
if [ /travel/wwww/travel ]; then
	echo "dir not found, create new folder";
	sudo mkdir -p /travel/wwww;
	cd /travel/wwww/;
	if ! which git > /dev/null 2>&1; then
		echo "Nginx not installed"
		sudo apt-get -y install git
	fi
	sudo git clone git@github.com:plusteams/travel.git travel;
fi
cd travel;
sudo git checkout master;
sudo git pull;
sudo chmod a+x deploy/scripts/deploy.sh
sudo deploy/scripts/deploy.sh nginx
EOF