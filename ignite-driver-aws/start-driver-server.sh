#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    echo "Usage: start-benchmark-driver.sh AWS_ACCESS_KEY AWS_SECRET_KEY [S3_BUCKET]"

    exit 1
fi

sudo -S docker pull apacheignite/yardstick-ignite-driver-aws

if [ -z "$3" ]; then
    sudo -S docker run -d --net=host --privileged --restart=always -e AWS_ACCESS_KEY=$1 -e AWS_SECRET_KEY=$2 \
        apacheignite/yardstick-ignite-driver-aws
else
    sudo -S docker run -d --net=host --privileged --restart=always -e AWS_ACCESS_KEY=$1 -e AWS_SECRET_KEY=$2 \
        -e ES3_BUCKET=$3 apacheignite/yardstick-ignite-driver-aws
fi