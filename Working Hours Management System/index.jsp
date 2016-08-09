<%@ page language="java" %>
<% //REDIRECT TO LOGIN PAGE
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "login.jsp");
%>