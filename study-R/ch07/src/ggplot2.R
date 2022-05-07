library(ggplot2)

g1 = ggplot(data=mpg, aes(x=displ, y=hwy))
g1 + geom_point() + geom_line()
g_ptype = geom_point(color="red", size=4)
g_ltype = geom_line(color="blue", size=1)
g1 + g_ptype + g_ltype

g2 = ggplot(data=mpg, aes(x=displ, y=hwy)) + xlim(3,6) + ylim(10, 30) +
  xlab("displacement") + ylab("highway")
g_titile = ggtitle("displacement vs. highway plot", subtitle="from ggplot2::mpg")
g2 + g_ptype + g_titile


d1 = pressure
ggplot(d1, aes(x=temperature, y=pressure)) +
  geom_line(color="blue", size=1) +
  geom_point(color="red", size=2) +
  ggtitle("theme_bw") +
  xlab("온도") + ylab("압력") +
  theme_bw() +
  theme(plot.title=element_text(size=20, color="blue"))

ggplot(d1, aes(x=temperature, y=pressure)) +
  geom_line(color="blue", size=1) +
  geom_point(color="red", size=2) +
  ggtitle("theme_bw") +
  xlab("온도") + ylab("압력") +
  theme_dark() +
  theme(plot.title=element_text(size=20, color="blue"))

ggplot(d1, aes(x=temperature, y=pressure)) +
  geom_line(color="blue", size=1) +
  geom_point(color="red", size=2) +
  ggtitle("pressure vs. temperature") +
  xlab("온도") + ylab("압력") +
  theme_bw() +
  theme(plot.title=element_text(size=20, color="violetred"),
        axis.title=element_text(size=10),
        axis.title.x=element_text(size=15,face="bold"),
        axis.title.y=element_text(size=15, angle=0, face="italic"))

ggplot(Orange, aes(x=age, y=circumference, color=Tree)) +
  geom_line() + ggtitle("color=Tree") +
  theme(plot.title=element_text(size=20, color="blue"))

ggplot(Orange, aes(x=age, y=circumference)) +
  geom_line(aes(color=Tree)) +
  ggtitle("geom_line(aes(color=Tree))") +
  theme(plot.title=element_text(size=20, color="blue"))

ggplot(Orange, aes(x=age, y=circumference, color=Tree)) +
  geom_line() + ggtitle("color=Tree") +
  theme(legend.position="none")

ggplot(Orange, aes(x=age, y=circumference)) +
  geom_line(aes(color=Tree), size=1) +
  geom_point(aes(shape=Tree),size=3) +
  ggtitle("두 종류의 범례(점 + 선)") +
  theme(plot.title=element_text(size=20, color="blue"))

ggplot(Orange, aes(x=age, y=circumference)) +
  geom_line(aes(color=Tree), size=1) +
  geom_point(aes(shape=Tree),size=3) +
  ggtitle("두 종류의 범례 중 shape 삭제") +
  theme(plot.title=element_text(size=20, color="blue")) +
  guides(shape=FALSE)

ggplot(Orange, aes(x=age, y=circumference)) +
  geom_line(aes(color=Tree), size=1) +
  geom_point(aes(shape=Tree),size=3) +
  ggtitle("두 종류의 범례 중 color 삭제") +
  theme(plot.title=element_text(size=20, color="blue")) +
  scale_color_discrete(guide=FALSE)

ggplot(Orange, aes(x=age, y=circumference)) +
  geom_line(aes(color=Tree), size=1) +
  ggtitle("범례 타이틀 삭제_theme 이용") +
  theme(plot.title=element_text(size=20, color="blue"),
        legend.title=element_blank())

ggplot(Orange, aes(x=age, y=circumference)) +
  geom_line(aes(color=Tree), size=1) +
  ggtitle("범례 타이틀 삭제_guides 이용") +
  theme(plot.title=element_text(size=20, color="blue")) +
  guides(color=guide_legend(title=NULL))

ggplot(Orange, aes(x=age, y=circumference)) +
  geom_line(aes(color=Tree), size=1) +
  ggtitle("범례 타이틀 설정_theme 이용") +
  theme(plot.title=element_text(size=20, color="blue"),
        legend.title=element_text(size=20,
                                  face="bold", color="red")) +
  scale_color_discrete(name="나무종류")

ggplot(Orange, aes(x=age, y=circumference)) +
  geom_line(aes(color=Tree), size=1) +
  ggtitle("범례 타이틀 설정_guides 이용") +
  theme(plot.title=element_text(size=20, color="blue")) +
  scale_color_discrete(name="나무종류") +
  guides(color=guide_legend(title.theme=element_text(
    size=10, face="bold",color="red", angle=0)))

label <- paste0("Tree", 1:5)
ggplot(Orange, aes(x=age, y=circumference)) +
  geom_line(aes(color=Tree), size=1) +
  ggtitle("범례 위치 설정") +
  theme(plot.title=element_text(size=20, color="blue")) +
  scale_color_discrete(name="나무종류",
                       breaks=c(1,2,3,4,5),
                       labels=label) +
  guides(color=guide_legend(title.position="left",
                            label.position="bottom"))

label <- paste0("Tree", 1:5)
ggplot(Orange, aes(x=age, y=circumference)) +
  geom_line(aes(color=Tree), size=1) +
  ggtitle("범례 배경, 테두리 지정") +
  theme(legend.background = element_rect(fill="gainsboro",
                                         color="black")) +
  scale_color_discrete(name="나무종류",
                       breaks=c(1,2,3,4,5),
                       labels=label)
label <- paste0("Tree", 1:5)
ggplot(Orange, aes(x=age, y=circumference)) +
  geom_line(aes(color=Tree), size=1) +
  theme(legend.background = element_rect(fill="gainsboro",
                                         color="black"),
        legend.position="top") +
  scale_color_discrete(name="나무종류",
                       breaks=c(1,2,3,4,5),
                       labels=label)
