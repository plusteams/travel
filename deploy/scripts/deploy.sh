#!/bin/bash
#
#
#
#
#
#
dir=`pwd`;
cd $dir/deploy/scripts;
source ./autoload.sh
## Checking root access
checkRootAccess
success "Root access check";

##########################
#
# call function with arg name: doArgxxxx,
# to write function doArgxxx please write library to deploy it. 
# All in one libs file with argxxx.sh name
# Ex: nginx will be install with deploy.sh nginx
#
# and in libs file existed nginx.sh libs/nginx.sh
# and finally write doNginx to call out
#

for i in "$@"; do
	#statements
	echo "Call do for deploy";
	arg="do$(tr '[:lower:]' '[:upper:]do' <<< ${i:0:1})${i:1}";
	echo "Call " $arg;
	eval ${arg};
done
cd $dir;