process PROKKA {

    input:
    path contigs

    output:
    path "*.faa"

    script:
    """
    prokka $contigs \
      --genus \
      --cpus 256 \
      --outdir prokka_out \
      --prefix sample
    cp prokka_out/*.faa .
    """
}
