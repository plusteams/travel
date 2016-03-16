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
