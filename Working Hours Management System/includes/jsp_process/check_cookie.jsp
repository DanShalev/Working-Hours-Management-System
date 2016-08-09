<%@ page language="java" pageEncoding="UTF-8" %><%@ 
page import="jsp.*, java.sql.*,java.security.MessageDigest" %><%
//-----------CHECK COOKIE FOR PERMISSION (TO STAY IN APGES)-------------
//GET COOKIE
Cookie cookie0 = null;
Cookie[] cookies0 = null;
boolean cookie_exist = false;
   
cookies0 = request.getCookies(); //Get an array of Cookies associated with this domain
if(cookies0 != null) {
    for (int i = 0; i<cookies0.length; i++) {
    	if(cookies0[i].getName().equals("asat_system")){
    		cookie_exist = true;
    		cookie0 = cookies0[i];
    	}
   	}
}
//CHECK SESSION IS UNDEFINED + COOKIE EXIST
if (session.getAttribute("usertype") == null && cookie_exist == true) {
	//CHECK COOKIE DATA AND INDENTIFY HIM BY DB
	Connection asat_db_con = MySQL.connect(); //Connect to MySQL server
	PreparedStatement ps00 = asat_db_con.prepareStatement("SELECT users_idx,user_type,first_name, last_name FROM asat_hours.employees INNER JOIN asat_hours.users "
			+ "ON asat_hours.employees.employees_idx=asat_hours.users.users_idx"
			+ " WHERE cookie=?");
	ps00.setString(1, cookie0.getValue());
	ResultSet rs = ps00.executeQuery();

	//Get number of rows
	rs.last();
	int rowCount = rs.getRow();
	//CHECK IF COOKIE IS OK
	if(rowCount==1){ //COOKIE EXIST, CREATE SESSION
		//CREATE SESSION
		String firstHash = "CM$"; //RANDOM STRING FOR ENCRYPTION, ALSO IN permission_check.jsp, login_validate.jsp
		//GET IDX
		String user_idx = null, user_type = null, first_name = null, last_name = null;
		rs.beforeFirst();
		while (rs.next()) {
			user_idx = rs.getString(1); //users_idx
			user_type = rs.getString(2); //users_type
			first_name = rs.getString(3); //first_name
			last_name = rs.getString(4); //last_name
		}

		//SET NAME
		session.setAttribute("name", first_name + " " + last_name);
		//SET IDX USING md5
		String idx_session = InputCheck.md5encrypt(firstHash + user_idx + "id");
		session.setAttribute("user_id", idx_session);
		//SET USERTYPE USING MD5
		String usertype_session = firstHash + session.getAttribute("name") + user_type;
		usertype_session = InputCheck.md5encrypt(usertype_session);
		session.setAttribute("usertype", usertype_session);
		//SET usertype_ue
		session.setAttribute("usertype_ue", user_type);
		//Close CONNECTION
		rs.close();
		MySQL.close(asat_db_con);
		//NO REDIRECTION, KEEP IN PAGE
	} else { //COOKIE IS FALSE, REDIRECT TO LOGIN PAGE
		session.setAttribute("cookie_redirect", "redirected");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "../../login.jsp");
		//Close CONNECTION
		rs.close();
		MySQL.close(asat_db_con);
		out.close();
	}
} 
//NO LOGIN DETAILS, REDIRECT TO LOGIN PAGE
else if (session.getAttribute("usertype") == null) {
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "../../login.jsp");
	out.close();
}
%>