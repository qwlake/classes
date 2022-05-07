<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
session.setAttribute("userid", null);
session.setAttribute("islogin", "no");
session.invalidate();
response.sendRedirect("../index.jsp");
%>