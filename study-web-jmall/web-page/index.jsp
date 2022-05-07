<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>J mall</title>
    <style></style>
    <link rel="stylesheet" type="text/css" href="CSS/normal_style.css">
    <script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
    <script type="text/javascript" src="js/index.js"></script>
</head>

<body>
    <nav>
        <ul>
        <% if (session.getAttribute("islogin") == "yes") { %>
			<li><a href="board/logout.jsp">로그아웃</a></li>
			<li><a href="board/mypage.jsp" target="iframe1">마이페이지</a></li>
			<li><a href="board/basket.jsp" target="iframe1">장바구니</a></li>
		<% } else { %>
            <li><a href="board/login.html" target="iframe1">로그인</a></li>
            <li><a href="board/join.jsp" target="iframe1">회원가입</a></li>
        <% } %>
        </ul>
    </nav>
    <header>
        <a href="index.jsp"><img id="main_logo" src="img/main/로고/메인_로고.png">
        </a>
        <div id="main_search">
        	<form name="search_form" method="get" action="board/product/searchResult.jsp" target="iframe1" onsubmit="return keyword_check()">
                <input id="keyword" type="search" name="keyword" placeholder="검색어 입력">
                <button id="search_button" type="submit">검색</button>
            </form>
        </div>
    </header>
    <section id="main">
        <iframe name="iframe1" src="board/main.html"></iframe>
    </section>
    <aside id="right">
        <div class="side_menu">
            <h4>카테고리</h4>
            <ul>
                <li><a target="iframe1" href="board/info.html">소개</a></li>
                <li><a target="iframe1" href="board/product/mtb.jsp">MTB</a></li>
                <li><a target="iframe1" href="board/product/road.jsp">로드</a></li>
                <li><a target="iframe1" href="board/product/hybrid.jsp">하이브리드</a></li>
                <li><a target="iframe1" href="board/product/fixie.jsp">픽시</a></li>
                <li><a target="iframe1" href="board/product/mini.jsp">미니벨로</a></li>
            </ul>
        </div>
        <br/>
        <div class="side_menu">
            <h4>자전거 대회.행사</h4>
            <a href="http://www.thebike.co.kr/race/" target="_blank"><img class="side_img" src="img/main/로고/더바이크.png"></a>
            <a href="http://www.dmzmtb.com/" target="_blank"><img class="side_img" src="img/main/로고/평화자전거.png"></a>
            <a href="http://cycling.or.kr/about/plan/" target="_blank"><img class="side_img" src="img/main/로고/대한자전거연맹.png"></a>
            <a href="http://mct.cycling.or.kr/" target="_blank"><img class="side_img" src="img/main/로고/마스터즈사이클투어.png"></a>
        </div>
        <div class="side_video">
            <video class="side_video_1" src="img/main/자전거_주행.mp4" width="220" autoplay loop>Your browser does not support the html5 video.</video>
        </div>
    </aside>
    <footer>고객센터 : 퇴계관 203호<br/>Copyright (c) 2018 J mall</footer>
    <br/>
</body>
</html>
