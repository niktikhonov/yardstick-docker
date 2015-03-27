# Start from a Debian image.
FROM ntikhonov/yardstick-env

# Prepare work directory.
RUN mkdir /home/benchmark

WORKDIR /home/benchmark

# Copy benchmark.
ADD ./benchmark.tar ./

# Run hazelcast server.
#ENTRYPOINT LOCAL_IP=$(ip addr show dev eth0 | sed -nr 's/.*inet ([^ ]+)\/.*/\1/p') \
#  bin/benchmark-manual-servers-start.sh config/benchmark-ec2.properties \
#  &&  while pgrep -u root benchmark-boots > /dev/null; do sleep 1; done