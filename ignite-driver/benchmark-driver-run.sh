#!/bin/bash

# Check that docker installed.
if ! which docker >/dev/null; then
    echo "Script requered install docker. See https://docs.docker.com/installation/"
    exit 1
fi

# First argument should be absolute path to out directory.
RESULT_PATH="$1"

# Check that user passed argument.
if [ -z "$RESULT_PATH" ]; then
    echo "Usage: benchmark-driver-run.sh [DIRECTORY which will contain a result]"
    exit 1
fi

# Check that is absolute path.
if [[ ! "$RESULT_PATH" = /* ]]; then
    echo "Usage: path to output folder must be absolute [$RESULT_PATH]. For example /home/result"
    exit 1
fi

# Check that is directory.
if [ ! -d "$RESULT_PATH" ]; then
    echo "Directory doesn't exist : [$RESULT_PATH]"
    exit 1
fi

# Pull docker image.
sudo -S docker pull ntikhonov/yardstick-driver:ignite

# Check exit code.
if [ $? -ne 0 ]; then
    echo "Failed. Couldn't pull ntikhonov/yardstick-driver:ignite image from docker hub. Try later."
fi

# Run docker container.
sudo -S docker run -d --net=host -v "$RESULT_PATH":/export \
  ntikhonov/yardstick-driver:ignite

# Check exit code.
if [ $? -ne 0 ]; then
    echo "Failed. Couldn't run ntikhonov/yardstick-driver:ignite container."
fi