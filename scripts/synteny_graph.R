# Load the GENESPACE package for synteny genomic data analysis
library(GENESPACE)

# Set the working directory for the analysis
runwd <- file.path("~/Desktop/R_GeneSpace/")

# Define a vector of genome IDs representing different species or strains
gids <- c("Prelictum", "Pblacklocki", "Pbillcollinsi", "Padleri", "Pgaboni", 
          "Preichenowi", "Ppraefalciparum", "Pfalciparum", "Pberghei", "Pchabaudi", 
          "Pyoelii", "Povale", "Pmalariae", "Pbrasilianum", "Pgonderi", "Pcoatneyi", 
          "Pknowlesi", "Pcynomolgi", "Pvivax")

# Initialize the GeneSpace environment with specific parameters for the analysis
gpar <- init_genespace(
  genomeIDs = gids, 
  speciesIDs = gids, 
  versionIDs = gids, 
  ploidy = rep(1,19),
  wd = runwd, 
  gffString = "gff", 
  pepString = "pep",
  path2orthofinder = "orthofinder", 
  path2mcscanx = "~/Downloads/MCScanX-master",
  rawGenomeDir = file.path(runwd, "rawGenomes"))

# Parse the genome annotations based on specified parameters
parse_annotations(
  gsParam = gpar, 
  gffEntryType = "gene", 
  gffIdColumn = "locus",
  gffStripText = "locus=", 
  headerEntryIndex = 1,
  headerSep = " ", 
  headerStripText = "locus=")

# Run OrthoFinder to find orthologous genes across the different genomes
gpar <- run_orthofinder(gsParam = gpar)

# Perform synteny analysis to identify conserved blocks of genes across genomes
gpar <- synteny(gsParam = gpar)

# Generate a Riparian plot to visualize synteny and gene conservation
ripdat <- plot_riparianHits(gpar, blackBg = FALSE, returnSourceData = T, verbose = F, reorderChrs = F,
                            invertTheseChrs = data.frame(genome = c("Pchabaudi","Pknowlesi"), chr = c("09","12")),
                            useBlks = TRUE,
                            refGenome = "Pgonderi",
                            refChrCols = c("#D3E6AC", "#B8DBAF", "#A0D4B9", "#90CCC5", 
                                           "#ACDAE6", "#92CEDE", "#6EBDDC", "#2897CE", 
                                           "#1F74AD", "#1C548C", "#223F78", "#686EC0", 
                                           "#614C96", "#4F385E"))
