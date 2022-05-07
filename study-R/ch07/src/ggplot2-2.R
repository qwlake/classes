library(dplyr)
library(ggplot2)

df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))
df_mpg

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()

# x축 범주 변수, y축 빈도
ggplot(data = mpg, aes(x = drv)) + geom_bar()

# x축 연속 변수, y축 빈도
ggplot(data = mpg, aes(x = hwy)) + geom_bar()

ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()


df = read.csv("data/example_studentlist.csv")
df

g1 = ggplot(df, aes(x=height, y=weight, color=bloodtype))
g1 + geom_line() + geom_point()
g1 + geom_line(size=1) + geom_point(size=10)
g1 + geom_line(aes(color=sex), size=1) + geom_point(size=10)
g1 + geom_point(size=5) + geom_line(size=1) + facet_grid(.~sex)
g1 + geom_point(size=5) + geom_line(size=1) + facet_grid(sex~.)
g1 + geom_point(size=5) + geom_line(size=1) + facet_grid(sex~.,scales="free")
g1 + geom_point(size=5) + geom_line(size=1) + facet_grid(.~sex,scales="free")

g = ggplot(df, aes(x=bloodtype, fill=sex))
g + geom_bar()
g + geom_bar(position = "dodge")
g + geom_bar(position = "identity")
g + geom_bar(position = "fill")

g = ggplot(diamonds, aes(x=carat))
g + geom_histogram(binwidth=0.1, fill="orange")
g + 
  geom_histogram(binwidth=0.1, fill="orange") +
  facet_grid(color~.,scales="free")
g + 
  geom_histogram(aes(fill=color), binwidth=0.1, alpha=0.5)

g = ggplot(df, aes(x=weight, y=height))
g + geom_point(aes(color=sex, shape=bloodtype), size=4)
g + geom_point(aes(color=sex), size=4) + 
  geom_text(aes(label=name))
g + geom_point(aes(color=sex), size=4) +
  geom_text(aes(label=name),
            vjust=-1.1, color="grey35")


library(ggthemes)
ggplot(data=mpg,aes(x=hwy,y=cty)) +
  geom_point() +
  theme_wsj()

g1 <- ggplot(data = df_mpg, aes(x = drv, y = mean_hwy))
g2 <- geom_col()
g3 <- theme_wsj()
g1+g2+g3

g1+g2+theme_bw()

g1 <- ggplot(diamonds, aes(x=carat,y=price,colour=clarity))
g2 <- geom_point()
g3 <- theme_wsj()
g1+g2+g3
