#!/bin/bash
if [ -z $1 ]; then
	echo set domain
fi
amavisd-new showkeys $1|
grep -v $1|
tr -d \\n|
sed -e 's/"  "//g' -e 's/  //g' -e "s/)//g"
