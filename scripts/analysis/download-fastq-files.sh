#!/bin/bash
# #
# #Script to download fastq files from European Nucleotide Archive
# #
# #USAGE: 
# # ./download-fastq-files.sh \
# # ../../data/raw/savage/savage.fastq.urls.txt /data/kwanjau/savage ;
# # ./download-fastq-files.sh \
# # ../../data/raw/telleria/telleria.fastq.urls.txt /data/kwanjau/telleria
# #
FILE=$1 #File containing fastq url links to EBI FTP site

OUT_DIR=$2 

cat ${FILE} | xargs -n1 wget $3 -P ${OUT_DIR}


# #decompress fastq.gz files
# #
# FASTQ_FILES=${OUT_DIR}/*.fastq.gz

# for file in ${FASTQ_FILES}; do
#     gunzip ${file}
# done
# #-----------------------------------------------------------------
# # Script to download fastq files from SRA using fastq-dump
# # requires SRAtoolkit and entrez-direct packages -> obtained from anaconda repository

# # resource: https://bioinformaticsworkbook.org/dataAcquisition/fileTransfer/sra.html#gsc.tab=0

# # USAGE: 
# # ./download-fastq-files.sh PRJNA438345 ./../../data/raw

# # Study accession
# STUDY_ACC=$1

# # output directory
# DATA_DIR=$2

# # get the SRR numbers associated with the study and download directly to Fastq files using fastq-dump
# esearch -db sra -query $STUDY_ACC | efetch --format runinfo |cut -d "," -f 1 | grep SRR | \
# xargs fastq-dump --split-files --origfmt --gzip -O $DATA_DIR



