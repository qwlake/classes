<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<style></style>
<link rel="stylesheet" type="text/css" href="../CSS/product_style.css">
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body class="member_page" id="mypage">
<%
String name = "";
String uname = (String) session.getAttribute("uname");
String email = "";
String phone = "";
String address = "";
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jmall",
	        "root", "1234");
	Statement st = conn.createStatement();
	ResultSet rs;
	rs = st.executeQuery("select * from members where uname='" + uname + "'");
	while (rs.next()) {
		name = rs.getString("name");
		email = rs.getString("email");
		phone = rs.getString("phone");
		address = rs.getString("address");
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>
    <content class="member_page_wrapper" id="mypage_wrapper">
    <h2>마이페이지</h2>
    <form action="changepass.jsp" method="post">
        <fieldset>
        <legend>회원정보</legend>
        	<table class="member_page_table" id="mypage_table" border="1">
                <tr>
                    <th class="th">이름</th>
                    <td class="td"><%= name %></td>
                </tr>
                <tr>
                    <th class="th">ID</th>
                    <td class="td"><%= uname %></td>
                </tr>
                <tr>
                    <th class="th">비밀번호<span class="red_span">※</span></th>
                    <td class="td"><input class="normal_input" id="pass" type="password" name="pass" onchange="javascript:confirmPass()" required></td>
                </tr>
                <tr>
                    <th class="th">비밀번호확인<span class="red_span">※</span></th>
                    <td class="td"><input class="normal_input" id="passCheck" type="password" name="passCheck" onchange="javascript:confirmPass()" required><br/>
                    <span id="same">비밀번호 변경</span></td>
                </tr>
                <tr>
                    <th class="th">이메일</th>
                    <td class="td"><%= email %></td>
                </tr>
                <tr>
                    <th class="th">전화</th>
                    <td class="td"><%= phone %></td>
                </tr>
                <tr>
                    <th class="th">주소</th>
                    <td class="td"><%= address %></td>
                </tr>
            </table>
            <input id="reset" type="reset" value="입력 초기화">
            <input id="regdone" type="submit" value="수정하기">
        </fieldset>
    </form>
    </content>
</body>
</html>