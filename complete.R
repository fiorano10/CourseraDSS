complete <- function(directory, id = 1:332)
{
  y <- vector()
  dr2 <- paste("./",directory,"/",sep = "")
  dat <- as.character(list.files(dr2))
  temp <- paste(dr2, dat, sep="")

     for (n in id) 
    {
      x <- id
      fl <- read.csv(temp[n], header=TRUE, sep=",")
      y <- c(y,sum(complete.cases(fl)))
     }
  
  df <- data.frame(x, y)
  colnames(df) <- c("id","nobs")
  return(df)
}