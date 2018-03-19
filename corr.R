corr <- function(directory, threshold = 0)
{
  y <- vector()
  dr2 <- paste("./",directory,"/",sep = "")
  dat <- as.character(list.files(dr2))
  temp <- paste(dr2, dat, sep="")
  id <- 1:332
  corrr <- numeric()
  for (n in id) 
  {
    x <- id
    fl <- read.csv(temp[n], header=TRUE, sep=",")
    y <- c(y,sum(complete.cases(fl)))
  }
  df <- data.frame(x, y)
  colnames(df) <- c("id","nobs")
  # adding to the complete.R script
  
  nobs = df[df["nobs"] > threshold, ]$id
  corel = numeric()
    for (i in nobs) 
      {
    
    fl2 <- read.csv(temp[i], header=TRUE, sep=",")
    df2 = fl2[complete.cases(fl2), ]
    corel = c(corel, cor(df2$sulfate, df2$nitrate))
      }
  return(corel)

}