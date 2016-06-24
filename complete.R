complete <- function(directory, id = 1:332){
  filNames <- sprintf("%03d.csv", id)
  complCases <- c()
  for(i in filNames){
    dat <- read.csv(file.path(directory, i), na.strings = "NA") 
    complCases <- c(complCases, nrow(dat[complete.cases(dat),]))
  }  
  data.frame(id, nobs=complCases)
}