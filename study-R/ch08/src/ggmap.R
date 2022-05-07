library(ggmap)

key = readline(prompt="google api key: ")
register_google(key=key)
map = get_map(location=c(lon=128.25, lat=35.95), zoom=7) # 지도 정보 가져오기
ggmap(map)
