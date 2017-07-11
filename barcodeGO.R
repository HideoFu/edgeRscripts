# go_id は文字列。"GO:0003735" のように入力
# labels はプロットのラベル。

barcodeGO <- function(qlf,go_id,labels=c("Up","Down")){
  library(GO.db)
  library(org.Hs.eg.db)
  
  Rkeys(org.Hs.egGO2ALLEGS) <- go_id
  ind <- ids2indices(as.list(org.Hs.egGO2ALLEGS),rownames(qlf$table))
  
  term <- select(GO.db, keys=go_id, columns="TERM")
  main <- paste(go_id, as.character(term$TERM[1]))
  
  barcodeplot(qlf$table$logFC, ind[[1]], main=main,labels=labels, quantiles=c(-1,1),xlab="logFC")
  
  # qlf ファイルからのlogFC データ抽出
  
  sel_genes <- ind[[1]]
  gotable <- cbind(qlf$table[sel_genes,],genes=qlf$genes[sel_genes,])
  i <- ncol(gotable)
  gotable <- gotable[,c(i,1:(i-1))]
  fcsort <- order(gotable$logFC)
  gotable <- gotable[fcsort,]
  
  return(gotable)
  
}