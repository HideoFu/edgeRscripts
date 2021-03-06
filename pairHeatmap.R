# make a heatmap of most significantly changed n genes.

pairHeatmap <- function(y, qlf, cexR=0.8, n=50){

	library(gplots)
	library(statmod)

	# make fit object

	top <- topTags(qlf, n=n)

	mydist=function(c){dist(c,method="euclidian")}
	myclust=function(c){hclust(c,method="average")}

	# logCPM Heatmap

	datatable <- top@.Data[[1]]
	m <- match(rownames(datatable),rownames(y$genes))
	datatable2 <- cpm(y)[m,]
	data <- log2(as.matrix(datatable2)+1)

  heatmap.2(data, hclustfun=myclust, distfun=mydist, na.rm = TRUE, scale="none", dendrogram="both", margins=c(6,7), Rowv=TRUE, Colv=TRUE, symbreaks=FALSE, key=TRUE, symkey=FALSE, density.info="none", trace="none", main="log CPM", cexRow=cexR, cexCol=1, labRow=datatable[,"symbol"],col=rev(heat.colors(75)))

}
