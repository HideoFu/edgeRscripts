# y is a DGEList object

buildDesign <- function(y){
  design <- model.matrix(~0+group, data=y$samples)
  colnames(design) <- levels(y$samples$group)

  invisible(design)
}
