

corr <- function(directory = '/Users/mooncalf/Dropbox/skb/coursera/datasciencecoursera/specdata/', threshold=150){
  
  corr_vector <- c()
  id <- 1:332
  
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
    cleandata <- rawdata[complete.cases(rawdata), ]
    this_nobs <- nrow(cleandata)
    
    if (this_nobs >= threshold){
      corr_vector <- c(corr_vector,cor(cleandata$nitrate, cleandata$sulfate))
    }
    
  }
  corr_vector
}



