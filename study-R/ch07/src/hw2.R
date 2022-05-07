# 미국 동북중부 437개 지역의 인구통계 정보를 담고 있는 midwest 데이터를 사용해 데이터 분석 문제를 해결해 보자. 
# midwest는 ggplot2 패키지에 포함되어 있음.

library(ggplot2)
library(dplyr)

mw = data.frame(midwest)
str(mw)

# Q1. popadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타낸다.
# midwest 데이터에 ‘전체 인구 대비 미성년 인구 백분율’ 변수를 추가
mw = mutate(mw, percYoung = (poptotal-popadults)/poptotal*100)
mw %>% 
  select(poptotal, popadults, percYoung) %>% 
  head(10)

# Q2. 미성년 인구 백분율이 가장 높은 상위 5개 county(지역)의 미성년 인구 백분율을 출력.
mw %>% 
  group_by(county) %>% 
  arrange(desc(percYoung)) %>% 
  select(county, percYoung) %>% 
  head(5)

# Q3. 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 
# 각 등급에 몇 개의 지역이 있는지 알아보자
mw = mw %>% 
  mutate(gradeYoung = ifelse(percYoung >= 40, "large",
                ifelse(percYoung >=30, "middle","small")))
mw %>% 
  group_by(gradeYoung) %>% 
  summarise(n=n())

# Q4. popasian은 해당 지역의 아시아인 인구를 나타낸다. 
# '전체 인구 대비 아시아인 인구 백분율' 변수를 추가하고, 
# 하위 10개 지역의 state(주), county(지역명), 아시아인 인구 백분율을 출력.
mw = mw %>% 
  mutate(percAsian = popasian/poptotal*100)
mw %>% 
  select(state, county, percAsian) %>% 
  arrange(percAsian) %>% 
  head(10)
