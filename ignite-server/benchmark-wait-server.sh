#!/bin/bash
while pgrep -u root benchmark-boots > /dev/null;
do
    sleep 1;
done
