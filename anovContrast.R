anovContrast <- function(design){

	group <- attr(design,"dimnames")[[2]]
	k <- length(group)

	str <- character()
	str0 <- as.character()

	for (i in 1:(k-1)){
		for (j in (i+1):k){
		str0 <- paste0(group[i],"vs",group[j]," = ",group[i]," - ",group[j])
		str <- c(str,str0)
		}
	}

	str <- paste0(str,"levels=design")
}
