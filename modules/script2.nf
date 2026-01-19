process PORECHOP {

    tag "${reads.baseName}"

    input:
    path reads

    output:
    path "${reads.baseName}.trimmed.fastq"

    script:
    """
    porechop -i $reads -t 256 --format fastq -o ${reads.baseName}.trimmed.fastq
    """
}
