process KRAKEN2 {

    tag "$kraken2"

    input:
    path trimmed
    path kraken2

    output:
    path "kraken_report.csv"
    path "kraken_output.csv"

    script:
    """
    kraken2 --db $kraken2 \
            --report kraken_report.csv \
            --output kraken_output.csv \
            $trimmed
    """
}


