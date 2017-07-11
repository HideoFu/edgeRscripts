# x is a data.frame. x[,1] must have the name "symbol".
# group is factor.
# n is the number of replicates in smallest level.

buildDGE <- function(x, group,n=2){
  library(org.Hs.eg.db)
  library(edgeR)
  
  egSYMBOL <- toTable(org.Hs.egSYMBOL) # list having Entrez_id and symbol
  m <- match(x$symbol,egSYMBOL$symbol)
  x$gene_id <- egSYMBOL[m,"gene_id"] # add Entrez_id
  
  keep <- !(is.na(x$gene_id))
  x <- x[keep,]
  i <- ncol(x)
  x <- x[,c(1,i,2:(i-1))]
  
  y <- DGEList(counts=x[,3:i],genes=x[,1:2],group=group)
  
  rownames(y$counts) <- rownames(y$genes) <- y$genes$gene_id
  y$genes$gene_id <- NULL
  
  keep <- rowSums(cpm(y)>1)>=n
  y <- y[keep,,keep.lib.sizes=F]
  
  y <- calcNormFactors(y)

# return DGEList object

  invisible(y)
}
