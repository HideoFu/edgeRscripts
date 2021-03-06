# arguments are filenames of tab separated value.
# they must be sorted in the same order.

binddata <- function(...){
	k=length(list(...))
	if(k<=0){
		stop("no data")
	} else {
		for(i in 1:k){
			if(i==1){
				data <- read.table(list(...)[[1]],header=F,sep="\t")
			} else {
				temp <- read.table(list(...)[[i]],header=F,sep="\t")
				data <- cbind(data,temp[,2])
			}
		}
	}
	return(data)
}

