# Лабораторна робота № 4

```{R}
> data_for_lab = read.csv("C:\\Users\\Dasha\\Downloads\\hw1_data.csv")
```

### 1. Які назви стовпців файлу даних?

```{R}
> colnames(data_for_lab )
[1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day" 
```
### 2. Виведіть перші 6 строк фрейму даних.
```{R}

> data_for_lab [1:6, ] #or
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
5    NA      NA 14.3   56     5   5
6    28      NA 14.9   66     5   6
> head(data_for_lab,6)
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
5    NA      NA 14.3   56     5   5
6    28      NA 14.9   66     5   6
```
### 3. Скільки спостерігань (строк) в дата фреймі?
> nrow(data_for_lab)
[1] 153
