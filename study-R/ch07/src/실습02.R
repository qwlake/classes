library(dplyr)
library(ggplot2)

# Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 한다. 
# displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 
# 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보자
mpg = as.data.frame(mpg) # mpg 데이터 불러오기

mpg_a = mpg %>% filter(displ<=4) # displ 4 이하 추출
mpg_b = mpg %>% filter(displ>=5) # displ 5 이상 추출

mean(mpg_a$hwy)
mean(mpg_b$hwy)

# Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 한다. 
# "audi"와 "toyota" 중 어느 manufacturer(자동차 제조 회사)의
# cty(도시 연비)가 평균적으로 더 높은지 알아보자
mpg_audi = mpg %>% filter(manufacturer == "audi")     # audi의 cty 평균
mpg_toyota = mpg %>% filter(manufacturer == "toyota") # toyota의 cty 평균

mean(mpg_audi$cty)
mean(mpg_toyota$cty)

# Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 한다. 
# 이 회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보자.
# manufacturer가 chevrolet, ford, honda에 해당하면 추출
mpg_new = mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_new$hwy)