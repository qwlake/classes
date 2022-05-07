library(ggplot2)

# "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지 알아보려고 한다. 
# "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의 데이터를 출력하시오.

mpg = as.data.frame(mpg)
head(mpg)

mpg %>%
  filter(manufacturer=="audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)