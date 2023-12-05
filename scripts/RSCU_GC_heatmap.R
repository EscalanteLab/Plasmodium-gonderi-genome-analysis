# Load necessary libraries for heatmap and circular visualization creation
library(ComplexHeatmap)
library(circlize)

# Read in the CSV file as a data frame and configure it for the heatmap
df <- read.csv("~/Desktop/cds_codon.csv", header = T, sep = ",")
rownames(df) <- df[, 1]  # Set the row names of the dataframe
df[, 1] <- NULL  # Remove the first column
df <- as.matrix(df)  # Convert the dataframe to a matrix
df <- t(df)  # Transpose the matrix

# Define a color function for the heatmap
col_fun = colorRamp2(c(15, 22, 35), c("#f988ff", "#7f00b2", "#1b004b"))

# Create a heatmap annotation with specific parameters - GC CONTENT!
ha = HeatmapAnnotation(GC = c(15.20, 15.52, 16.69, 16.93, 17.24, ...),
                       col = list(GC = col_fun),
                       foo = anno_empty(border = FALSE),
                       annotation_height = unit(c(1.25:0.25), "cm"))

# Generate the heatmap with the defined settings
Heatmap(df,
        cluster_rows = FALSE,
        cluster_columns = FALSE,
        name = "RSCU",
        row_names_gp = gpar(fontsize = 8.5),
        top_annotation = ha,
        col = c("#E8F9FD","#79DAE8" ,"#2155CD"),
        width = unit(15, "cm"))
