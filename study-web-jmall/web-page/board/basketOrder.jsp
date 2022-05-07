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
		String basket = "basket";
		String uname = (String) session.getAttribute("uname");
		String orderList[] = request.getParameterValues("orderList");
		String sql = "";
		int index = 0;
		boolean result = false;
		if (session.getAttribute("islogin") == "yes") {
			Connection conn = null;
			Statement st = null;
			String idbasket = null;
			int idproduct[] = new int[10];
			int count[] = new int[10];
			String address = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jmall", "root", "1234");
				for (String order:orderList) {
					st = conn.createStatement();
					sql = "select * from members where uname='" + uname + "'";
					ResultSet rs = st.executeQuery(sql);
					if (rs.next()) {
						address = rs.getString("address");
					}
				}
			} catch (Exception e) {
				out.println(e.getMessage());
				e.printStackTrace();
			}
			
			try {
				for (String order:orderList) {
					st = conn.createStatement();
					sql = "select * from basket where idbasket='" + order + "'";
					ResultSet rs = st.executeQuery(sql);
					while (rs.next()) {
						idproduct[index] = rs.getInt("idproduct");
						count[index] = rs.getInt("count");
						index++;
					}
				}
			} catch (Exception e) {
				out.println(e.getMessage());
				e.printStackTrace();
			}
			
			index = 0;

			try {
				for (String order:orderList) {
					st = conn.createStatement();
					sql = "insert into delivery " + "(uname, idproduct, count, orderdate, address) " + 
					"values ('" + uname + "', '" + idproduct[index] + "', '" + count[index] + "', CURDATE(), '" + address + "')";
					st.executeUpdate(sql);
					index++;
				}
			} catch (Exception e) {
				out.println(e.getMessage());
				e.printStackTrace();
			}
			
			try {
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