<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<%@ page import ="java.sql.*" %>
<%
String uname = request.getParameter("uname");
boolean result = false;
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jmall",
            "root", "1234");
    Statement st = conn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from members where uname='" + uname + "'");
    if (rs.next()) { 
    	session.setAttribute("confirmId", " ");%>
    	<center>
    	<br/><br/>
    	<h4>이미 사용중인 아이디입니다.</h4>
    	</center>
    <% } else { 
    	session.setAttribute("confirmId", uname);%>
    	<center>
    	<br/><br/>
    	<h4>입력하신 <%=uname%>는 사용하실 수 있는 아이디입니다.</h4>
    	</center>
    <% }
} catch (Exception e) {
	e.printStackTrace();
}
%>