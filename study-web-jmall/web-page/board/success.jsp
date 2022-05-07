<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
로그인이 필요한 서비스입니다.<br/>
<a href="login.html">로그인</a>
<%} else {
%>
어서오세요 <%=session.getAttribute("userid")%>님
<a href='index.html'>Log out</a>
<%
    }
%>