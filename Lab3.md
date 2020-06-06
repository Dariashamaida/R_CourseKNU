# Лабораторна робота №3

### 1. Функція add2(x, y), яка повертає суму двох чисел.

```{R}
> add2<-function(x,y){
+     x+y
+ }
>#x plus y
> add2(15,47)
[1] 62
> add2(87.2,12.8)
[1] 100
```

### 2. Функція above(x, n), яка приймає вектор та число n, та повертає всі елементі вектору, які більше n. По замовчуванню n = 10.

```{R}
> above<-function(x,n=10){
+     x[x>n]
+ }
> vector<-c(4:12)

> #case when n is default
> above(vector)
[1] 11 12

> #case when n is customed 
> above(vector,8)
[1]  9 10 11 12
```

### 3. Функція my_ifelse(x, exp, n), яка приймає вектор x, порівнює всі його елементи за допомогою exp з n, та повертає елементи вектору, які відповідають умові expression. Наприклад, my_ifelse(x, “>”, 0) повертає всі елементи x, які більші 0. Exp може дорівнювати “<”, “>”, “<=”, “>=”, “==”. Якщо exp не співпадає ні з одним з цих виразів, повертається вектор x.

```{R}
> my_ifelse<- function(x,exp,n){
+     if (exp==">") {x[x>n]}
+     else if (exp==">=") {x[x>=n]}
+     else if (exp=="<")  {x[x<n]}
+     else if (exp=="<=") {x[x<=n]}
+     else if (exp=="==") {x[x==n]}
+     else {x[x]}
+     }
> c<-c(1:15)

> #checking > condition
> my_ifelse(vector,">",10)
[1] 11 12 13 14 15

> #checking >= condition
> my_ifelse(vector,">=",13)
[1] 13 14 15

> #checking < condition
> my_ifelse(vector,"<",5)
[1] 1 2 3 4

> #checking <= condition
> my_ifelse(vector,"<=",6)
[1] 1 2 3 4 5 6

> #checking == condition
> my_ifelse(vector,"==",6)
[1] 6

> #checking if the condition is not suitable
> my_ifelse(vector,"notgood",6)
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
```

