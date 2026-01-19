process FASTQC {

    tag "$reads"

    input:
    path reads

    output:
    path "*_fastqc.*"

    script:
    """
    fastqc ${reads}
    """
}
