<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//DESTROY COOKIE
Cookie cookie = null;
Cookie[] cookies = null;
   
cookies = request.getCookies(); //Get an array of Cookies associated with this domain
if(cookies != null) {
    for (int i = 0; i<cookies.length; i++) {
    	if(!cookies[i].getName().equals("JSESSIONID")){
	    	cookies[i].setMaxAge(0);
	        cookies[i].setValue(null);
	        cookies[i].setPath("/");
	        response.addCookie(cookies[i]);
    	}
   	}
}
//DESTROY SESSION
session.invalidate(); 
//REDIRECT TO LOGIN PAGE
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", "../login.jsp");

%>