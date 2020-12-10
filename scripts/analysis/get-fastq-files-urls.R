#!/usr/bin/env Rscript
#Obtain FASTQ urls to download the data used in this study from ENA database.

# ENA metadata
# code adopted from: 
# https://wiki.bits.vib.be/index.php/Download_read_information_and_FASTQ_data_from_the_SRA

# required libraries
library(tidyverse)
library(here)

# accession numbers from Lang et al (PMID: 29868978) - (doi:10.1245/s10434-018-6540-4)
accession_num <- "SRP135702"

# create directories to store the files if they don't exist.
lang_dir <- here::here("data", "raw", "lang_raw")
if (!dir.exists(lang_dir)) {
  dir.create(lang_dir, recursive=TRUE)
}
    
    # construct the url to ENA database
    ena.url <- paste("https://www.ebi.ac.uk/ena/portal/api/filereport?accession=",
                     accession_num,
                     "&result=read_run",
                     "&fields=study_accession,sample_accession,",
                     "experiment_accession,run_accession,scientific_name,fastq_ftp,",
                     "submitted_ftp,sra_ftp",
                     "&download=true",
                     sep="")
    
    # Load the metadata from ENA
    ENA.metadata <- read.table(url(ena.url), header=TRUE, sep="\t")

    # coerce the fastq_ftp column from factor to character.
    ENA.metadata$fastq_ftp <- as.character(ENA.metadata$fastq_ftp)

    # ensure that R1 and R2 fastq files are in separate rows
    ENA.metadata <- ENA.metadata %>% separate_rows(fastq_ftp, sep=";")
    
    # get the fastq urls
    fastq.urls <- ENA.metadata[grepl("fastq_ftp", names(ENA.metadata))]
    
    # create a text file with urls to fastq files in ENA database
    write.table(fastq.urls, here::here(lang_dir, "lang.fastq.urls.txt"), 
                eol = "\n", 
                quote = FALSE,
                col.names = FALSE,
                row.names = FALSE)
