<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
<style></style>
<link rel="stylesheet" type="text/css"
	href="../../CSS/product_style.css">
<script type="text/javascript" src="../js/index.js"></script>
</head>
<body>
	<%
		String basket = "basket";
		String uname = (String) session.getAttribute("uname");
		String idproduct = request.getParameter("idproduct");
		int count = 1;
		String sql = "";
		boolean result = false;
		if (session.getAttribute("islogin") == "yes") {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jmall", "root", "1234");
				Statement st = conn.createStatement();

				sql = "insert into basket " + "(uname, idproduct, count, putdate) " + "values ('" + uname + "', '"
						+ idproduct + "', '" + count + "', CURDATE())";
				st.executeUpdate(sql);
	%>
	<center>
		<br /> <br />
		<h4>장바구니에 추가되었습니다.</h4>
		<input type="button" value="계속 쇼핑" onclick="javascript:popupClose()">
		<input type="button" value="장바구니로 이동"
			onclick="javascript:popupClose('basket.jsp')">
	</center>
	<%
			} catch (Exception e) {
				out.println(e.getMessage());
				e.printStackTrace();
			}
		} else {
	%>
	<center>
		<br /> <br />
		<h4>로그인이 필요한 서비스입니다.</h4>
		<input type="button" value="로그인"
			onclick="javascript:popupClose('login.html')">
	</center>
	<%
		}
	%>
</body>
</html>