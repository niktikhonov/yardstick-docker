#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    echo "Usage: start-benchmark-server.sh AWS_ACCESS_KEY AWS_SECRET_KEY"

    exit 1
fi

sudo -S docker pull ntikhonov/yardstick-hz-server-aws

sudo -S docker run -d --net=host --restart=always -e AWS_ACCESS_KEY=$1 -e AWS_SECRET_KEY=$2 \
   ntikhonov/yardstick-hz-server-aws