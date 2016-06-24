complete -> function(directory, id = 1:332){
  filNames <- sprintf("%03d.csv", id)
  files <- c()
  complCases <- c()
  for(i in filNames){
    dat <- read.csv(file.path(directory, i), na.strings = "NA")  
    ##files <- c(files, i)
    ##complCase <- complete.cases(dat)
    ##complCases <- c(complCases, complCase)
  }  
  data.frame(files, complCases)
}