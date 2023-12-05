The `reverseTranslation.py` script translates the aligned amino acid sequences with their corresponding nucleotide sequences using input FASTA files, and then prints the aligned nucleotide sequences.

How to run it: 


```
python reverseTranslation.py amino_acid_file.fasta nucleotide_file.fasta
```


The `RSCU_GC_heatmap.R` script generates a heatmap from a CSV file containing genomic data. It uses ComplexHeatmap and circlize libraries for visualization. The script reads the data, transposes it, and creates a heatmap with specific color settings and annotations based on GC content.

How to run it:
```
1. Ensure you have R installed and the ComplexHeatmap and circlize libraries.
2. Place your CSV file (e.g., cds_codon.csv - which is available in data folder) on your Desktop or modify the path in the script.
3. Run the script in R or RStudio.
```

The `geneMapping.R` visualizes a phylogenetic tree and maps gene data onto it. It employs libraries like tidyverse, ggtree, and ggmap to read tree and gene data from CSV files and then overlays this data onto the phylogenetic tree.


How to run it:
```
1. Ensure R is installed along with the required libraries: tidyverse, ggtree, treeio, ggstance, ggnewscale, ggmap, and rgr.
2. Place your tree and gene data files (e.g., All_counts_gene.trees, genes_merozoite.csv, etc. - which are available in data folder) in the specified location, typically on the Desktop, or adjust the file paths in the script accordingly.
3. Execute the script in R or RStudio.
```

The `plottingPIRdistribution.R` script uses the karyoploteR and rtracklayer libraries to create karyotype plots from genomic data stored in a GFF file. It reads the genome data, extracts features, and visualizes these on karyotype plots, including separate plots for plus and minus strands of genes. The script offers customizable options for better visualization of the genomic data.

How to run it:
```
1. Ensure R is installed along with the karyoploteR and rtracklayer libraries.
2. Place your GFF file (e.g., Pgonderi_V1_PIR.gff) in the specified directory, usually in the Documents folder, or adjust the file path in the script.
3. Execute the script in R or RStudio.
```

The `synteny_graph.R` script utilizes the GENESPACE package to analyze synteny among various genomes. It sets up the analysis environment, parses genome annotations, runs OrthoFinder to find orthologous genes, performs synteny analysis to identify conserved gene blocks, and generates a Riparian plot to visualize synteny and gene conservation across multiple species.

How to run it:
```
1. Ensure R is installed along with the GENESPACE package.
2. Set the working directory and place the necessary genome files (in formats like GFF, pep, etc.) in the specified locations or adjust file paths in the script.
3. Execute the script in R or RStudio.
```
