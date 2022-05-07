library(wordcloud)
library(RColorBrewer)
library(KoNLP)
useNIADic()

# 1. 연설문 분석 후 워드 클라우드 생성하기
# noh.txt
noh <- readLines("data/noh.txt")
nouns <- extractNoun(noh)
c <- unlist(nouns)

wd <- Filter(function(x) {nchar(x)>=2},c)
wd_cnt <- table(wd)
head(sort(wd_cnt,decreasing=T),20)

nrow(wd_cnt)
pal <- brewer.pal(8, "Paired")
wordcloud(words=names(wd_cnt),
          freq=wd_cnt,
          min.freq=2,
          random.color=T,
          random.order=F,
          rot.per=.50,
          scale=c(8,1),
          colors=pal)


# 2. 공동구매 요청 테이블을 분석해서 가장 인기 있는 아이템 찾기
# order.txt
order <- readLines("data/order.txt")
nouns <- extractNoun(order)
c <- unlist(nouns)

wd <- Filter(function(x) {nchar(x)>=2},c)
wd <- gsub("[[:digit:]]","", wd)
wd <- gsub("[[:punct:]]", "", wd)
wd <- gsub("[A-Za-z]", "", wd)
wd <- gsub("퍼스나콘아이디", "", wd)
wd <- gsub("영역", "", wd)
wd <- gsub("공구", "", wd)
wd <- gsub("해주", "", wd)
wd <- Filter(function(x) {nchar(x)>=2},wd)
wd_cnt <- table(wd)
head(sort(wd_cnt,decreasing=T),20)

nrow(wd_cnt)
pal <- brewer.pal(7, "Set1")
wordcloud(words=names(wd_cnt),
          freq=wd_cnt,
          min.freq=2,
          random.order=F,
          rot.per=.25,
          scale=c(3,1),
          colors=pal)


# 3. 고객 불만 게시판 분석해서 불만 요인 파악하기
# comp.txt
noh <- readLines("data/comp.txt")
nouns <- extractNoun(noh)
c <- unlist(nouns)

wd <- Filter(function(x) {nchar(x)>=2},c)
wd <- gsub("[[:punct:]]", "", wd)
wd <- gsub("\\d+", "", wd) 
wd <- gsub("\\s+", "", wd)
wd <- gsub("[A-Za-z]", "", wd)
# wd <- gsub("l", "", wd)
# wd <- gsub("I", "", wd)
wd <- gsub("퍼스나콘아이디", "", wd)
wd <- gsub("영역", "", wd)
wd <- Filter(function(x) {nchar(x)>=2},wd)
wd_cnt <- table(wd)
head(sort(wd_cnt,decreasing=T),20)

nrow(wd_cnt)
pal <- brewer.pal(8, "Paired")
wordcloud(words=names(wd_cnt),
          freq=wd_cnt,
          min.freq=2,
          random.order=F,
          rot.per=.50,
          scale=c(3,1),
          colors=pal)

# 4. 데이터베이스 관련 인터넷 카페의 질문사항 분석하기
# prodba.txt
prodba <- readLines("data/prodba.txt")
nouns <- extractNoun(prodba)
c <- unlist(nouns)

wd <- Filter(function(x) {nchar(x)>=2},c)
wd <- gsub("[[:digit:]]","", wd)
wd <- gsub("[[:punct:]]", "", wd)
wd <- gsub("[[:cntrl:]]", "", wd)
wd <- gsub("퍼스나콘아이디", "", wd)
wd <- gsub("영역", "", wd)
wd <- gsub("답변", "", wd)
wd <- gsub("질문", "", wd)
wd <- gsub("관련", "", wd)
wd <- gsub("드립", "", wd)
wd <- Filter(function(x) {nchar(x)>=2},wd)
wd_cnt <- table(wd)
head(sort(wd_cnt,decreasing=T),20)

nrow(wd_cnt)
pal <- brewer.pal(5, "Dark2")
wordcloud(words=names(wd_cnt),
          freq=wd_cnt,
          min.freq=2,
          random.order=F,
          rot.per=.25,
          scale=c(3,1),
          colors=pal)


# 5. 서울시 홈페이지에서 시민참여 게시판 분석하기
# seoul.txt
seoul <- readLines("data/seoul.txt")
nouns <- extractNoun(seoul)
c <- unlist(nouns)

wd <- Filter(function(x) {nchar(x)>=2},c)
wd <- gsub("[[:digit:]]","", wd)
wd <- gsub("[[:punct:]]", "", wd)
wd <- gsub("[[:cntrl:]]", "", wd)
wd <- gsub("[A-Za-z]", "", wd)
wd <- gsub("제목","", wd)
wd <- gsub("제안자","", wd)
wd <- gsub("조회","", wd)
wd <- gsub("등록일","", wd)
wd <- Filter(function(x) {nchar(x)>=2},wd)
wd_cnt <- table(wd)
head(sort(wd_cnt,decreasing=T),20)

nrow(wd_cnt)
pal <- brewer.pal(7, "Accent")
wordcloud(words=names(wd_cnt),
          freq=wd_cnt,
          min.freq=2,
          random.order=F,
          rot.per=.25,
          scale=c(3,1),
          colors=pal)
