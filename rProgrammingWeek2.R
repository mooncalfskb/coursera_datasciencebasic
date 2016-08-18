#directory = /Users/mooncalf/Dropbox/skb/coursera/datasciencecoursera/specdata/

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



#directory = /Users/mooncalf/Dropbox/skb/coursera/datasciencecoursera/specdata/

complete <- function(directory = '/Users/mooncalf/Dropbox/skb/coursera/datasciencecoursera/specdata/', id = 1:332){
  
  nobsdf <- data.frame(matrix(ncol=2, nrow=length(id)))
  names(nobsdf) = c("id", "nobs")
  
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

    nobsdf$id[i] = i
    nobsdf$nobs[i] = this_nobs
    
  }
    nobsdf
}



#directory = /Users/mooncalf/Dropbox/skb/coursera/datasciencecoursera/specdata/

corr <- function(directory = '/Users/mooncalf/Dropbox/skb/coursera/datasciencecoursera/specdata/', threshold=114){
  
  corr_vector <- c()
  #nobsdf <- data.frame(matrix(ncol=2, nrow=length(id)))
  #names(nobsdf) = c("id", "nobs")
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



