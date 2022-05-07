<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색결과</title>
<style></style>
<link rel="stylesheet" type="text/css" href="../../CSS/product_style.css">
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script type="text/javascript" src="../../js/index.js"></script>
</head>
<body class="product_page">
	<content> <%
		String keyword = request.getParameter("keyword");
		int idproduct;
		String herf = "";
		String kinds = "fixie";
		String src = "";
		String srcAlter = "";
		String corp = "";
		String pname = "";
		String cprice = "";
		int price;
		DecimalFormat df = new DecimalFormat("###,###");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jmall", "root", "1234");
			Statement st = conn.createStatement();
			ResultSet rs;
			rs = st.executeQuery("select * from products where herf LIKE '%" + keyword + "%' OR " + 
					"kinds LIKE '%" + keyword + "%' OR " + 
					"src LIKE '%" + keyword + "%' OR " + 
					"corp LIKE '%" + keyword + "%' OR " + 
					"pname LIKE '%" + keyword + "%' OR " + 
					"price LIKE '%" + keyword + "%'");
			while (rs.next()) {
				idproduct = rs.getInt("idproduct");
            	herf = rs.getString("herf");
            	kinds = rs.getString("kinds");
            	src = rs.getString("src");
            	srcAlter = src.substring(0, src.length()-3) + src.substring(src.length()-3, src.length()).toUpperCase();
            	corp = rs.getString("corp");
            	pname = rs.getString("pname");
            	price = rs.getInt("price");
            	cprice = df.format(price);
            	%>
            	<div class="product_wrapper">
            		<a target="_blank" href=<%= herf %>>
            			<img class=“product_img” src="<%= src %>" onerror="javascript:this.src='<%= srcAlter %>'"><br/>
            			<span><%= corp %></span> - <%= pname %><br/><%= cprice %>원
        			</a><br/>
            		<input class="product_button" id="buy" type="button" onclick="" value="구매하기">
            		<input class="product_button" id="putbasket" type="button" onclick="javascript:putBasket(<%= idproduct %>)" value="장바구니">
            	</div>
            	<%
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	</content>
</body>
</html>