FROM ubuntu:20.04

ENV DISPLAY=:0 LANG=C.UTF-8 DEBIAN_FRONTEND=noninteractive

# Libs
RUN apt-get update && \
    apt-get install -yq libdvd-pkg lsdvd && \
    dpkg-reconfigure libdvd-pkg && \
    rm -rf /var/lib/apt/lists/*