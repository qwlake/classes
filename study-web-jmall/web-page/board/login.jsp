<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<script type="text/javascript" src="js/index.js"></script>

<%@ page import ="java.sql.*" %>
<%
try {
    String uname = request.getParameter("uname");    
    String pass = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jmall",
            "root", "1234");
    Statement st = conn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from members where uname='" + uname + "' and pass='" + pass + "'");
    if (rs.next()) {
        session.setAttribute("uname", uname);
        session.setAttribute("islogin", "yes");
        //out.println("welcome " + uname);
        //out.println("<a href='logout.jsp'>Log out</a>");
        out.println("<Script language='JavaScript'>parent.location.href='../index.jsp';</Script>");
    } else {
    	%>
        <script>
        alert("로그인 정보가 옳바르지 않습니다.");
        document.location.href='login.html';
        </script>
    	<%
    }
} catch (Exception e) {
	e.printStackTrace();
}
%>