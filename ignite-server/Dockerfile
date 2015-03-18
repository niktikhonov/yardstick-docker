# Start from a Debian image.
FROM ntikhonov/yardstick-env

# Prepare work directory.
RUN mkdir /home/benchmark

RUN chmod 777 /home/benchmark

WORKDIR /home/benchmark

# Checkout benchmark.
RUN git clone https://git-wip-us.apache.org/repos/asf/incubator-ignite

# Build benchmark.
WORKDIR /home/benchmark/incubator-ignite

RUN git checkout sprint-2

RUN mvn clean package -Prelease,benchmarks -DskipTests=true -Dmaven.javadoc.skip=true -pl modules/yardstick -am

RUN cp -R modules/yardstick/bin modules/yardstick/libs/ modules/yardstick/config ./

# Start benchmark server
# ./bin/benchmark-manual-servers-start.sh ./config/benchmark.properties
# mvn clean package -Prelease,benchmarks -DskipTests=true -Dmaven.javadoc.skip=true -pl modules/yardstick -am

#ENTRYPOINT /home/benchmark/