process FLYE {

    
    input:
    path reads

    output:
    path "assembly.fasta"

    script:
    """
    flye \
      --nano-raw $reads \
      --out-dir flye_out \
      --threads 128

    cp flye_out/assembly.fasta .
    """
}
