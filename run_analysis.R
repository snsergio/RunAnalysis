run_analysis <- function() {
  ## define the working directory
  defaultwd <- "/Users/Sergio/Documents/Coursera/Getting and Cleaning Data/WD"
  
  ## check if current directory is the working directory
  if (getwd() != "/Users/Sergio/Documents/Coursera/Getting and Cleaning Data/WD") {
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

  subject_out <- merge(subject_test, subject_train, all = T)
  x_out       <- merge(x_test, x_train, all = T)
  y_out       <- merge(y_test, y_train, all = T)
  
  print(dim(subject_test))
  print(dim(x_test))
  print(dim(y_test))
  print(dim(subject_train))
  print(dim(x_train))
  print(dim(y_train))
  
  print(dim(subject_out))
  print(dim(x_out))
  print(dim(y_out))
  
  print("done")
  
  ## print(head(prog_out), 2)
}
