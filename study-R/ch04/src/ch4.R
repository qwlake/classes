c(1,2,3) + c(4,5,6)
c(1,2,3) + 1
a <- c(1,2,3)
b <- c(2,3,4)
union(a,b)
setdiff(a,b)
setdiff(b,a)
intersect(a,b)

c(1,2,3) + c(6,0,9,20,22)
2+3
x = c(1,2,4)
x + c(5,4,-1)
x %% c(5,4,-1)

str4 = c("a", "b", "c")
str5 = c("Hello", "world", "is", "good")

a
names(a) = c("apple", "orange", "banana")
a
a["orange"]
a[2]

x = c(88, NA, 12, 168, 13)
x
mean(x)
mean(x, na.rm=T)
x = c(88, NULL, 12, 168, 13)
mean(x)

x = c(6, 1:3, NA, 12)
x
x[x>5]
subset(x, x>5)

z = c(5, 2, -3, 8, 0, -1)
which(z<0)

x = matrix(c(1:6))
x
x2 = matrix(c(1:6), nrow=2)
x2
x3 = matrix(c(1:6), ncol=2)
x3
x4 = matrix(c(1:6), nrow=2, byrow=T)
x4
x4[1,]
x4[,1]
x4[1,1]

m1 = matrix(c(1:4), nrow=2)
m2 = matrix(c(11:14), nrow=2)
m1
m2
m1+m2
m1*3
m1 %*% m2

x = matrix(c(1:9), 3, by=T)
x
x = rbind(x, c(10:12))
x
y = matrix(c(1:6), 2, by=T)
y
y = cbind(y, c(33, 99))
y

kortest = matrix(c(46, 21, 50, 30, 25, 48), ncol=2)
engtest = matrix(c(46, 43, 41, 35, 50, 50), ncol=2)
kortest
engtest

tests = array(data=c(kortest, engtest), dim=c(3,2,2))
tests
tests[3,2,1]
tests[3,,1]
tests[,,1]

no = c(1,2,3,4)
name = c("apple", "banana", "peach", "berry")
price = c(500, 200, 200, 50)
qty = c(5, 2, 7, 9)
fruits = data.frame(NO=no, NAME=name, PRICE=price, QTY=qty)
fruits

df_midterm = data.frame(english=c(90, 80, 60, 70),
                        math=c(50, 60, 100, 20),
                        class=c(1, 1, 2, 2))
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)

fruits2 = read.table("data/fruits.txt", header=T, sep="")
fruits2

lname = c("NO", "NAME", "PRICE", "QTY")
fruits3 = read.csv("data/fruits_c.csv")
fruits3
fruits4 = read.csv("data/fruits_c.csv", header=T, col.names=lname)
fruits4

fruits
fruits$NO
fruits["PRICE"]
fruits[["PRICE"]]

str(fruits)
attributes(fruits)
dim(fruits)

summary(fruits)
head(fruits)
tail(fruits)
ncol(fruits)
nrow(fruits)
names(fruits)
colnames(fruits)
rownames(fruits)
row.names(fruits)

df = read.csv("data/example_studentlist.csv")
df

a = c(1:20)
s = c("파스타", "짬봉", "순두부 찌개", "요거트 아이스크림", "커피")
L = c(T, F, F, T, T, T)
ls = list(data.frame=df, number=a, string=s, logical=L, func=mean)
ls

ls[2]
ls["number"]
class(ls["number"])
class(fruits)
ls[[2]]
ls$number
class(ls[[2]])
temp = "number"
ls$temp

ls$string
ls[["string"]]
ls$string[3]
ls[["string"]][3]
ls["string"][3]

ls["func"] = NULL
ls$num2 = c(100:120)
ls
names(ls)[2] = "num1"
ls[2]

new_list = c(ls, list(title="big data"))
new_list
length(ls)
length(new_list)

new_list[1] = NULL
new_list2 = unlist(new_list)
new_list2
