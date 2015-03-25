# Start from a Debian image.
FROM ntikhonov/yardstick-env

# Prepare work directory.
RUN mkdir /home/benchmark

WORKDIR /home/benchmark

# Checkout benchmark.
RUN git clone https://git-wip-us.apache.org/repos/asf/incubator-ignite

# Build benchmark.
WORKDIR /home/benchmark/incubator-ignite

RUN git checkout ignite-497

RUN mvn clean package -Prelease,benchmarks -DskipTests=true -Dmaven.javadoc.skip=true -pl modules/yardstick -am

RUN cp -R modules/yardstick/bin modules/yardstick/libs/ modules/yardstick/config ../

WORKDIR /home/benchmark/

RUN rm -rf /home/benchmark/incubator-ignite

# Run ignite server.
ENTRYPOINT bin/benchmark-manual-servers-start.sh config/benchmark-es2.properties \
  &&  while pgrep -u root benchmark-boots > /dev/null; do sleep 1; done