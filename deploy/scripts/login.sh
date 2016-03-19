#!/bin/bash
#
#
#
#
ssh $USER@$HOST <<EOF 
if [ /travel/wwww/travel ]; then
	echo "dir not found, create new folder";
	sudo -i mkdir -p /travel/wwww;
	cd /travel/wwww/;
	if ! which git > /dev/null 2>&1; then
		echo "Nginx not installed"
		sudo -i apt-get -y install git
	fi
	sudo -i git clone git@github.com:plusteams/travel.git travel;
fi
cd travel;
sudo -i git checkout dev;
sudo -i chmod a+x deploy/scripts/deploy.sh
sudo -i deploy/scripts/deploy.sh nginx
EOF