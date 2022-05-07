library(ggplot2)
library(dplyr)
head(mpg)
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)

# Q1. mpg 데이터에는 연료 종류를 나타낸 fl 변수는 있지만 연료 가격을 나타낸 변수는 없다. 
# 위에서 만든 fuel 데이터를 이용해서 mpg 데이터에 price_fl(연료 가격) 변수를 추가.
mpg = left_join(mpg, fuel, by="fl") # mpg에 연료 가격 변수 추가

# Q2. 연료 가격 변수가 잘 추가됐는지 확인하기 위해서 model, fl, price_fl 변수를 추출해 앞부분 5행을 출력.
mpg %>% 
  select(model, fl, price_fl) %>%   # model, fl, price_fl 추출
  head(5)