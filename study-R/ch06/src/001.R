students = read.csv("data/students.csv", stringsAsFactors=F)
students
for (i in 2:4) {
  students[,i] = ifelse(students[,i] >= 0 & students[,i] <= 100, students[,i], NA)
}
students


sumToN = function(n) {
  s = 0
  for (i in 1:n)
    s = s + i
  return(s)
}
sumToN(10)

#####################################################################################
library(dplyr)


x = c(34,23,65)
y = c("a", "b", "c")

ls()
rm("y")

search()
sessionInfo()
.libPaths()

x = x(88, NA, 12, 168, 13)

attributes(students)
attr_list = attributes(students)
attr_list$names
attr_list$class
attr(students, "names")

gender = c("M", "F", "F", "M", "F", NA)
gender
class(gender)
mode(gender)
gender = as.factor(gender)
gender
class(gender)
mode(gender)

data(mtcars)
mtcars
mtcars_df = mtcars
head(mtcars_df)
str(mtcars_df)

mtcars_df$cyl = as.factor(mtcars_df$cyl)
mtcars_df$am = as.factor(mtcars_df$am)
str(mtcars_df)

mtcars_df
mtcars_df[1,1]
mtcars_df[1,2] =  8 
head(mtcars_df, 3)

mtcars_df$plus = mtcars$mpg*1000
head(mtcars_df)
mtcars_df$plus = NULL
head(mtcars_df)

mtcars_df[,c("mpg", "wt", "am", "cyl", "disp")]
mtcars_df[,-c("mpg", "wt")]
mtcars_df[,-c(3:5)]

mtcars_df[c(3:8),]
mtcars_df[mtcars_df$cyl==6,]
mtcars_df %>% filter(cyl==6)
mtcars_df[mtcars_df$cyl %in% c("4", "6"), c("mpg", "wt", "cyl")]
mtcars_df[mtcars_df$cyl == "4" | mtcars_df$cyl == "6", c("mpg", "wt", "cyl")]

split(mtcars_df, mtcars_df$cyl)

gender = c("f", "m", "m", "u", "f", "f")
gender
lookup = c("Male", "Female", NA)
names(lookup) = c("m", "f", NA)
lookup
str(lookup)
gender2 = lookup[gender]
gender2
names(gender2) = NULL
gender2

?mean

test = c(15, 20, 30, NA, 45)
test[test<40]
test[test%%3!=0]
test[is.na(test)]
test[!is.na(test)]
which(is.na(test))
test[test%%2==0 & !is.na(test)]
chr = data.frame(name=c("John", "Ann", "Steve"), age=c(30, 16, 21),
                 gender=factor(c("M", "F", "M")))
chr
chr[chr$gender=="F",]
chr[chr$age < 30 & chr$gender == "M"]

x = 5
if (x%%2 == 0) {
  print('x는 짝수')
} else {
  print('x는 홀수')
}

s = "here"
temp = "temp"
temp = ifelse(s == "here",
       "change",
       "Somewhere")
temp

students = read.csv("data/students.csv")
students
students[,2] = ifelse(students[,2] >= 0 & students[,2] <= 100, students[,2], NA)
students[,3] = ifelse(students[,3] >= 0 & students[,3] <= 100, students[,3], NA)
students[,4] = ifelse(students[,4] >= 0 & students[,4] <= 100, students[,4], NA)
students

students = read.csv("data/students.csv")
students
for (i in 2:4)
  students[,i] = ifelse(students[,i] >= 0 & students[,i] <= 100, students[,i], NA)
students

sumToN = function(n) {
  s = 0
  for (i in 1:n) {
    s = s + i
  }
  return(s)
}
sumToN(10)
sumToN(100)

sumAtoB = function(startNum=1, endNum=10) {
  s = 0
  for (i in startNum:endNum)
    s = s + i
  return(s)
}
sumAtoB()
sumAtoB(2,11)

boxcox = function(x, lambda = 1) {
  if (length(lambda) != 1)
    stop("the length of lembda must be 1")
  #stopifnot(length(lambda) == 1)
  if (lambda != 0)
    return((x^lambda -1)/lambda)
  else
    log(x)
}
boxcox(c(1,3,2), 2)

fact = function(x) {
  ret = 1
  for (i in 1:x) {
    ret = ret*i
  }
  return(ret)
}
fact(5)
