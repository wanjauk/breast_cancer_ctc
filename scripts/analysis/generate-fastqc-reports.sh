# #!/bin/bash
#
#Script to generate FastQC reports using the FastQC tool
#
# USAGE:
# bash generate-fastqc-reports.sh ../../results/figures/fastqc_reports /data/kwanjau_shared/lang_data
#
# make directory to store the results
mkdir -p ../../results/figures/fastqc_reports 

# fastqc reports directory
REPORT_DIR=$1

# fastq files directory
FASTQ_DIR=$2

for file in $FASTQ_DIR/*.fastq.gz; do
   fastqc ${file} -o ${REPORT_DIR} -f fastq
done
