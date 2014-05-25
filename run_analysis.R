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
}
