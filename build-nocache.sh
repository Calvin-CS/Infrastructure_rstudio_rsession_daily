#!/bin/bash

# Note: this relies on Docker secrets to build, but that secret is not stored in Git.  This build script looks up one directory and down into a secrets subdir
# For github actions, should rely on the Github secrets stuff, adding each one seperately

docker build --no-cache -t rsession-daily:latest --secret id=HTPASSWD_CSWEB_WGET,src=../secrets/HTPASSWD_CSWEB_WGET.env .
