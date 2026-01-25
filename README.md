# nano-metagenomics-amr-ecis-nf-
Find antimicrobial resistance genes, phage-tail like structures and microbial diversities in a microbiome
# Nano Microbiome AMR & Phage Detection Pipeline

This repository provides an automated bioinformatics workflow for analyzing
Nanopore (ONT PromethION) metagenomic FASTQ data to detect:

- Antimicrobial resistance (AMR) genes
- Phage-like and contractile injection system (CIS) proteins
- Microbial taxonomic diversity

## All Tools Used Must Be Pre-Installed Locally on Linux
- FastQC
  
```
 #Install fastqc 
$ sudo apt install fastqc
```
For [troubleshooting](https://github.com/Morgan-Feuz/fastqc)

- Porechop

```
 #Install Porechop 
$ sudo apt install porechop
```

For [troubleshooting](https://github.com/rrwick/Porechop)

- FLYE

Installation [guide](https://github.com/mikolmogorov/Flye)

- Prokka

Installation [guide](https://github.com/tseemann/prokka)

- HMMER

```
 #Install HMMER 
$ sudo apt install hmmer
```
For [troubleshooting](http://hmmer.org/documentation.html)

- Kraken2

Installation [guide](https://medium.com/@ma2mp/installing-kraken-2-on-linux-and-macos-378f06cb7f72)

- Abricate

```
sudo apt-get install bioperl ncbi-blast+ gzip unzip git \
  libjson-perl libtext-csv-perl libpath-tiny-perl liblwp-protocol-https-perl libwww-perl
git clone https://github.com/tseemann/abricate.git
./abricate/bin/abricate --check
./abricate/bin/abricate --setupdb
./abricate/bin/abricate ./abricate/test/assembly.fa
```
For [troubleshooting](https://github.com/tseemann/abricate)


## Workflow Overview

FASTQ
 ↓
FastQC
 ↓
Porechop
 ↓
FLYE assembly
 ↓
Prokka
 ↓
HMMSEARCH
 ↓
Kraken2
 ↓
Abricate 


## Required Input
- Raw ONT FASTQ files
- HMM models (HMM file must be indexed)

## Output
- Assembly metrics
- Functional annotation
- AMR gene profiles
- Phage/CIS HMM hits
- Taxonomic classification

## Usage
```
nextflow run main.nf --reads <path/*fastq> --hmm <path/*hmm> --kraken2 <path to kraken database/> -profile standard
```
# nano-metagenomics-amr-ecis-nf-




