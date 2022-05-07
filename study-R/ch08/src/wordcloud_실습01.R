propose <- readLines("data/propose.txt")
library(KoNLP)
library(wordcloud)
library(RColorBrewer)

# 명사 추출 및 빈도표 생성
nouns = extractNoun(propose)
c = unlist(nouns)
wd = Filter(function(x) {nchar(x) >= 2}, c)
wd_cnt = table(wd)
nrow(wd_cnt)

# 상위 20개 단어 확인
head(sort(wd_cnt, decreasing=T), 20)

# 단어 정제
wd = gsub("프로포즈","", wd)
wd = gsub("선물","", wd)
wd = gsub("하시","", wd)
wd = gsub("해서","", wd)
wd = gsub("가능","", wd)
wd = gsub("경우","", wd)
wd = Filter(function(x) {nchar(x) >= 2}, wd)
wd_cnt = table(wd)

# 글자색을 설정 후 워드 클라우드 생성
pal = brewer.pal(5, "Set1")
wordcloud(words=names(wd_cnt),
          freq=wd_cnt,
          min.freq=2,
          random.color=T,
          random.order=F,
          rot.per=.25,
          scale=c(7,1),
          colors=pal)
