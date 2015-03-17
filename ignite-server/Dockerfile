# Start from a Debian image.
FROM debian:wheezy

# Install tools.
RUN apt-get update && apt-get install -y --fix-missing \
  openjdk-7-jdk \
  maven \
  git

# Sets java variables.
#ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# Prepare work directory.
#RUN rm -rf /home/benchmark && mkdir /home/benchmark

# Set work dir
#WORKDIR /home/benchmark

# Checkout benchmark
#RUN git clone https://github.com/gridgain/yardstick-gridgain.git


#ENTRYPOINT /go/bin/outyet

# Document that the service listens on port 8080.
#EXPOSE 8080