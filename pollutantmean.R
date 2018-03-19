pollutantmean <- function(directory,pollutant, id = 1:332)            
{   
    dr2 <- paste("./",directory,"/",sep = "")
    dat <- as.character(list.files(dr2))
    temp <- paste(dr2, dat, sep="")
    mean_data <- c()
      
    for(n in id) 
      {
        fl <- read.csv(temp[n], header=TRUE, sep=",")
        rm_na <- fl[!is.na(fl[, pollutant]), pollutant]
        mean_data <- c(mean_data, rm_na)
       }
    
    mean_data <- mean(mean_data)
    print(mean_data)
    
}
