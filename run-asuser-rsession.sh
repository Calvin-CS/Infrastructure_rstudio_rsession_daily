#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No username supplied"
else
  docker run -it -p 8787:8787 -p 5559:5559 -v /opt/R:/opt/R -v /home:/home rsession sudo -i -u $1 /usr/lib/rstudio-server/bin/rserver-launcher --server-user rstudio-server --server-project-sharing 0 --server-shared-storage-path /rshared --pam-sessions-enabled 0 --stdin --rserver-tcp-port 8787 --rserver-verify-ssl-certs 1 --rserver-connection-timeout 10 --session-use-file-storage 1 --log-stderr --forward-environment 1
fi
