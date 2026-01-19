process HMMSEARCH {

    tag "$hmm"    

    input:
    path proteins
    path hmm

    output:
    path "ecis_hits.txt"

    script:
    """
    hmmsearch --cpu 256 \
      --tblout ecis_hits.txt \
      $hmm \
      $proteins
    """
}
