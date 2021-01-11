# #!/bin/bash

# USAGE: 
# ./index-genome.sh \
# ../../data/scratch/GCF_000001405.33_GRCh38.p7_genomic.fna \
# ../../data/scratch/indexed_genome

# make a directory to store the indexed genomes
 mkdir -p ../../data/scratch/indexed_genome

#
#index genome using HISAT2
#
GENOME_FILE=$1

INDEX_DIR=$2

hisat2-build ${GENOME_FILE} ${INDEX_DIR}/GCF_000001405.33_GRCh38.p7_index_hisat2
