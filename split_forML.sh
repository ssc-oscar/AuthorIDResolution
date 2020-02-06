#for splitting the block_IDS files use the below command:

split -n l/$1 -d block_IDS.txt block_IDS_



#The following algorithm is for splitting the forML file into subparts corresponding to how
#the blockIDS split:

cnt=0
for filename in *; do
	if [[ $filename == *"block_IDS_"* ]]; then
		s=$(sed -n 1p $filename)
		e=$(sed -n $(cat $filename | wc -l)p $filename)
		echo $s $e
		st=$(grep -n "^$s;" uncomp_forML.txt | head -n 1 | cut -d: -f1)
		en=$(grep -n "^$e;" uncomp_forML.txt | tail -n 1 | cut -d: -f1)	
		sed -n "$st,$en p" uncomp_forML.txt > block_chunk_$cnt
		((cnt++))
	fi;
done;

#sed -n 5,8p file 
