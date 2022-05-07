library(ggplot2)
library(dplyr)

mpg_cpy = mpg
mpg_cpy = rename(mpg_cpy, city=cty, highway=hwy)

mpg_cpy$total = (mpg_cpy$city + mpg_cpy$highway)/2
head(mpg_cpy)
mean(mpg_cpy$total)

summary(mpg_cpy$total)
hist(mpg_cpy$total)

mpg_cpy$test = ifelse(mpg_cpy$total >= 20, "pass", "fail")
head(mpg_cpy, 20)
table(mpg_cpy$test)

qplot(mpg_cpy$test)

mpg_cpy$grade = ifelse(mpg_cpy$total >= 30, "A",
                       ifelse(mpg_cpy$total >= 20, "B", "C"))
head(mpg_cpy, 20)

table(mpg_cpy$grade)
qplot(mpg_cpy$grade)

mpg_cpy$grade = ifelse(mpg_cpy$total >= 30, "A",
                       ifelse(mpg_cpy$total >= 25, "B",
                              ifelse(mpg_cpy$total >= 20, "C", "D")))
head(mpg_cpy, 20)

library(dplyr)
exam = read.csv("data/csv_exam.csv")
exam %>% filter(class == 1)

exam %>% filter(math > 50)
exam %>% filter(english <= 80)
exam %>% filter(class==1 & math >= 50)
exam %>% filter(math >= 90 | english >= 90)

exam %>% filter(class==1 | class==3 | class==5)
exam %>% filter(class %in% c(1, 3, 5))

class1 = exam %>% filter(class==1)
class2 = exam %>% filter(class==2)
mean(class1$math)
mean(class2$math)

exam %>% select(math)
exam %>% select(class, math, english)
exam %>% select(-math)
exam %>% select(-math, -english)

exam %>% filter(class==1) %>% select(english)
exam %>% 
  select(id, math) %>% 
  head
exam %>% 
  select(id, math) %>% 
  head(10)
