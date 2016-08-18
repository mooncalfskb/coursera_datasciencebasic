complete <- function(directory = '/Users/mooncalf/Dropbox/skb/coursera/datasciencecoursera/specdata/', id = 1:332){
  
  nobsdf <- data.frame(matrix(ncol=2, nrow=length(id)))
  names(nobsdf) = c("id", "nobs")
  j=1
  
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
    
    nobsdf$id[j] = i
    nobsdf$nobs[j] = this_nobs
    j <- j + 1
  }
  nobsdf
}