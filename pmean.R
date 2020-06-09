# In this file codes for functions are saved

### Setting work directory

setwd("G:\\KNU\\5 курс\\2 семестр\\R\\rprog_data_specdata")

### pmean function

> pmean <- function(directory, pollutant, id=1:length(file_list)){
+    file_list <-  dir(path=directory, pattern =".csv", full.names=TRUE)
+     x <- numeric()
+     for (i in id){
+         all_data <- read.csv(file_list[i])
+         x <- c(x, all_data[[pollutant]])
+     }
+     mean(x, na.rm=TRUE)
+ }
> 
>
