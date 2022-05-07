# ggplot2 패키지에는 미국 중서부 437개 지역의 인구통계 정보를 담은 midwest라는 
# 데이터가 포함되어 있다. midwest 데이터를 사용해 데이터 분석 문제를 해결해 보자.

library(ggplot2)
library(dplyr)

# 문제1. ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악하기
mw = data.frame(midwest)
str(mw)
head(mw)
summary(mw)

# 문제2. poptotal(전체 인구)을 total로, popasian(아시아 인구)을 asian으로 변수명을 수정하기
mw = rename(mw, total=poptotal, asian=popasian)
str(mw)

# 문제3. total, asian 변수를 이용해 ＇전체 인구 대비 아시아 인구 백분율＇ 파생변수를 만들고, 
#       히스토그램을 만들어 도시들이 어떻게 분포하는지 살펴보기
mw$asianPercentage = mw$asian / mw$total * 100
hist(mw$asianPercentage)

# 문제4. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 
#       그 외에는 "small"을 부여하는 파생변수를 만들기.
head(mean(mw$asianPercentage))
mw$asianAmount = ifelse (
    mw$asianPercentage > mean(mw$asianPercentage),
    "large", "small"
)
mw %>% select(c("asian", "total", "asianPercentage", "asianAmount")) %>% head()

# 문제5. "large"와 "small"에 해당하는 지역이 얼마나 되는지, 
#       빈도표와 빈도 막대 그래프를 만들어 확인
table(mw$asianAmount)
qplot(mw$asianAmount)
