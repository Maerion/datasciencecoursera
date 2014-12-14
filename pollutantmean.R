setwd("~/WorkDir")
#set working dir

list.files("specdata")
#get a list of the files

files <- list.files("specdata")
files
#store the output

files_full <- list.files("specdata", full.names=TRUE)
files_full
#append the path to the file name 

dat <- data.frame()
for (i in 1:332) {
    dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)
#create data frame

pollutantmean <- function(directory, pollutant, id = 1:332) {
files <- (Sys.glob("specdata//*.csv"))[id];
combined_data <- c()
for (file in files) {
file_data <- read.csv(file, sep = ",");
pollutant_data <- file_data[,pollutant];
pollutant_data <- pollutant_data[!is.na(pollutant_data)]
combined_data <- c(combined_data, pollutant_data)
}
return(mean(combined_data));
}
#create function

pollutantmean("specdata", "sulfate", 1:10)
[1] 4.064128
> pollutantmean("specdata", "nitrate", 70:72)
[1] 1.706047
> pollutantmean("specdata", "nitrate", 23)
[1] 1.280833
