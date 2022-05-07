library(ggplot2)

# Q1. mpg 데이터는 11개 변수로 구성되어 있다. 
# 이 중 일부만 추출해서 분석에 활용하려고 한다. 
# mpg 데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만들자.
# 새로 만든 데이터의 일부를 출력해서 두 변수로만 구성되어 있는지 확인.
mpg = as.data.frame(mpg)

temp = mpg %>% select(class, cty) # class, cty 변수만 추출
head(temp)

# Q2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 한다. 
# 앞에서 추출한 데이터를 이용해서 class(자동차 종류)가 "suv"인 자동차와 
# "compact"인 자동차 중 어떤 자동차의 cty(도시 연비)가 더 높은지 알아보자.
s = temp %>% filter(class=="suv")     # class가 suv인 행 추출
c = temp %>% filter(class=="compact") # class가 compact인 행 추출

mean(s$cty) # suv의 cty 평균
mean(c$cty) # compact의 cty 평균