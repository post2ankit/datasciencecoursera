corr <- function(directory, threshold = 0){
  filNames <- dir(directory, pattern =".csv") 
  correlatedNos <- c()
  for(i in filNames){
    dat <- read.csv(file.path(directory, i), na.strings = "NA") 
    if (nrow(dat[complete.cases(dat),]) > threshold){
      dat <- dat[complete.cases(dat),]
      correlatedNos <- c(correlatedNos, cor(dat[2], dat[3]))  
    }
  }  
  correlatedNos
}