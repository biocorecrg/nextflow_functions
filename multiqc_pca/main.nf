process MULTIQC_PCA {
    
    container 'biocorecrg/deseq2:2022_2'

    input:
    tuple val(meta), path(input_files)
    path(desc)
    val(wtype)
    val(extrapars)
	
    output:
    path("*_data.tsv"), emit: data
    path("*_variance.tsv"), emit: variance
	
	
    script:
    """
    multiqc_pca.R -type ${wtype} -desc ${desc}  ${extrapars} 
    """
}
