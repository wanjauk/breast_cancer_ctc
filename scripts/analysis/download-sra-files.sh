#!/bin/bash

# Script to download SRA files from SRA using prefecth tool
# requires SRAtoolkit and entrez-direct packages -> obtained from anaconda repository

# USAGE: 
# ./download-sra-files.sh PRJNA438345 ./../../data/raw

# Study accession
STUDY_ACC=$1

# output directory
DATA_DIR=$2

# get the SRR numbers associated with the study and download directly to Fastq files using fastq-dump
esearch -db sra -query $STUDY_ACC | efetch --format runinfo |cut -d "," -f 1 | grep SRR > $DATA_DIR/SRR_accessions.txt

cd $DATA_DIR

prefetch $(<SRR_accessions.txt)


