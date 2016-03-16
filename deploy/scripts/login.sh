#!/bin/bash
#
#
#
#
ssh -i $1 $2@$3 <<EOF if ! /travel/wwww/travel > /dev/null 2>&1; then
	echo "dir not found, create new folder";
	sudo mkdir -p /travel/wwww/travel;
	cd /travel/wwww/;
	if ! which git > /dev/null 2>&1; then
    	echo "Nginx not installed"
    	sudo apt-get install git
    	#call script install nginx and config nginx
		#installNginx
	else
		sudo git clone git@github.com:plusteams/travel.git travel;
		cd travel;
		git checkout dev;
		sudo deploy/scripts/deploy.sh
	fi
else
	echo "s";
fi
EOF