// unzipping
process UNZIP {
    label ("process_medium")
    tag "${meta.id}"

    container 'quay.io/biocontainers/gzip:1.11'

    input:
    tuple val(meta), path(file)

    output:
    tuple val(meta), path("*")
    
    script:
    
    """
    	zcat ${file} > ${file.getBaseName()}
    """
}
