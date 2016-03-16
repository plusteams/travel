#!/bin/bash
#
#
#
#
#
#
installNginx ()
{
	addRepoKey

	if [ $? = 1 ]; then
		getCodeName
	else
		export DISTRIB_CODENAME=trusty
	fi

	echo "code name $DISTRIB_CODENAME"; 
	addSourceFile
	if [ $? = 1 ]; then
		apt-get update;
		app-get install nginx;
	fi

}

## add repo key
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

getCodeName () 
{
	if ! /etc/lsb-release > /dev/null 2>&1; then
		echo "file is exits";
		. /etc/lsb-release
	fi
}

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
