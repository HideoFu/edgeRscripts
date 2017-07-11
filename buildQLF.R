# contrast is a vector,like "c(0,0,1,-1)". this example has 4 levels and compare 3rd level over 4th.
# the order of levels is based on "design".

buildQLF <- function(y, design, contrast){
	
  library(statmod)

  y <- estimateDisp(y, design, robust= TRUE)
  
  fitq <- glmQLFit(y, design)
  qlf <- glmQLFTest(fitq, contrast = contrast)
  
  plotMD(qlf)
  
  invisible(qlf)
}
