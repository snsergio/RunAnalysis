run_analysis <- function() {
  ## define the working directory
  defaultwd <- "/Users/Sergio/Documents/Coursera/Repos/GetCleanData"
  
  ## check if current directory is the working directory
  if (getwd() != "/Users/Sergio/Documents/Coursera/Repos/GetCleanData") {
    setwd(defaultwd)
  }
  
  ## Project's directory into WD is "UCI HAR Dataset"
  ## changing directory to "UCI HAR Dataset"
  setwd(paste(defaultwd, "UCI HAR Dataset", sep = ""))
  
  ## Into Project's "UCI HAR Dataset" directory are the "test" and "train" directories where files are
  allfiles <- list.files()
  
  subject_test  <- read.table ("UCI HAR Dataset/test/subject_test.txt",   header = F)
  x_test        <- read.table ("UCI HAR Dataset/test/x_test.txt",         header = F)
  y_test        <- read.table ("UCI HAR Dataset/test/y_test.txt",         header = F)
  subject_train <- read.table ("UCI HAR Dataset/train/subject_train.txt", header = F)
  x_train       <- read.table ("UCI HAR Dataset/train/x_train.txt",       header = F)
  y_train       <- read.table ("UCI HAR Dataset/train/y_train.txt",       header = F)
  
  ## Merging files on same subject
  subject_out <- rbind(subject_test, subject_train)
  x_out       <- rbind(x_test, x_train)
  y_out       <- rbind(y_test, y_train)
  
  ## Creating the output dataset
  collection <- cbind(x_out, subject_out, y_out)
  
  ## Get the dataset header information and editing them
  collectionnames <- read.table ("UCI HAR Dataset/features.txt", header = F)
  names(collection) <- collectionnames[, 2] ## Command to include header names to dataframe
   
  
}
