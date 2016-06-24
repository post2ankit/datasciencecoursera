pollutantmean <- function(directory, pollutant, id = 1: 332){
  files <- sprintf("%03d.csv", id)
  complete.data <- data.frame()
  for(i in files){
    dat <- read.csv(file.path(directory, i), na.strings = "NA") 
    complete.data <- rbind(complete.data, dat)  
  }  
  pol <- complete.data[pollutant]
  pol <- pol[!is.na(pol)] 
  mean(pol, na.rm = TRUE) 
}