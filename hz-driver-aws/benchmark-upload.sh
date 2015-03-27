#!/bin/bash

cnt_bench=$(ls results* 2>/dev/null | wc -l)

if [ ${cnt_bench} == 0 ]; then
    echo "Benchmark result not found!"

    exit 1
fi

# Ploat result.
for file in results-*
do
    bin/jfreechart-graph-gen.sh -gm STANDARD -i ${file}
done

# Rename file.
rename 's/results/hazelcast-results/' results*

# If remote dir contains benchmark result then will generate compare graph.
cnt_bench=$(ls /mnt/*-results-*.tar.gz 2>/dev/null | wc -l)

if [ ${cnt_bench} != 0 ]; then
    echo "Remote directory contains another benchmark results.";
    # Create remove directory and copy results to temp dir.
    mkdir temp_comp

    echo "Start download result from storage."

    cp /mnt/*-results-*.tar.gz ./temp_comp

    echo "Results downloaded."

    for filename in temp_comp/*.tar.gz
    do
      tar zxf $filename
    done

    rm -rf temp_comp/*.tar.gz

    cp -R ./*-results-* ./temp_comp

    lsArra=(./temp_comp/*-results-*)

    bin/jfreechart-graph-gen.sh -gm COMPARISON -i ${lsArra[@]}

    for dir in results-comparison-*
    do
        base=$(basename "$dir")
        tar -czf "${base}$(date -d "today" +"%H%M").tar.gz" "$dir"
    done

    echo "Start upload comparison to storage."

    mv results-comparison-*.tar.gz /mnt

    echo "Comparison results uploaded."

    rm -rf results-comparison-*
fi;

for dir in hazelcast-results-*
do
    base=$(basename "$dir")
    tar -czf "${base}.tar.gz" "$dir"
done

echo "Start upload benchmark results to storage."

mv hazelcast-results-*.tar.gz /mnt

echo "Results uploaded."

rm -rf hazelcast-results-*

rm -rf temp_comp
