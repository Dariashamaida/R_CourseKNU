# Лабораторна робота № 5

### 1. Написати функцію pmean, яка обчислює середнє значення (mean) забруднення сульфатами або нітратами серед заданого переліка моніторів.

```{R]
> pmean("specdata", "sulfate", 1:10)
[1] 4.064128
> pmean("specdata", "sulfate", 55)
[1] 3.587319
> 
> pmean("specdata", "nitrate")
[1] 1.702932

> pmean("specdata", "nitrate",1:20)
[1] 0.8286293
```

### 2. Написати функцію complete, яка виводить кількість повних спостережень (the number of completely observed cases) для кожного файлу.

```{R}
> complete("specdata",1)
  id nobs
1  1  117
> complete("specdata",50:60)
   id nobs
1  50  459
2  51  193
3  52  812
4  53  342
5  54  219
6  55  372
7  56  642
8  57  452
9  58  391
10 59  445
11 60  448
> complete("specdata",c(2,3,5,12,45))
  id nobs
1  2 1041
2  3  243
3  5  402
4 12   96
5 45  424
```

### 3. Написати функцію corr, яка приймає два аргументи: directory (папка, де знаходяться файли спостережень) та threshold (порогове значення, за замовчуванням дорівнює 0) та обчислює кореляцію між сульфатами та нітратами для моніторів, кількість повних спостережень для яких більше порогового значення.
```{R}

> cr <- corr("specdata", 150)
> head(cr); summary(cr)
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 

> cr <- corr("specdata", 25)
> head(cr); summary(cr)
[1] -0.22255256 -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.54537 -0.05939  0.09463  0.11938  0.26597  0.78596 


R version 4.0.0 (2020-04-24) -- "Arbor Day"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R -- это свободное ПО, и оно поставляется безо всяких гарантий.
Вы вольны распространять его при соблюдении некоторых условий.
Введите 'license()' для получения более подробной информации.

R -- это проект, в котором сотрудничает множество разработчиков.
Введите 'contributors()' для получения дополнительной информации и
'citation()' для ознакомления с правилами упоминания R и его пакетов
в публикациях.

Введите 'demo()' для запуска демонстрационных программ, 'help()' -- для
получения справки, 'help.start()' -- для доступа к справке через браузер.
Введите 'q()', чтобы выйти из R.

> setwd("G:\\KNU\\5 курс\\2 семестр\\R\\rprog_data_specdata")
> 
> pmean <- function(directory, pollutant, id=1:length(file_list)){
+     file_list <-  dir(path=directory, pattern =".csv", full.names=TRUE)
+     x <- numeric()
+     for (i in id){
+         all_data <- read.csv(file_list[i])
+         x <- c(x, all_data[[pollutant]])
+     }
+     mean(x, na.rm=TRUE)
+ }
> 
> pmean("specdata", "sulfate", 1:10)
[1] 4.064128
> pmean("specdata", "sulfate", 55)
[1] 3.587319
> 
> pmean("specdata", "nitrate")
[1] 1.702932
> 
> pmean("specdata", "nitrate",1:20)
[1] 0.8286293
> 
> 
> 
> 
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
> 
> complete("specdata",1)
  id nobs
1  1  117
> complete("specdata",50:60)
   id nobs
1  50  459
2  51  193
3  52  812
4  53  342
5  54  219
6  55  372
7  56  642
8  57  452
9  58  391
10 59  445
11 60  448
> complete("specdata",c(2,3,5,12,45))
  id nobs
1  2 1041
2  3  243
3  5  402
4 12   96
5 45  424
> 
> 
> 
> corr <- function(directory, threshold = 0){ 
+     file_list <- dir(path=directory, pattern =".csv", full.names=TRUE) 
+     corr_v <- NULL 
+     for (i in 1:length(file_list)) { 
+         all <- read.csv(file.names[i]) 
+         data <- dat[complete.cases(all),] 
+         
+         if (nrow(data) > threshold) { 
+             corr_vect <- c(corr_vect, cor(data[,"sulfate"], data[, "nitrate"])) 
+         } 
+     } 
+     return(corr_vect) 
+ }
> 
> cr <- corr("specdata", 150)
 Ошибка в read.table(file = file, header = header, sep = sep, quote = quote,  :
  объект 'file.names' не найден 
> corr <- function(directory, threshold = 0){ 
+     file_list <- dir(path=directory, pattern =".csv", full.names=TRUE) 
+     corr_v <- NULL 
+     for (i in 1:length(file_list)) { 
+         all <- read.csv(file_list[i]) 
+         data <- dat[complete.cases(all),] 
+         
+         if (nrow(data) > threshold) { 
+             corr_vect <- c(corr_vect, cor(data[,"sulfate"], data[, "nitrate"])) 
+         } 
+     } 
+     return(corr_vect) 
+ }
> 
> cr <- corr("specdata", 150)
Ошибка в corr("specdata", 150) :объект 'dat' не найден
> 
> 
> corr <- function(directory, threshold = 0){ 
+     file_list <- dir(path=directory, pattern =".csv", full.names=TRUE) 
+     corr_v <- NULL 
+     for (i in 1:length(file_list)) { 
+         all <- read.csv(file_list[i]) 
+         data <- all[complete.cases(all),] 
+         
+         if (nrow(data) > threshold) { 
+             corr_vect <- c(corr_vect, cor(data[,"sulfate"], data[, "nitrate"])) 
+         } 
+     } 
+     return(corr_vect) 
+ }
> 
> cr <- corr("specdata", 150)
Ошибка в corr("specdata", 150) :объект 'corr_vect' не найден
> 
> 
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
> 
> cr <- corr("specdata", 150)
> head(cr); summary(cr)
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 
> cr <- corr("specdata", 2000)
> head(cr); summary(cr)
NULL
Length  Class   Mode 
     0   NULL   NULL 
> 
> 
> 
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
> 
> cr <- corr("specdata", 150)
> head(cr); summary(cr)
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 
> 
> 
> corr <- function(directory, threshold = 0){ 
+     file_list <- dir(path=directory, pattern =".csv", full.names=TRUE) 
+     corr_v <- NULL 
+     for (i in 1:length(file_list)) { 
+         all <- read.csv(file_list[i]) 
+         data <- all[complete.cases(all),] 
+         if (nrow(data) > threshold) { 
+             corr_v <- c(corr_v, cor(data[,"sulfate"], data[, "nitrate"])) 
+         } 
+         else corr_v<-0
+     } 
+     return(corr_v) 
+ }
> 
> cr <- corr("specdata", 150)
> head(cr); summary(cr)
[1] 0
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
      0       0       0       0       0       0 
> 
> 
> corr <- function(directory, threshold = 0){ 
+     file_list <- dir(path=directory, pattern =".csv", full.names=TRUE) 
+     corr_v <- NULL 
+     for (i in 1:length(file_list)) { 
+         all <- read.csv(file_list[i]) 
+         data <- all[complete.cases(all),] 
+         if (nrow(data) > threshold) { 
+             corr_v <- c(corr_v, cor(data[,"sulfate"], data[, "nitrate"])) 
+         } 
+         else {v<-0}
+     } 
+     return(corr_v) 
+ }
> 
> cr <- corr("specdata", 150)
> head(cr); summary(cr)
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 
> 
> 
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
> 
> cr <- corr("specdata", 150)
> head(cr); summary(cr)
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 
> 
> cr <- corr("specdata", 25)
> head(cr); summary(cr)
[1] -0.22255256 -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.54537 -0.05939  0.09463  0.11938  0.26597  0.78596 

> cr <- corr("specdata", 3500)
> head(cr); summary(cr);length(cr)
NULL
Length  Class   Mode 
     0   NULL   NULL 
[1] 0
