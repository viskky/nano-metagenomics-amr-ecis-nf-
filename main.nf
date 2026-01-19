nextflow.enable.dsl=2

/* fastqc (script 1) porechop (script 2) megahit (script3) flye (script4) prokka (script5) hmmer (script6) kraken2(script7) abricate(script8) */
params.reads = "data/*.fastq"
params.hmm     = "resources/*.hmm"
params.kraken2     = "resources/minikraken2_v2_8GB_201904_UPDATE"

include { FASTQC } from './modules/script1.nf'
include { PORECHOP } from './modules/script2.nf'
include { MEGAHIT } from './modules/script3.nf'
include { FLYE } from './modules/script4.nf'
include { PROKKA } from './modules/script5.nf'
include { HMMSEARCH } from './modules/script6.nf'
include { KRAKEN2 } from './modules/script7.nf'
include { ABRICATE } from './modules/script8.nf'
workflow {

    reads_ch = Channel.fromPath(params.reads)
    
    fastqc = FASTQC(reads_ch)
    
    trimmed = PORECHOP(reads_ch)

    assembly = MEGAHIT(trimmed)

    proteins = PROKKA(assembly)

    ABRICATE(assembly)
    
    hmm_ch = Channel.fromPath(params.hmm)
    kraken2_ch = Channel.fromPath(params.kraken2)

    HMMSEARCH(proteins, hmm_ch)

    KRAKEN2(trimmed,kraken2_ch)

}
