# Лабораторна робота № 1

## 1. Створити змінні базових (atomic) типів. Базові типи: character, numeric, integer, complex, logical.

```{R} 
x1<-'hello' <br>
x2<-2      <br>
x3<-1L     <br>
x4<- 1 + 2i  <br>
x5<- TRUE   <br>

x1
[1] "hello"
x2
[1] 2
x3
[1] 1
x4
[1] 1+2i
x5
[1] TRUE
```

# 2. Створити вектори, які: містить послідовність з 5 до 75; містить числа 3.14,
2.71, 0, 13; 100 значень TRUE.

```{R} 
vector1 <- 5:75
vector2 <- c(3.14,2.71,0,13)
vector3 <- rep(TRUE,100)

vector1
 [1]  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
[44] 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75
vector2
[1]  3.14  2.71  0.00 13.00
vector3
  [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [26] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [51] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [76] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
```

# 3. Створити наступну матрицю за допомогою matrix, та за допомогою cbind або rbind
0.5 1.3 3.5
3.9 131 2.8
0   2.2 4.6
2   7   5.1

```{R}
matrix1<- matrix (c(0.5, 1.3, 3.5, 3.9, 131, 2.8, 0, 2.2, 4.6, 2, 7, 5.1), nrow=4, ncol=3, byrow=TRUE)
#or
matrix11<-matrix(c(0.5,3.9,0,2,1.3,131,2.2,7,3.5,2.8,4.6,5.1),ncol=3,nrow=4)

matrix2<-cbind(c(0.5,3.9,0,2),c(1.3,131,2.2,7),c(3.5,2.8,4.6,5.1))
matrix3<-rbind(c(0.5,1.3,3.5),c(3.9,131,2.8),c(0,2.2,4.6),c(2,7,5.1))

matrix1
     [,1]  [,2] [,3]
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1
matrix11
     [,1]  [,2] [,3]
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1
matrix2
     [,1]  [,2] [,3]
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1
matrix3
     [,1]  [,2] [,3]
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1
```

# 4. Створити довільний список (list), в який включити всі базові типи.

```{R}
list_1<-list(1,'a',1+2i,0.25, TRUE)

> list_1
[[1]]
[1] 1

[[2]]
[1] "a"

[[3]]
[1] 1+2i

[[4]]
[1] 0.25

[[5]]
[1] TRUE
```

# 5.Створити фактор з трьома рівнями «baby», «child», «adult».

```{R}
age<-factor(c('adult','baby','child','baby','child','baby'),levels=c('baby','child','adult'))

age
[1] adult baby  child baby  child baby 
Levels: baby child adult
```

# 6. Знайти індекс першого значення NA в векторі 1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11. Знайти кількість значень NA.
```{R}
#R and resuly together`
vector_for_na<-c(1, 2, 3, 4, NA, 6, 7, NA, 9, NA)
match(NA,vector_for_na)
[1] 5
sum(is.na(vector_for_na))
[1] 3
```

# 7.Створити довільний data frame та вивести в консоль.

```{R}
data_frame<-data.frame(place=c('France','UK','Japan','USA'),costs=c(500,1200,1500,2500), time=c(3,4,10,15), continent=c('Eurasia','Eurasia','Eurasia','North America'))

data_frame
   place costs time     continent
1 France   500    3       Eurasia
2     UK  1200    4       Eurasia
3  Japan  1500   10       Eurasia
4    USA  2500   15 North America
```

# 8. Змінити імена стовпців цього data frame.

```{R}
colnames(data_frame) <- c("Country", "Spendings", "Flight time","Mainland")

data_frame
  Country Spendings Flight time      Mainland
1  France       500           3       Eurasia
2      UK      1200           4       Eurasia
3   Japan      1500          10       Eurasia
4     USA      2500          15 North America
```
