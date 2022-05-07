<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<%@ page import ="java.sql.*" %>
<%
String uname = request.getParameter("uname"); 
if (session.getAttribute("confirmId").equals(uname)) {
	session.setAttribute("confirmId", -1);
    String name = request.getParameter("name");    
    String pass = request.getParameter("pass");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jmall",
            "root", "1234");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into members(name, uname, pass, email, phone, address, regdate) values ('" + 
    							name + "','" + 
    							uname + "','" + 
    							pass + "','" + 
    							email + "','" + 
    							phone + "','" + 
    							address + 
    							"', CURDATE())");
    if (i > 0) {
        //session.setAttribute("userid", uname);
        response.sendRedirect("welcome.html");
		//out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("join.jsp");
    }
} else {
	%> <h4>아이디 중복검사를 완료해주시길 바랍니다.</h4>
	<a href='join.jsp'>회원가입</a><%
}
%>