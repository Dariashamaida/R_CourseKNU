1. Створити змінні базових (atomic) типів. Базові типи: character, numeric,
integer, complex, logical.

``````R`````   <br>
x1<-'hello' <br>
x2<-2      <br>
x3<-1L     <br>
x4<- 1 + 2i  <br>
x5<- TRUE   <br>

````````
> x1
[1] "hello"
> x2
[1] 2
> x3
[1] 1
> x4
[1] 1+2i
> x5
[1] TRUE

2. Створити вектори, які: містить послідовність з 5 до 75; містить числа 3.14,
2.71, 0, 13; 100 значень TRUE.
```R
vector1 <- 5:75
vector2 <- c(3.14,2.71,0,13)
vector3 <- rep(TRUE,100)
```
vector1
 [1]  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
[44] 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75
> vector2
[1]  3.14  2.71  0.00 13.00
> vector3
  [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [26] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [51] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [76] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
> 


3. Створити наступну матрицю за допомогою matrix, та за допомогою cbind
або rbind
0.5 1.3 3.5
3.9 131 2.8
0 2.2 4.6
2 7 5.1

matrix1<- matrix (c(0.5, 1.3, 3.5, 3.9, 131, 2.8, 0, 2.2, 4.6, 2, 7, 5.1), nrow=4 ncol=3, byrow=TRUE)
matrix2<- cbind(c(0.5,3.9,0,2),c(1.3, 131,  2.2, 7 ), c(3.5, 2.8,  4.6 , 5.1 ))


     [,1]  [,2] [,3]
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1
> matrix2<- cbind(c(0.5,3.9,0,2),c(1.3, 131,  2.2, 7 ), c(3.5, 2.8,  4.6 , 5.1 ))
> matrix2
     [,1]  [,2] [,3]
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1
