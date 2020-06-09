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

