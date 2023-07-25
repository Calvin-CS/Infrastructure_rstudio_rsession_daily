# use wget to pull down PASSWD/GROUP entries using secret password
if test -f "/root/.wgetrc"; then
	echo "Found the HTPASSWD CSWEB secret... proceeding"

	# pull down the file
	cd /root/
	wget https://r.cs.calvin.edu/.well-known/cs/cspasswd
	wget https://r.cs.calvin.edu/.well-known/cs/csgroup
	wget https://r.cs.calvin.edu/.well-known/cs/csusergroups

	# test to make sure they exist; if they do copy them into passwd/group
	if test -f "/root/cspasswd"; then
		echo "Populating /etc/passwd with CS entries"
		cat /root/cspasswd >> /etc/passwd
	else
		echo "*** CSPASSWD NOT FOUND ***"
		exit 1
	fi

	if test -f "/root/csgroup"; then
		echo "Populating /etc/group with CS entries"
		cat /root/csgroup >> /etc/group
	else
		echo "*** CSGROUP NOT FOUND ***"
		exit 1
	fi

	if test -f "/root/csusergroups"; then
		echo "Populating /etc/group with CS per-user entries"
		cat /root/csusergroups >> /etc/group
	else
		echo "*** CSUSERGROUPS NOT FOUND ***"
		exit 1
	fi

# error out
else
	echo "NO SECRET SET -- ERROR OUT!"
	exit 1
fi