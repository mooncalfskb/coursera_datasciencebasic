pollutantmean <- function(directory = '/Users/mooncalf/Dropbox/skb/coursera/datasciencecoursera/specdata/', pollutant = 'nitrate', id = 1:332){
  
  pollutantVector = c()
  
  for (i in id){
    if (i < 10){
      padding <- "00"
    }else if (i >=10 && i < 100){
      padding <- "0"
    }else{
      padding <- ""
    }
    filename <- paste(directory, padding, i, ".csv", sep="")
    rawdata <- read.csv(filename)
    pollutantdata <- rawdata[complete.cases(rawdata),pollutant]
    pollutantVector <- c(pollutantVector, pollutantdata)
    
    
  }
  
  mean(pollutantVector)
  
}
