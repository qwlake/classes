library(ggplot2)
library(dplyr)

# Q1. mpg 데이터의 class는 "suv", "compact" 등 자동차를 특징에 따라 일곱 종류로 분류한 변수이다. 
# 어떤 차종의 연비가 높은지 비교해보려고 한다. 
# class별 cty 평균을 구하시오.
# Q2. 앞 문제의 출력 결과는 class 값 알파벳 순으로 정렬되어 있다. 
# 어떤 차종의 도시 연비가 높은지 쉽게 알아볼 수 있도록 cty 평균이 높은 순으로 정렬해 출력.
mpg %>%
  group_by(class) %>% 
  summarise(cty_mean = mean(cty)) %>% 
  arrange(desc(cty_mean))

# Q3. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려고 한다. 
# hwy 평균이 가장 높은 회사 세 곳을 출력.
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(hwy_mean = mean(hwy)) %>% 
  arrange(desc(hwy_mean)) %>% 
  head(3)

# Q4. 어떤 회사에서 "compact"(경차) 차종을 가장 많이 생산하는지 알아보려고 한다. 
# 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력.
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "compact") %>% 
  summarise(compact_n=n()) %>% 
  arrange(desc(compact_n))