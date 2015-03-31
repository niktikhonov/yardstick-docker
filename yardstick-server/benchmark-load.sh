#!/bin/bash

# Clean up a working directory.
rm -rf ./*/

# Check that repo url is set.
if [ -z ${BENCH_REPO} ]; then
    echo "Repository with benchmark is unset. Please set BENCH_REPO variable."

    exit 1
fi

# Clone repo and enter.
git clone ${BENCH_REPO}

cd $(ls -d */)

# Try checkout to specific branch.
if [ ! -z ${BENCH_BRANCH} ]; then
    echo "Checkout to $BENCH_BRANCH."

    git checkout "$BENCH_BRANCH"
fi

if [ ! -f config/benchmark.properties ]; then
    echo "File config/benchmark.properties not found!"

    exit 1
fi

# Export benchmark label
while read p; do
    if [[ ${p} == BENCHMARK_LABEL* ]]; then
        export BENCHMARK_LABEL=$(echo ${p} | sed 's/.*=\(.*\)/\1/')
    fi
done < config/benchmark.properties

# Build benchmark.
mvn clean package

if [ $? -eq 0 ]; then
    echo "$BENCHMARK_LABEL benchmarks succeffuly built."
else
    echo "$BENCHMARK_LABEL benchmarks weren't built."
fi

# cd to benchmark directory.
cd $(ls -d */)