#!/bin/bash

# Set aws credentionals.
echo $AWS_ACCESS_KEY:$AWS_SECRET_KEY > /etc/passwd-s3fs

chmod 640 /etc/passwd-s3fs

# Mount ES3 bucket.
s3fs mybucket /mnt

# Clear.
rm -rf logs-*
rm -rf *result*