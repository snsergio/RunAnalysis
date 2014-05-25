run_analysis <- function() {
  ## define the working directory
  defaultwd <- "/Users/Sergio/Documents/Coursera/Repos/GetCleanData"
  
  ## check if current directory is the working directory
  if (getwd() != "/Users/Sergio/Documents/Coursera/Repos/GetCleanData") {
    setwd(defaultwd)
  }
  
  ## Project's directory into WD is "UCI HAR Dataset"
  ## changing directory to "UCI HAR Dataset"
  setwd(paste(defaultwd, "UCI HAR Dataset", sep = "/"))
  
  ## Into Project's "UCI HAR Dataset" directory are the "test" and "train" directories where files are
  allfiles <- list.files()
  
  subject_test  <- read.table ("./test/subject_test.txt",   header = F)
  x_test        <- read.table ("./test/x_test.txt",         header = F)
  y_test        <- read.table ("./test/y_test.txt",         header = F)
  subject_train <- read.table ("./train/subject_train.txt", header = F)
  x_train       <- read.table ("./train/x_train.txt",       header = F)
  y_train       <- read.table ("./train/y_train.txt",       header = F)
  
  ## Merging files on same subject
  subject_out <- rbind(subject_test, subject_train)
  x_out       <- rbind(x_test, x_train)
  y_out       <- rbind(y_test, y_train)
  
  ## Get the x dataset header information
  x_out_names <- read.table ("./features.txt", header = F)
  ## Include header names to dataframe
  names(x_out) <- x_out_names[, 2] 
  tidynames <- c()
  for (i in 1 : ncol(x_out)) {
    vartest <- grepl("mean", names(x_out[i]), ignore.case = T)
    if (vartest) { tidynames <- append(tidynames, names(x_out[i])) }
    vartest <- grepl("std", names(x_out[i]), ignore.case = T)
    if (vartest) { tidynames <- append(tidynames, names(x_out[i])) }    
  }
  tidyout <- x_out[, (names(x_out) %in% tidynames)]
  
  ## Creating the output dataset
  tidyout <- cbind(tidyout, subject_out, y_out)
  names(tidyout)[87] <- paste("subject")
  names(tidyout)[88] <- paste("activity")
  for (i in 1:nrow(tidyout)) {
    if (tidyout[i, 88] == 1) { tidyout[i, 88] <- c("WALKING") }
    if (tidyout[i, 88] == 2) { tidyout[i, 88] <- c("WALKING_UPSTAIRS") }
    if (tidyout[i, 88] == 3) { tidyout[i, 88] <- c("WALKING_DOWNSTAIRS") }
    if (tidyout[i, 88] == 4) { tidyout[i, 88] <- c("SITTING") }
    if (tidyout[i, 88] == 5) { tidyout[i, 88] <- c("STANDING") }
    if (tidyout[i, 88] == 6) { tidyout[i, 88] <- c("LAYING") }    
  }
  write.table(tidyout, file = "./TidyDataOut.txt", append = F, quote = F, sep = "\t")
  
  ## Creating second dataset
  actw <- tidyout[tidyout[88] == "WALKING", ]
  actwu <- tidyout[tidyout[88] == "WALKING_UPSTAIRS", ]
  actwd <- tidyout[tidyout[88] == "WALKING_DOWNSTAIRS", ]
  actsit <- tidyout[tidyout[88] == "SITTING", ]
  actsta <- tidyout[tidyout[88] == "STANDING", ]
  actl <- tidyout[tidyout[88] == "LAYING", ]
  
  tidyout2 <- matrix(nrow = 6, ncol = 88)
  for (i in 1:(ncol(actw)-1))    { tidyout2[1, i] <- mean(actw[, i])   }
  for (i in 1:(ncol(actwu)-1))   { tidyout2[2, i] <- mean(actwu[, i])  }
  for (i in 1:(ncol(actwd)-1))   { tidyout2[3, i] <- mean(actwd[, i])  }
  for (i in 1:(ncol(actsit)-1))  { tidyout2[4, i] <- mean(actsit[, i]) }
  for (i in 1:(ncol(actsta)-1)) { tidyout2[5, i] <- mean(actsta[, i]) }
  for (i in 1:(ncol(actl)-1))    { tidyout2[6, i] <- mean(actl[, i])   }
  ## tidyout2 <- cbind(tidyout2, c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
  names(tidyout2) <- paste(names(tidyout))
  
  write.table(tidyout2, file = "./TidyMeanOut.txt", append = F, quote = F, sep = "\t")
}


