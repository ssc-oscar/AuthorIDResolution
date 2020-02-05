split -n l/16 -da2 block_IDS_$what block_IDS_$what.
mkdir -p $what/if
mkdir -p $what/of
for j in {00..15}
do (cat block_IDS_$what.$j | while read id; do cat block_chunk_$what | grep "^$id;" > $what/if/fin.$id; sed "s|INPUT|$what/if/fin.$id|;s|OUTPUT|$what/of/of.$id|" basicModel.r | R --no-save -q &>/dev/null; done) &
done
wait