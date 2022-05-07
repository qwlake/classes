library(KoNLP)
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jdk-13/bin/")
useNIADic()

hiphop = readLines("data/hiphop.txt")
head(hiphop)

nouns = extractNoun(hiphop)

# 추출한 명사 list를 문자열 벡터로 변환, 2글자 이상 단어만 추출
c = unlist(nouns)
wd = Filter(function(x) {nchar(x) >= 2}, c)

# 빈도표 생성, 확인
wd_cnt = table(wd)
wd_cnt
nrow(wd_cnt)

library(wordcloud)
library(RColorBrewer)

pal = brewer.pal(8, "Dark2") # Dark2 색상 목록에서 8개 색상 추출

# 워드 클라우드 생성
wordcloud(words=names(wd_cnt), # 단어
          freq=wd_cnt,         # 빈도
          min.freq=3,          # 최조 빈도
          random.order=F,      # 고빈도 단어 중앙 배치(True는 랜덤)
          rot.per=.25,         # 90도 회전된 각도록 출력되는 단어 비율
          scale=c(4,.3),       # 단어 크기 범위
          colors=pal)          # 컬러 팔레트
