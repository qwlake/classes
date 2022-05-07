library(ggplot2)

# Q1. ggplot2 패키지의 mpg 데이터를 사용할 수 있도록 불러온 뒤 복사본 생성 
mpg_cpy = mpg
mpg_cpy

# Q2. 복사본 데이터를 이용해서 cty는 city로, hwy는 highway로 변수명 수정
mpg_cpy = rename(mpg_cpy, city=cty, highway=hwy)

# Q3. 데이터 일부를 출력해서 변수명이 바뀌었는지 확인. 
# 아래와 같은 결과물이 출력되어야 함
mpg_cpy
