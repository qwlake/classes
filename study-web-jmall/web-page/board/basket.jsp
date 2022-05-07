<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
<style></style>
<link rel="stylesheet" type="text/css" href="../CSS/product_style.css">
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script type="text/javascript" src="../js/index.js"></script>
</head>
<body class="member_page" id="basket">
	<%
int idbasket;
String name = "";
String uname = (String) session.getAttribute("uname");
String pname;
int count;
String putdate = "";
String herf = "";
int index = 0;
%>
	<content class="member_page_wrapper" id="basket_wrapper">
	<h2>장바구니</h2>
	<form action="basketOrder.jsp" method="post">
		<fieldset>
			<legend><%= uname %>님의 장바구니</legend>
			<table class="member_page_table" id="basket_table" border="1">
				<tr>
					<th class="th" id="basket_pname">상품명</th>
					<th class="th">개수</th>
					<th class="th">담은 날짜</th>
					<th class="th">장바구니 번호</th>
				</tr>
				<%
                try {
                	Class.forName("com.mysql.jdbc.Driver");
                	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jmall",
                	        "root", "1234");
                	Statement st = conn.createStatement();
                	ResultSet rs;
                	rs = st.executeQuery("select * from basket where uname='" + uname + "'");
                	while (rs.next()) {
                		Statement tempSt = conn.createStatement();
                		ResultSet tempRs;
                		tempRs = tempSt.executeQuery("select * from products where idproduct='" + rs.getInt("idproduct") + "'");
                		if (tempRs.next()) {
                			idbasket = rs.getInt("idbasket");
                			pname = tempRs.getString("pname");
                			herf = tempRs.getString("herf");
                			count = rs.getInt("count");
                			putdate = rs.getString("putdate");
                			%>
				<tr>
					<td class="td"><a class="pname" target="_blank" herf=<%= herf %>><%= pname %></a></td>
					<td class="td"><%= count %></td>
					<td class="td"><%= putdate %></td>
					<td class="td"><input type="checkbox" name="orderList" value=<%= idbasket %>></td>
				</tr>
				<%
                			}
                			index++;
                		}
                } catch (Exception e) {
                	e.printStackTrace();
                }
                %>
			</table>
			<input id="reset" type="button" onclick="javascript:orderDelete()" value="선택삭제"> 
			<input id="regdone" type="submit" value="선택주문">
		</fieldset>
	</form>
	</content>
</body>
</html>