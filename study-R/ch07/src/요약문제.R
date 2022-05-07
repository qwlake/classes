library(ggplot2)
library(dplyr)

head(mpg)

mpg %>%
  group_by(manufacturer) %>%               # 회사별로 분리
  filter(class=="suv") %>%                 # suv 추출
  mutate(total = (cty + hwy)/2) %>%        # 통합 연비 변수 생성
  summarise(mean_total = mean(total)) %>%  # 통합 연비 평균 산출
  arrange(desc(mean_total)) %>%            # 내림차순 정렬
  head(5)                                  # 1~5위까지 출력
