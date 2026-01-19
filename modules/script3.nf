process MEGAHIT {

    input:
    path reads

    output:
    path "final.contigs.fa"

    script:
    """
    megahit -r $reads \
      --min-contig-len 1000 \
      -t 128 \
      -o megahit_out
    cp megahit_out/final.contigs.fa .
    """
}
