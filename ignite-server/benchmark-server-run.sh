#!/bin/bash

# Pull docker image.
sudo -S docker pull ntikhonov/yardstick-ignite-server

# Check exit code.
if [ $? -ne 0 ]; then
    echo "Failed. Couldn't pull ntikhonov/yardstick-ignite-server image from docker hub. Try later."
fi

# Run docker container.
sudo -S docker run -d --net=host ntikhonov/yardstick-ignite-server

# Check exit code.
if [ $? -ne 0 ]; then
    echo "Failed. Couldn't run ntikhonov/yardstick-ignite-server container."
fi