#!/bin/bash
#
#
#
#
#
#
source ./autoload.sh
## Checking root access
checkRootAccess
if [ $? = 1 ]; then
	echo "OK"
else
	echo "root acess is required"
	exit 1;
fi

###########
# Checking nginx 
#
#############

if ! which nginx > /dev/null 2>&1; then
    echo "Nginx not installed"
    #call script install nginx and config nginx
	#installNginx
else
	##Do some things 
	#TODO
	# checking config or override config site
 	#
 	installNginx
 	#getCodeName
 	echo "config nginx"
fi

