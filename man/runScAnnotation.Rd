% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scAnnotation.R
\name{runScAnnotation}
\alias{runScAnnotation}
\title{runScAnnotation}
\usage{
runScAnnotation(dataPath, statPath, savePath = NULL, authorName = NULL,
  sampleName = "sc", bool.filter.cell = T, bool.filter.gene = T,
  anno.filter = c("mitochondrial", "ribosome", "dissociation"),
  nCell.min = 3, bgPercent.max = 0.001, vars.to.regress = c("nUMI",
  "mito.percent", "ribo.percent"), pc.use = 30, resolution = 0.8,
  clusterStashName = "default", show.features = NULL,
  bool.add.features = T, bool.runDiffExpr = T, n.markers = 5,
  species = "human", hg.mm.mix = F, bool.runCellClassify = T,
  ct.templates = NULL, coor.names = c("tSNE_1", "tSNE_2"),
  bool.runMalignancy = T, cutoff = 0.1, p.value.cutoff = 0.5,
  bool.intraTumor = T, bool.runCellCycle = T, bool.runStemness = T,
  bool.runGeneSets = T, geneSets = NULL, geneSet.method = "average",
  bool.runExprProgram = T, nmf.rank = 50, genReport = T)
}
\arguments{
\item{dataPath}{A path containing the cell ranger processed data.
Under this path, folders 'filtered_feature_bc_matrix' and 'raw_feature_bc_matrix' exist generally.}

\item{statPath}{A path containing the results files of step 'runScStatistics'.}

\item{savePath}{A path to save the results files. If NULL, the 'statPath' will be used instead.}

\item{authorName}{A character string for authors name and will be shown in the report.}

\item{sampleName}{A character string giving a label for this sample.}

\item{bool.filter.cell}{A logical value indicating whether to filter the cells
according to the QC of 'scStatistics'.}

\item{bool.filter.gene}{A logical value indicating whether to filter the genes
according to the QC of 'scStatistics'.}

\item{anno.filter}{A vector indicating the types of genes to be filtered.
Must be some of c("mitochondrial", "ribosome", "dissociation")(default).}

\item{nCell.min}{An integer number used to filter gene. The default is 3.
Genes with the number of expressed cells less than this threshold will be filtered.}

\item{bgPercent.max}{A float number used to filter gene. The default is 0.001.
Genes with the background percentage larger than this threshold will be filtered.}

\item{vars.to.regress}{A vector indicating the variables to regress out in R package Seurat.
The default is c("nUMI", "mito.percent", "ribo.percent").}

\item{pc.use}{An integer number indicating the number of PCs to use as input features. The default is 30.}

\item{resolution}{A float number used in function 'FindClusters' in Seurat. The default is 0.8.}

\item{clusterStashName}{A character string used as the name of cluster identies. The default is "default".}

\item{show.features}{A list or vector for genes to be plotted in 'markerPlot'.}

\item{bool.add.features}{A logical value indicating whether to add default features to 'show.features' or not.}

\item{bool.runDiffExpr}{A logical value indicating whether to perform differential expressed analysis.}

\item{n.markers}{A integer indicating the number of differential expressed genes showed in the plot. The defalut is 5.}

\item{species}{A character string indicating what species the sample belong to.
Only "human"(default) or "mouse" are allowed.}

\item{hg.mm.mix}{A logical value indicating whether the sample is a mix of
human cells and mouse cells(such as PDX sample).
If TRUE, the arguments 'hg.mm.thres' and 'mix.anno' should be set to corresponding values.}

\item{bool.runCellClassify}{A logical value indicating whether to predict the usual cell type. The default is TRUE.}

\item{ct.templates}{A list of vectors of several cell type templates.
The default is NULL and the templates prepared in this package will be used.}

\item{coor.names}{A vector indicating the names of two-dimension coordinate used in visualization.}

\item{bool.runMalignancy}{A logical value indicating whether to estimate malignancy.}

\item{cutoff}{A threshold used in the CNV inference.}

\item{p.value.cutoff}{A threshold to decide weather the bimodality distribution of malignancy score is significant.}

\item{bool.intraTumor}{A logical value indicating whether to identify tumor clusters and perform following analyses.}

\item{bool.runCellCycle}{A logical value indicating whether to estimate cell cycle scores.}

\item{bool.runStemness}{A logical value indicating whether to estimate stemness scores.}

\item{bool.runGeneSets}{A logical value indicating whether to estimate gene sets signature scores.}

\item{geneSets}{A list of gene sets to be analyzed. The default is NULL and 50 hallmark gene sets from MSigDB will be used.}

\item{geneSet.method}{The method to be used in calculate gene set scores. Currently, only "average" and "GSVA" are allowed.}

\item{bool.runExprProgram}{A logical value indicating whether to run non-negative matrix factorization (NMF) to identify expression programs.}

\item{nmf.rank}{An integer of decomposition rank used in NMF.}

\item{genReport}{A logical value indicating whether to generate a .html/.md report (suggest to set TRUE).}
}
\value{
A results list with all useful objects used in the function.
}
\description{
Use Seurat package to perform data normalization,
highly variable genes identification, dimensionality reduction, clustering and differential expression analysis.
Predict cell type. Infer CNV.
}
