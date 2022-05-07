library(igraph)

g = graph_from_literal("현수"-"갑돌"-"철수",
                       "갑돌"-"나래"-"영희"-"갑돌",
                       "지윤"-"나래",
                       "나래"-"시원"-"영숙",
                       "영희"-"시원")
V(g)$label.cex = 2
V(g)$color = "green"
V(g)$size = 30
plot(g)
