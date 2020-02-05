block_IDS_$what | while read id; do n=$(cat $what/of/of.$id | wc -l); [[ $n == 1 ]] && cat $what/if/fin.$id; done | gzip > $what.whole

block_IDS_$what | while read id; do n=$(cat $what/of/of.$id | wc -l); [[ $n != 1 ]] && perl fix.perl $what $id; done | gzip > $what.split