#!/bin/bash
#
#
#
#
#
#

#
# autoload library to deploy
#
source ./libs/helper.sh
source ./config/config.sh
for i in "$@"; do

	#statements
	if [ -f "libs/${i}/${i}.sh" ]; then
		echo "./libs/${i}/${i}.sh";
		source ./libs/${i}/${i}.sh;
	fi
done