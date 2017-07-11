makeHeatmap <- function(y, design, con, cexR=0.8, n=50){

	library(gplots)
	library(statmod)

	#fit �̍쐬

	y <- estimateDisp(y, design, robust = TRUE)

	fit <- glmQLFit(y, design, robust= TRUE)

	anov <- glmQLFTest(fit, contrast = con)
	top <- topTags(anov, n=n)

	mydist=function(c){dist(c,method="euclidian")}
	myclust=function(c){hclust(c,method="average")}

	# logFC Heatmap

	dim <- ncol(con)
	datatable <- top@.Data[[1]]
	data <- as.matrix(datatable[,2:(dim+1)])

        heatmap.2(data, hclustfun=myclust, distfun=mydist, na.rm = TRUE, scale="none", dendrogram="both", margins=c(6,7), Rowv=TRUE, Colv=TRUE, symbreaks=TRUE, key=TRUE, symkey=FALSE, density.info="none", trace="none", main="log FC", cexRow=cexR, cexCol=1, labRow=datatable[,"symbol"],col=rev(redgreen(75)))

	# logCPM Heatmap

	m <- match(rownames(datatable),rownames(y$genes))
	datatable2 <- cpm(y)[m,]
	data <- log2(as.matrix(datatable2)+1)

        heatmap.2(data, hclustfun=myclust, distfun=mydist, na.rm = TRUE, scale="none", dendrogram="both", margins=c(6,7), Rowv=TRUE, Colv=TRUE, symbreaks=FALSE, key=TRUE, symkey=FALSE, density.info="none", trace="none", main="log CPM", cexRow=cexR, cexCol=1, labRow=datatable[,"symbol"],col=rev(heat.colors(75)))

	plotMDS(y)
}
