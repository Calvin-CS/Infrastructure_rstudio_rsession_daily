#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No username supplied"
else
  docker run -it -p 8787:8787 -p 5559:5559 -v /opt/R:/opt/R -v /home:/home rsession sudo -i -u $1 /usr/bin/bash
fi
