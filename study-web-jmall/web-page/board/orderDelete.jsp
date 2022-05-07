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
<title>장바구니 주문</title>
<style></style>
<link rel="stylesheet" type="text/css"
	href="../../CSS/product_style.css">
<script type="text/javascript" src="../js/index.js"></script>
</head>
<body>
	<%
		String uname = (String) session.getAttribute("uname");
		String[] orderList = request.getParameterValues("orderList[]");
		String sql = "";
		boolean result = false;
		if (session.getAttribute("islogin") == "yes") {
			Connection conn = null;
			Statement st = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jmall", "root", "1234");
				for (String order:orderList) {
					st = conn.createStatement();
					sql = "delete from basket where idbasket like '" + order + "'";
					st.executeUpdate(sql);
				}
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