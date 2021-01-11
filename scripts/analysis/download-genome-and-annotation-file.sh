# Download genome and annotation files from:
# https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.33_GRCh38.p7/

# Download genome Build 38 patch release 7 (GRCh38.p7)
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.33_GRCh38.p7/GCF_000001405.33_GRCh38.p7_genomic.fna.gz \
-P ../../data/scratch/

# Download GFF file
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.33_GRCh38.p7/GCF_000001405.33_GRCh38.p7_genomic.gff.gz \
-P ../../data/scratch

# unzip the genome file
gunzip ../../data/scratch/GCF_000001405.33_GRCh38.p7_genomic.fna.gz
