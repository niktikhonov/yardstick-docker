#!/bin/bash

# Pull docker image.
sudo -S docker pull apacheignite/yardstick-ignite-server

# Check exit code.
if [ $? -ne 0 ]; then
    echo "Failed. Couldn't pull apacheignite/yardstick-ignite-server image from docker hub. Try later."
fi

# Run docker container.
sudo -S docker run -d --net=host apacheignite/yardstick-ignite-server

# Check exit code.
if [ $? -ne 0 ]; then
    echo "Failed. Couldn't run apacheignite/yardstick-ignite-server container."
fi