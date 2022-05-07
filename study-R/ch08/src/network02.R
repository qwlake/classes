library(igraph)

supervisor = read.table("data/supervisor.txt", sep="\t", header=T)
g = graph.data.frame(supervisor, directed=F)
summary(g)
plot(g)

# 지도 편수에 따라 정점의 크기를 다르게 하고, 3 미만 차수인 노드는 제거
V(g)$size = degree(g)/3
g1 = delete.vertices(g,V(g)[degree(g)<3])
plot(g1)

head(sort(closeness(g1), decreasing=T))   # 근접중심성 확인
head(sort(betweenness(g1), decreasing=T)) # 매개중심성 확인

# 논문의 등급이 8등급 이상이면 빨간색, 미만이면 회색
E(g1)$color = ifelse(E(g1)$Grade>=8, "red", "gray")
# 논문의 특성에 따라 엣지 색상을 다르게 표현
E(g1)$color = ifelse(E(g1)$Spec=='X', "red",
                     ifelse(E(g1)$Spec=='Y', "blue", "grey"))
plot(g1)

g = simplify(g) # 차수를 제거하고 관계의 유무만 표현
plot(g)

head(sort(degree(g), decreasing=T))
head(sort(closeness(g), decreasing=T))
head(sort(betweenness(g), decreasing=T))
