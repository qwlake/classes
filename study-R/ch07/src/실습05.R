library(ggplot2)
library(dplyr)

# mpg 데이터는 연비를 나타내는 변수가 hwy(고속도로 연비), 
# cty(도시 연비) 두 종류로 분리되어 있다. 
# 두 변수를 각각 활용하는 대신 하나의 통합 연비 변수를 만들어 분석하려고 한다.

# Q1. mpg 데이터 복사본을 만들고, cty와 hwy를 더한 '합산 연비 변수'를 추가.
# Q2. 앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수'를 추가.
# Q3. '평균 연비 변수'가 가장 높은 자동차 3종의 데이터를 출력.
# Q4. 1~3번 문제를 해결할 수 있는 하나로 연결된 dplyr 구문을 만들어 출력. 데이터는 복사본 대신 mpg 원본을 이용.
head(mpg)

mpg %>%
  mutate(total = cty + hwy) %>% 
  mutate(mean = total / 2) %>% 
  arrange(desc(mean)) %>% 
  head(3)
