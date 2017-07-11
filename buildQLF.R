# contrast は比較関係のベクトル。ex. c(0,0,1,-1)
# 上記は4群で群3と群4を比較。

buildQLF <- function(y, design, contrast){
	
  library(statmod)

  y <- estimateDisp(y, design, robust= TRUE)
  
  fitq <- glmQLFit(y, design)
  qlf <- glmQLFTest(fitq, contrast = contrast)
  
  plotMD(qlf)
  
  invisible(qlf)
}
