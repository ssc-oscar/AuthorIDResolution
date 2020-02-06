# AuthorIDResolution
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3653069.svg)](https://doi.org/10.5281/zenodo.3653069)

The following are descriptions for the files in the repo:

prep.sh:
Used for first round of grouping the ID data. The script will group the IDs based on name, email, and ... Some of the scripts used in prep.sh can be found here: https://bitbucket.org/swsc/lookup/src/master/

split_forML.sh:
Used to split the output file from prep.sh into X sub-files. This script produces two different files: block_chunk_* files that holds the metadata of the IDs, and block_IDS_* that holds just the block ID values. Both file types are used alongside each other for the R script. 

compute.sh:
Used for launching R processes in parallel. The script will split the chunk/IDS file into 16 sub-parts, and launch each in parallel against the R script. WARNING: There is no set value for the thread count in the script

filter.sh:
Used to filter the output data from the R script into 2 file types: .whole and .split. The .whole files will hold blocks that were all recognized as the same user, and .split holds the blocks who potentially split into sub-groups and shows its new grouping scheme.

basicModel.R:
Used for the second round of grouping IDs. The compute.sh used this R script for processing the data. 

rfBasicModel.RData:
Used by the basicMode.R script, and holds the model of the Random Forest used in the grouping algorithm. 
