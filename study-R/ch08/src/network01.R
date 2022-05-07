library(igraph)

g1 = graph.formula(A-B-C, B-D, E-F-G, H, I)
g2 = graph.formula(A+-B+-C, B+-D, E+F+-+G, H, I)
g3 = graph_from_literal("this is" +- "a silly" -+ "graph here")
plot(g1)
plot(g2)
plot(g3)

adjmatrix = matrix(c(0,1,1,0,0,0,0,1,0,0,0,1,0,0,0,0), byrow=T, nrow=4)
g = graph.adjacency(adjmatrix)
V(g)$name = c("M1", "M2", "M3", "M4")
plot(g)

V(g) # 정점들의 목록 확인
E(g) # 엣지들의 목록을 확인할 때 사용

# 그래프의 정점 모양 설정
V(g)$label.cex = 2
V(g)$label.color = "green"
V(g)$size = 30
V(g)$color = "red"
plot(g)

# 그래프의 엣지 설정
E(g)$width = 4
E(g)$color = "blue"

# 한꺼번에 설정
plot(g, vertex.label.cex=2, vertex.label.color="green", vertex.size=30,
     vertex.color="red", edge.width=4, edge.color="blue")

a.matrix = matrix(
  c(0,1,0,0,0,0,
    0,0,2,0,0,0,
    0,0,0,0,3,0,
    0,2,0,0,0,0,
    0,0,0,3,0,1,
    0,0,0,0,0,0), byrow=T, nrow=6)
g = graph.adjacency(a.matrix, mode="directed", weight=T)
V(g)$name = c("A", "B", "C", "D", "E", "F")
V(g)$label.cex = 2
V(g)$size = 30
V(g)$color = "cyan"
E(g)$label.cex = 2
E(g)$width = E(g)$weight
E(g)$label = E(g)$weight
plot(g)

g = graph.formula(A-B-D, C-D-F, E-D-F, E-F)
V(g)$size=20
V(g)$label.cex=2
plot(g)

degree(g)         # 노드의 차수
graph.density(g)  # 그래프의 밀도
shortest.paths(g) # 노드간 최단 경로
closeness(g)      # 노드 i의 근접 중심성
betweenness(g)    # 매개중심성

