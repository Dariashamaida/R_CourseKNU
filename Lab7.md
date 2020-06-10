# Лабораторна робота № 7

## Part 0 - data frame preparation

```{R}
> prepare_set <- function(file_name) { 
+     data <- read.csv(file_name, skip = 1, 
+     header = TRUE, encoding='UTF-8', 
+     stringsAsFactors = FALSE) 
+     colnames(data)[1] <- "Country"
+     cycle<- length(colnames(data[1]))
+     for (i in 1:cycle) {
+         colnames(data)=sub("X..", "", colnames(data), fixed=TRUE)
+         colnames(data)=sub("X01..", "Gold", colnames(data))
+         colnames(data)=sub("X02..", "Silver", colnames(data))
+         colnames(data)=sub("X03..", "Bronze", colnames(data))
+         }
+     country_names <- strsplit(data$Country, "(", fixed = TRUE)
+     data$Country <- sapply(country_names, "[", 1)
+     data$ID <- substr(sapply(country_names, '[', 2), 1,3)
+     data <- subset(data, data$Country!="Totals")
+ data}

#### here is result of part 0
> prepare_set('olympics.csv')
                   Country Summer Gold Silver Bronze Total Winter Gold.1 Silver.1 Bronze.1 Total.1 Games Gold.2 Silver.2 Bronze.2
1             Afghanistan      13    0      0      2     2      0      0        0        0       0    13      0        0        2
2                 Algeria      12    5      2      8    15      3      0        0        0       0    15      5        2        8
3               Argentina      23   18     24     28    70     18      0        0        0       0    41     18       24       28
4                 Armenia       5    1      2      9    12      6      0        0        0       0    11      1        2        9
5             Australasia       2    3      4      5    12      0      0        0        0       0     2      3        4        5
6               Australia      25  139    152    177   468     18      5        3        4      12    43    144      155      181
7                 Austria      26   18     33     35    86     22     59       78       81     218    48     77      111      116
8              Azerbaijan       5    6      5     15    26      5      0        0        0       0    10      6        5       15
9                 Bahamas      15    5      2      5    12      0      0        0        0       0    15      5        2        5
10                Bahrain       8    0      0      1     1      0      0        0        0       0     8      0        0        1
11               Barbados      11    0      0      1     1      0      0        0        0       0    11      0        0        1
12                Belarus       5   12     24     39    75      6      6        4        5      15    11     18       28       44
13                Belgium      25   37     52     53   142     20      1        1        3       5    45     38       53       56
14                Bermuda      17    0      0      1     1      7      0        0        0       0    24      0        0        1
15                Bohemia       3    0      1      3     4      0      0        0        0       0     3      0        1        3
16               Botswana       9    0      1      0     1      0      0        0        0       0     9      0        1        0
17                 Brazil      21   23     30     55   108      7      0        0        0       0    28     23       30       55
18    British West Indies       1    0      0      2     2      0      0        0        0       0     1      0        0        2
19               Bulgaria      19   51     85     78   214     19      1        2        3       6    38     52       87       81
20                Burundi       5    1      0      0     1      0      0        0        0       0     5      1        0        0
21               Cameroon      13    3      1      1     5      1      0        0        0       0    14      3        1        1
22                 Canada      25   59     99    121   279     22     62       56       52     170    47    121      155      173
23                  Chile      22    2      7      4    13     16      0        0        0       0    38      2        7        4
24                  China       9  201    146    126   473     10     12       22       19      53    19    213      168      145
25               Colombia      18    2      6     11    19      1      0        0        0       0    19      2        6       11
26             Costa Rica      14    1      1      2     4      6      0        0        0       0    20      1        1        2
27            Ivory Coast      12    0      1      0     1      0      0        0        0       0    12      0        1        0
28                Croatia       6    6      7     10    23      7      4        6        1      11    13     10       13       11
29                   Cuba      19   72     67     70   209      0      0        0        0       0    19     72       67       70
30                 Cyprus       9    0      1      0     1     10      0        0        0       0    19      0        1        0
31         Czech Republic       5   14     15     15    44      6      7        9        8      24    11     21       24       23
32         Czechoslovakia      16   49     49     45   143     16      2        8       15      25    32     51       57       60
33                Denmark      26   43     68     68   179     13      0        1        0       1    39     43       69       68
34               Djibouti       7    0      0      1     1      0      0        0        0       0     7      0        0        1
35     Dominican Republic      13    3      2      1     6      0      0        0        0       0    13      3        2        1
36                Ecuador      13    1      1      0     2      0      0        0        0       0    13      1        1        0
37                  Egypt      21    7      9     10    26      1      0        0        0       0    22      7        9       10
38                Eritrea       4    0      0      1     1      0      0        0        0       0     4      0        0        1
39                Estonia      11    9      9     15    33      9      4        2        1       7    20     13       11       16
40               Ethiopia      12   21      7     17    45      2      0        0        0       0    14     21        7       17
41                Finland      24  101     84    117   302     22     42       62       57     161    46    143      146      174
42                 France      27  202    223    246   671     22     31       31       47     109    49    233      254      293
43                  Gabon       9    0      1      0     1      0      0        0        0       0     9      0        1        0
44                Georgia       5    6      5     14    25      6      0        0        0       0    11      6        5       14
45                Germany      15  174    182    217   573     11     78       78       53     209    26    252      260      270
46 United Team of Germany       3   28     54     36   118      3      8        6        5      19     6     36       60       41
47           East Germany       5  153    129    127   409      6     39       36       35     110    11    192      165      162
48           West Germany       5   56     67     81   204      6     11       15       13      39    11     67       82       94
49                  Ghana      13    0      1      3     4      1      0        0        0       0    14      0        1        3
50          Great Britain      27  236    272    272   780     22     10        4       12      26    49    246      276      284
51                 Greece      27   30     42     39   111     18      0        0        0       0    45     30       42       39
52                Grenada       8    1      0      0     1      0      0        0        0       0     8      1        0        0
53              Guatemala      13    0      1      0     1      1      0        0        0       0    14      0        1        0
54                 Guyana      16    0      0      1     1      0      0        0        0       0    16      0        0        1
55                  Haiti      14    0      1      1     2      0      0        0        0       0    14      0        1        1
56              Hong Kong      15    1      1      1     3      4      0        0        0       0    19      1        1        1
57                Hungary      25  167    144    165   476     22      0        2        4       6    47    167      146      169
58                Iceland      19    0      2      2     4     17      0        0        0       0    36      0        2        2
   Combined.total  ID
1               2 AFG
2              15 ALG
3              70 ARG
4              12 ARM
5              12 ANZ
6             480 AUS
7             304 AUT
8              26 AZE
9              12 BAH
10              1 BRN
11              1 BAR
12             90 BLR
13            147 BEL
14              1 BER
15              4 BOH
16              1 BOT
17            108 BRA
18              2 BWI
19            220 BUL
20              1 BDI
21              5 CMR
22            449 CAN
23             13 CHI
24            526 CHN
25             19 COL
26              4 CRC
27              1 CIV
28             34 CRO
29            209 CUB
30              1 CYP
31             68 CZE
32            168 TCH
33            180 DEN
34              1 DJI
35              6 DOM
36              2 ECU
37             26 EGY
38              1 ERI
39             40 EST
40             45 ETH
41            463 FIN
42            780 FRA
43              1 GAB
44             25 GEO
45            782 GER
46            137 EUA
47            519 GDR
48            243 FRG
49              4 GHA
50            806 GBR
51            111 GRE
52              1 GRN
53              1 GUA
54              1 GUY
55              2 HAI
56              3 HKG
57            482 HUN
58              4 ISL
 [ reached 'max' / getOption("max.print") -- omitted 88 rows ]
```

## Part 1
```{R}
> olymp <- prepare_set("olympics.csv")
```
### Питання 1 - Котра країна виграла найбільшу кількість золотих нагород на літніх іграх? Функція повинна повернути одне текстове значення.
```{R}

> answer_one = function(){
+     olymp[which.max(olymp[[3]]), "Country"]
+ }
> answer_one ()
[1] "United States "
```

### Питання 2 - Яка країна має найбільшу різницю між кількістю нагород на літніх та зимових іграх? Функція повинна повернути одне текстове значення.
```{R}
> answer_two = function(){
+     olymp[which.max(olymp$Total-olymp$Total.1), "Country"]
+ }
> answer_two ()
[1] "United States "
```

### Питання 3 - В якій крайні найбільша різниця між літніми та зимовими золотими нагородами відносно до загальної кількості нагород (Summer Gold - Winter Gold) / Total Gold. Врахувати тільки країни які мають як мінімум по одній нагороді в літніх та зимових іграх. Функція повинна повернути одне текстове значення.
```{R}
> answer_three <-function(){
+     data_cond <- subset(olymp, Gold >0 & Gold.1 >0)
+     data_cond[which.max((data_cond$Gold-data_cond$Gold.1)/data_cond$Gold.2), "Country"]
+     }
> answer_three ()
[1] "Bulgaria "
```

### Питання 4 -Необхідно знайти кількість балів по кожній крайні. Бали рахуються наступним чином: Золота нагорода Gold.2 це три бали, срібна Silver.2 - 2 бали та бронзова Bronze.2 – 1 бал. Функція повинна повертати дата фрейм довжиною 146, який складається з двох колонок: "Country", "Points".

```{R}

> answer_four <- function(){
+     olymp$Score = (olymp$Gold.2*3+olymp$Silver.2*2 +olymp$Bronze.2)
+     data_frame <- data.frame(olymp$Country,  olymp$Score)
+     names(data_frame) <- c('Country', 'Score')
+     data_frame
+ }

> #read first 10 records
> head(answer_four(),10)
        Country Score
1  Afghanistan      2
2      Algeria     27
3    Argentina    130
4      Armenia     16
5  Australasia     22
6    Australia    923
7      Austria    569
8   Azerbaijan     43
9      Bahamas     24
10     Bahrain      1

> #read last 5 records
> tail(answer_four(),5)
                              Country Score
142                       Yugoslavia    171
143 Independent Olympic Participants      4
144                           Zambia      3
145                         Zimbabwe     18
146                       Mixed team     38
```
## Part 2

### Питання 5 - В якому штаті (state) більше всього округів (county)?
```{R}
> answer_five<-function() {
+     groupped <- split(census_df, census_df$STNAME)
+     count_per_state <- sapply(groupped, nrow)
+     max_state <- names(which.max(count_per_state))
+     max_state
+ }

> answer_five()
[1] "Texas"
```

### Питання 6 - Якщо розглядати три найбільш населених округа (county) з кожного штату, які три найбільш населені штати (в порядку з більш до менш населеного)?
```{R}
> answer_six<-function() {
+     cs_ord<-census_df[order(census_df$STNAME, -census_df$CENSUS2010POP), ]
+     cs_gr <- split(cs_ord, census_df$STNAME)
+     cs_gr<-lapply(cs_gr, function (x) sum (x[2:4, "CENSUS2010POP"]))
+     cs_gr<-cs_gr[order(unlist(cs_gr), decreasing = TRUE, na.last = TRUE)]
+     state_list <- names(cs_gr)[1:3]
+     state_list
+ }
> answer_six()
[1] "California" "Texas"      "Illinois"  
```

### Питання 7 - Який округ (county) має найбільшу абсолютну зміну в населенні протягом періоду 2010-2015?
```{R}
> answer_seven<-function() {
+     pop<-subset(census_df, COUNTY!=0, select=c(10:15))
+     max_pop<-apply(pop, 1, max)
+     min_pop<-apply(pop, 1, min)
+     chg<-(max_pop-min_pop)
+     name<-subset(census_df, COUNTY!=0, CTYNAME)
+     popl<-cbind(name, chg)
+     population<-popl$CTYNAME
+     population[which.max(chg)]
+ }
> answer_seven()
[1] "Harris County"
```

### Питання 8 -В census_df США поділені на 4 регіони (колонка "REGION"). Напишіть функцію, яка знаходить округи (county), що належать регіонам 1 або 2, назва яких починається з "Washington" та POPESTIMATE2015 більше ніж POPESTIMATE2014. Функція повинна повернути 5х2 дата фрейм з колонками "STNAME", "CTYNAME".

