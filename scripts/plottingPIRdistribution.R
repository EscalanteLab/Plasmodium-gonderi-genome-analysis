# Loading necessary libraries
library(karyoploteR)
library(rtracklayer)

# Define the file path for the GFF file
gff.file <- "~/Documents/Karyotype/Pgonderi_V1_PIR.gff"

# Read the first 16 lines of the file to get the header information
header.lines <- readLines(gff.file, n = 16)

# Extracting lines that contain sequence region information
ll <- header.lines[grepl(header.lines, pattern = "##sequence-region")]

# Splitting and converting these lines into a data frame
gg <- data.frame(do.call(rbind, strsplit(ll, split = " ")))

# Converting the start and end positions of the sequences to numeric
gg[,3] <- as.numeric(as.character(gg[,3]))
gg[,4] <- as.numeric(as.character(gg[,4]))

# Creating a GRanges object with the genomic ranges
Pgonderi.genome <- toGRanges(gg[,c(2,3,4)])

# Display the genome ranges
Pgonderi.genome

# Initial karyotype plot setup
kp <- plotKaryotype(genome=Pgonderi.genome)

# Importing the features from the GFF file
features <- import(gff.file)
table(features$type) # Display a table of feature types
genes <- features[features$type=="gene"] # Extract genes from features

# Plotting karyotype without the ideogram
kp <- plotKaryotype(genome=Pgonderi.genome, ideogram.plotter = NULL)
kpAddCytobandsAsLine(kp) # Adding cytobands as lines

# Plotting regions for the genes
kpPlotRegions(kp, data=genes, col="#ABDEE6")

# Plotting karyotype for plus and minus strands separately
kp <- plotKaryotype(genome=Pgonderi.genome, ideogram.plotter = NULL, plot.type=2)
kpAddCytobandsAsLine(kp)
kpPlotRegions(kp, data=genes[strand(genes)=="+"], avoid.overlapping = FALSE)
kpPlotRegions(kp, data=genes[strand(genes)=="-"], avoid.overlapping = FALSE, data.panel=2)

# Setting up plot parameters for better visualization
pp <- getDefaultPlotParams(plot.type=2)
pp$data1outmargin <- 100
pp$data2outmargin <- 100
pp$topmargin <- 450

# Plotting with customized plot parameters
kp <- plotKaryotype(genome=Pgonderi.genome, ideogram.plotter = NULL, plot.type=2, plot.params = pp)
kpAddCytobandsAsLine(kp)
# kpAddMainTitle(kp, "Plasmodium gonderi - Pgon_v02 with genes", cex=2) # Optional: Add a main title
kpPlotRegions(kp, data=genes[strand(genes)=="+"], avoid.overlapping = FALSE, col="#ABDEE6")
kpPlotRegions(kp, data=genes[strand(genes)=="-"], avoid.overlapping = FALSE, col="#97c1a9", data.panel=2)
kpAddLabels(kp, "strand +", cex=0.8, col="#888888") # Adding labels for plus strand
kpAddLabels(kp, "strand -", data.panel=2, cex=0.8, col="#888888") # Adding labels for minus strand
