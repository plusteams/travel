#!/bin/bash
#
#
#
#
checkRootAccess ()
{
	# checking root user
	if [ "$(id -u)" != "0" ]; then
   		return 0;
   	else
   		return 1;
	fi
}

success()
{
	if [ $? = 1 ]; then
		echo "success";
		echo "Message: $1";
	else
		echo "Failed";
		echo "Message: $1";
		exit 1;
	fi
}
