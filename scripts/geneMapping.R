# Load necessary libraries for gene mapping and phylogenetic tree visualization
library(tidyverse)
library(ggtree)
library(treeio)
library(ggstance)
library(ggnewscale)
library(ggmap)
library(rgr)

# Read the phylogenetic tree data and gene information
tree <- read.astral("~/Desktop/All_counts_gene.trees")
merozoite <- read.table("~/Desktop/genes_merozoite.csv", sep=",", header = T)
ookinete <- read.table("~/Desktop/genes_ookinete.csv", sep=",", header = T)
sporozoite <- read.table("~/Desktop/genes_sporozoite.csv", sep=",", header = T)

# Prepare the gene data for visualization
rownames(merozoite) <- merozoite[, 1]
merozoite[, 1] <- NULL
merozoite <- t(merozoite)

rownames(ookinete) <- ookinete[, 1]
ookinete[, 1] <- NULL
ookinete <- t(ookinete)

rownames(sporozoite) <- sporozoite[, 1]
sporozoite[, 1] <- NULL
sporozoite <- t(sporozoite)

# Create the base phylogenetic tree visualization
p <- ggtree(tree, color="#182b4c", size=1.5) + geom_tiplab(size=4, align=TRUE) 

# Add ookinete gene data to the phylogenetic tree
x <- gheatmap(p, ookinete, offset = 4, width=0.3, 
              low = "white",
              high = "#D3E6AC", colnames_angle = 90,
              font.size = 2.5,
              hjust = 0.395,
              colnames_position = "top",
              legend_title = "Ookinete")

h2 <- x + new_scale_fill()

# Add sporozoite gene data to the phylogenetic tree
h3 <- gheatmap(h2, sporozoite, offset = 12.25, width = 0.2,
               colnames_position = "top",
               low = "white",
               high = "#223F78", colnames_angle = 90,
               font.size = 2.5,
               hjust = 0.395,
               legend_title = "Sporozoite")

h4 <- h3 + new_scale_fill() 

# Add merozoite gene data to the phylogenetic tree
gheatmap(h4, merozoite, offset = 18.25, width = 0.675,
         colnames_position = "top",
         low = "white",
         high = "#4F385E", colnames_angle = 90,
         font.size = 2.5,
         hjust = 0.395,
         legend_title = "Mero
