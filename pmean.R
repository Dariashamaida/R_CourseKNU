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
>### complete function
> complete <- function(directory, id=1:length(file_list)){
+     file_list <- dir(path=directory, pattern =".csv", full.names=TRUE)
+     nobs <- numeric()
+     for (i in id){
+         all_data <- read.csv(file_list[i])
+         nobs <- c(nobs, sum(complete.cases(all_data)))
+         }
+ data.frame(id, nobs)
+ }
>
>### corr function
> corr <- function(directory, threshold = 0){ 
+     file_list <- dir(path=directory, pattern =".csv", full.names=TRUE) 
+     corr_v <- NULL 
+     for (i in 1:length(file_list)) { 
+         all <- read.csv(file_list[i]) 
+         data <- all[complete.cases(all),] 
+         if (nrow(data) > threshold) { 
+             corr_v <- c(corr_v, cor(data[,"sulfate"], data[, "nitrate"])) 
+         } 
+     } 
+     return(corr_v) 
+ }


