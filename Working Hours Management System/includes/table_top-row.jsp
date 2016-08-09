<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<td>
	<img src="style/AsatLogo.png" style="width: 150px;" alt='asat_hours_logo'>
</td>
<td id="user_info-top-left">
	<!-- USER INFO -->
	<span class="glyphicon glyphicon-user"></span>
		<%= session.getAttribute("name") %> | <a href="jsp_process/logout.jsp">צא</a>
</td>