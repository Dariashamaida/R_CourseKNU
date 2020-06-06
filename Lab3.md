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
