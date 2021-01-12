# #!/bin/bash
#
#Script to counts the number of reads aligned to Human genome using HTSeq.
#Resource: HTSeq documentation https://htseq.readthedocs.io/en/latest/count.html
#
# load the htseq module
module load htseq/0.9

# USAGE:
# ./reads-quantification.sh \
# /data/kwanjau_shared/scratch/reads-alignment-output \
# ../../data/scratch/gencode.v25.annotation.gtf \
# ../../data/intermediate/read_counts


# make directory for reads count output from htseq
mkdir -p ../../data/intermediate/read_counts


# path to bam files
BAM_DIR=$1

# T. brucei genome annotation file.
GTF_FILE=$2

# read counts path
READ_COUNTS_DIR=$3

# reads counting (Savage single-end reads)
for bam_file in ${BAM_DIR}/*.sorted.bam; do
    bam_file_name=$(basename "$bam_file" .sorted.bam)
    
        htseq-count \
            -f bam \
            -r pos \
            -s no \
            -t exon \
            -i gene_id \
            $bam_file \
            $GTF_FILE \
            > ${READ_COUNTS_DIR}/${bam_file_name}.counts.txt
done

