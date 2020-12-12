#!/bin/bash

## Some helper functions to put in .bash_profile
## Script downloaded on 2020-12-12 from https://gist.github.com/mfansler/71f09c8b6c9a95ec4e759a8ffc488be3

# download SRR from NCBI SRA via Aspera Connect
# Usage:
#
# $ get-srr SRR304976
#
get-srr () {
    SRR=${1}
    SRR_6=$(echo $SRR | cut -c1-6)
    
    # Tune the ascp parameters for your bandwidth!
    ~/.aspera/connect/bin/ascp -i ~/.aspera/connect/etc/asperaweb_id_dsa.openssh \
	 -k 2 -T -l200m \
	 anonftp@ftp.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByRun/sra/SRR/${SRR_6}/${SRR}/${SRR}.sra \
	 .
}

# download all SRRs listed in a file
get-srr-all () {
    while read srr; do
	get-srr $srr
    done <${1}
}

cd ../../data/raw/SRA_files

get-srr-all SRR_accessions.txt



