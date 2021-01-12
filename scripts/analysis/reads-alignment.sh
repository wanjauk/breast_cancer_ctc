# #!/bin/bash
#
#Script to align reads to the indexed genome using HISAT2
#

# load the samtools module
module load samtools/1.9

#USAGE:
# ./reads-alignment.sh \
# /data/kwanjau_shared/lang_data \
# ../../data/scratch/indexed_genome \
# /data/kwanjau_shared/scratch/reads-alignment-output \
# /data/kwanjau_shared/scratch/bam-output


# create alignment output directory
mkdir -p /data/kwanjau_shared/scratch/reads-alignment-output
mkdir -p /data/kwanjau_shared/scratch/bam-output

# Fastq directory
FASTQ_DIR=$1

# genome index directory
INDEX_DIR=$2

# alignment output directory
ALIGN_OUT=$3

# bam file output
BAM_OUT=$4

for fastq in `ls -1 ${FASTQ_DIR}/*_1.fastq.gz | sed 's/_1.fastq.gz//'` ; do
fqname=$(basename "$fastq" .fastq)

hisat2 \
		 -x ${INDEX_DIR}/GCF_000001405.33_GRCh38.p7_index_hisat2 \
		 -1 ${fastq}*_1.fastq.gz \
     -2 ${fastq}*_2.fastq.gz \
		 -p 16 \
		--summary-file ${ALIGN_OUT}/${fqname}.txt \
		--new-summary | \
		samtools sort -@ 16 -o ${BAM_OUT}/${fqname}.sorted.bam
		
done
