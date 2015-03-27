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
rename 's/results/ignite-results/' results*

# If remote dir contains benchmark result then will generate compare graph.
cnt_bench=$(ls /mnt/*-results-* 2>/dev/null | wc -l)

if [ ${cnt_bench} != 0 ]; then
    echo "Remote directory contains another benchmark results.";
    # Create remove directory and copy results to temp dir.
    mkdir temp_comp

    echo "Start download result from storage."

    cp -R /mnt/*-results-* ./temp_comp

    echo "Results downloaded."

    cp -R ./*-results-* ./temp_comp

    lsArra=(./temp_comp/*-results-*)

    bin/jfreechart-graph-gen.sh -gm COMPARISON -i ${lsArra[@]}

    echo "Start upload comparison to storage."

    mv results-comparison-* /mnt

    echo "Comparison results uploaded."
fi;

echo "Start upload benchmark results to storage."

mv ignite-results-* /mnt

echo "Results uploaded."

rm -rf temp_comp