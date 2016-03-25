#!/bin/bash
#

###########################
#
#
# Do nginx function
#
#


doNginx()
{
	installNginx;
	if [ $? = 1 ]; then
		configNginx;	
		nginxService restart;
	fi
}

######################
#
# INSTALL NGINX
#
#######################


installNginx ()
{
	if ! which nginx > /dev/null 2>&1; then
    	echo "Nginx not installed"
    	#call script install nginx and config nginx
	
		addRepoKey

		if [ $? = 1 ]; then
			getCodeName
		else
			export DISTRIB_CODENAME=trusty
		fi

		echo "code name $DISTRIB_CODENAME"; 
		addSourceFile
		if [ $? = 1 ]; then
			sudo apt-get update;
			sudo app-get -y install nginx;
		fi
		return 1;
	fi
	return 1;

}

################################
#
#
# CONFIG NGINX
#
###################################

configNginx()
{
	#
	# override nginx.conf file 
	#
	if [ ! $files_dir = "" ]; then
		cp $files_dir/config/nginx/nginx.conf /etc/nginx/nginx.conf;
		cp $files_dir/config/nginx/vhost/server-*.conf /etc/nginx/site-available/;
		ln -s /etc/nginx/sites-aavailable/server-*.conf /etc/nginx/sites-enabled/;
		echo "coppy nginx config ok";
		return 1
	else
		echo "Fail to add config";
		return 0
	fi

}

#################################
#
# private function
#
# add repo key
#
#
#
addRepoKey ()
{
	if [ ! $files_dir = "" ]; then
		apt-key add $files_dir/repo/key/nginx_signing.key;
		echo "add key ok";
		return 1
	else
		echo "Fail to add key"
		return 0
	fi
}

##################
#
# Get code name of os version: ex: ubuntu trusty
#
#
getCodeName () 
{
	if ! /etc/lsb-release > /dev/null 2>&1; then
		echo "file is exits";
		. /etc/lsb-release
	fi
}

#####################
# Private function
# Add source file
# 
###########
addSourceFile ()
{
	if [ -f /etc/apt/sources.list ]; then
		echo "add source list";
		cat /etc/apt/sources.list | grep "http://nginx.org/packages/ubuntu/";
		if [ $? = 1 ]; then
			echo "deb http://nginx.org/packages/ubuntu/ $DISTRIB_CODENAME nginx" >> /etc/apt/sources.list
			echo "deb-src http://nginx.org/packages/ubuntu/ $DISTRIB_CODENAME nginx" >> /etc/apt/sources.list
			return 1;
		fi
		return 0;
	fi
	return 0;
}

nginxService()
{
	sudo service nginx $1
}