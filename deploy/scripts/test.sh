#!/bin/bash
doTest()
{
	echo "test";
}

for i in "$@"; do
	#statements
	arg="do$(tr '[:lower:]' '[:upper:]' <<< ${i:0:1})${i:1}";
	echo $arg;
	eval ${arg};
done



