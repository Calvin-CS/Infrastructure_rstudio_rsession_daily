FROM calvincs.azurecr.io/rsession-base:latest
LABEL maintainer="Chris Wieringa <cwieri39@calvin.edu>"

# Environment Variables
ARG BUILDDATE=20240628-1

# Container settings
SHELL ["/bin/bash", "-c"] 

# Mount the HTPASSWD secret so that we can pull down the current
# passwd and group files for inclusion into the container
RUN --mount=type=secret,id=HTPASSWD_CSWEB_WGET \
    cat /run/secrets/HTPASSWD_CSWEB_WGET | /usr/bin/base64 -d > /root/.wgetrc
COPY --chmod=0755 inc/cs-populate-users.sh /root
RUN /root/cs-populate-users.sh && \
    rm -f /root/.wgetrc
