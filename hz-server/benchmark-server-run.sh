#!/bin/bash

# Pull docker image.
sudo -S docker pull ntikhonov/yardstick-hz-server

# Check exit code.
if [ $? -ne 0 ]; then
    echo "Failed. Couldn't pull ntikhonov/yardstick-hz-server image from docker hub. Try later."
fi

# Run docker container.
sudo -S docker run -d --net=host ntikhonov/yardstick-hz-server

# Check exit code.
if [ $? -ne 0 ]; then
    echo "Failed. Couldn't run ntikhonov/yardstick-server:ignite container."
fi