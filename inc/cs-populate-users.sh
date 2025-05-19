#!/bin/bash

# use wget to pull down PASSWD/GROUP entries using secret password
if test -f "/tmp/cspopulate-url.txt"; then
        echo "Found the CSPOPULATE URL secret... proceeding"

        URL=$(cat /tmp/cspopulate-url.txt)

        curl -fsSLk https://${URL}/csallusers >> /etc/passwd
    	curl -fsSLk https://${URL}/csallgroups >> /etc/group

# error out
else
	echo "NO SECRET SET -- ERROR OUT!"
	exit 1
fi