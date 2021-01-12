# #!/bin/bash
#
#Script to convert sam files to sorted bam files
#
# USAGE:
# ./convert-sam-to-bam.sh \
# /data/kwanjau_shared/scratch/reads-alignment-output \
# /data/kwanjau_shared/scratch/sam-to-bam-output \


# make directory for sorted bam files output
mkdir -p /data/kwanjau_shared/scratch/sam-to-bam-output


# sam files directory
SAM_DIR=$1

# bam files directory
BAM_DIR=$2

# convert sam file to sorted bam files
for sam_file in ${SAM_DIR}/*.sam; do
	sam_file_name=$(basename "$sam_file" .sam)
        samtools view -S -b $sam_file | \
        samtools sort -@ 16 -o ${BAM_DIR}/${sam_file_name}.sorted.bam
done







