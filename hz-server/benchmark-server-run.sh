#!/bin/bash

# Pull docker image.
sudo -S docker pull apacheignite/yardstick-hz-server

# Check exit code.
if [ $? -ne 0 ]; then
    echo "Failed. Couldn't pull apacheignite/yardstick-hz-server image from docker hub. Try later."
fi

# Run docker container.
sudo -S docker run -d --net=host apacheignite/yardstick-hz-server

# Check exit code.
if [ $? -ne 0 ]; then
    echo "Failed. Couldn't run apacheignite/yardstick-server:ignite container."
fi