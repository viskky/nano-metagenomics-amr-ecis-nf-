process ABRICATE {

    input:
    path contigs

    output:
    path "amr.tsv"

    script:
    """
    abricate --db ncbi $contigs > amr.tsv
    """
}
