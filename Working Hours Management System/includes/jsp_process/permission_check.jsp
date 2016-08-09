<%@ page language="java" pageEncoding="UTF-8"%><%@ page import="jsp.*"%><% 
//INCLUDE ALSO OTHER FILES TO APPEAR IN ALL CONTENT WEBPAGES %><%@
 include file="check_cookie.jsp" %><% 
String currUtSession = (String)session.getAttribute("usertype"); //USERTYPE SESSION (fsdf234r2csdzf@#$%zd)

String permission = "no";

String firstHash = "CM$"; //RANDOM STRING FOR ENCRYPTION, ALSO IN login_validate.jsp, cookie_check.jsp
String toMd5;

for(int i=0; i<usertypesPermission.length ;i++) {
	toMd5 = firstHash + session.getAttribute("name") + usertypesPermission[i];
	toMd5 = InputCheck.md5encrypt(toMd5); //ENCRYPT USERTYPE SESSION USING md5()
	if (toMd5.equals(currUtSession)) {
		permission = "yes";
	}
}

//NO PERMISSION: ERROR
if (permission == "no") {
	throw new Error("Permission denied. This area is for authorized users only.");
}
%>