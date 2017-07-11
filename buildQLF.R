# contrast �͔�r�֌W�̃x�N�g���Bex. c(0,0,1,-1)
# ��L��4�Q�ŌQ3�ƌQ4���r�B

buildQLF <- function(y, design, contrast){
	
  library(statmod)

  y <- estimateDisp(y, design, robust= TRUE)
  
  fitq <- glmQLFit(y, design)
  qlf <- glmQLFTest(fitq, contrast = contrast)
  
  plotMD(qlf)
  
  invisible(qlf)
}