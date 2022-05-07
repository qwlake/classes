std_txt = read.table("data/students.txt", header=T)
std_txt
str(std_txt)

std_csv = read.csv("data/students.csv")
(std_csv)
(str(std_csv))

write.table(std_txt, file="data/std_txt.txt")
write.table(std_txt, file="data/std_txt1.txt", quot=F) # 따옴표 없이 파일 출력

write.csv(std_csv, file="data/std_csv.csv", quote=F)

str(airquality)
table(is.na(airquality))
table(is.na(airquality$Temp))
table(is.na(airquality$Ozone))
mean(airquality$Temp)
mean(airquality$Ozone)
air_narm = airquality[!is.na(airquality$Ozone), ]
table(is.na(air_narm$Ozone))
mean(air_narm$Ozone)

table(is.na(airquality))
air_narm1 = na.omit(airquality)
table(is.na(air_narm1))
mean(air_narm1$Ozone)
mean(airquality$Ozone, na.rm=T)

patients = data.frame(name=c("p1", "p2", "p3", "p4", "p5"),
                      age=c(22,20,25,30,27),
                      gender=c("M", "F", "M", "K", "F"),
                      bloodtype=c("A", "O", "B", "AB", "C"))
str(patients)
patients$name = as.character(patients$name)
str(patients)

patients$gender = ifelse(patients$gender %in% c("M", "F"), patients$gender, NA)
patients$bloodtype = ifelse(patients$bloodtype %in% c("A", "B", "AB", "O"), patients$bloodtype, NA)
patients

boxplot(airquality$Ozone)$stats

air = ifelse(airquality$Ozone > 122, NA, airquality$Ozone)
boxplot(air)
boxplot(air)$stats

library(dplyr)
df_raw = data.frame(var1 = c(1, 2, 1),
                    var2 = c(2, 3, 2))
df_raw
df_new = df_raw
df_new

df_new = rename(df_new, v2=var2)
df_new
