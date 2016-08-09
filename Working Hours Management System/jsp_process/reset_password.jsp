<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="jsp.*, java.sql.*,java.security.MessageDigest" %>
<%

//Get variables from login_form
String id_number = request.getParameter("id_number");
String birth_date = request.getParameter("birth_date");
String email = request.getParameter("email");

//CHECK FOR NULL FORCED VALUES (IN CASE OF ATTACK)
if (id_number == null || birth_date == null || email == null || InputCheck.trimSpaces(id_number).equals("") || InputCheck.trimSpaces(birth_date).equals("") || InputCheck.trimSpaces(email).equals("")) {
	throw new Error("Wrong input values.");
}

//Connect to MySQL server
Connection asat_db_con = MySQL.connect();

//Query
PreparedStatement ps = asat_db_con.prepareStatement("SELECT employees_idx FROM employees WHERE id=? AND birthdate=? AND email=?");
ps.setString(1, id_number);
ps.setString(2, birth_date);
ps.setString(3, email);
ResultSet rs = ps.executeQuery(); //Get results

//Get number of rows
rs.last();
int rowCount = rs.getRow();

//REDIRECT
if(rowCount==1){
	//Close connection
	rs.close();
	MySQL.close(asat_db_con);
		
	//***********IF DETAILS TRUE - RESET PASSWORD + REDIRECT***********************/
	out.print("Not compatible yet. Modifications needs to be done... REDIRECTING IN 3 SECONDS...");
	response.setHeader("Refresh", "3;url=../login.jsp");
	/****************************NEEDS EDITING***************************************/
} else {
	//SET SESSION FOR BADLOGIN
    session.setAttribute("wrong_details", "true");
    
 	//Close connection
  	rs.close();
  	MySQL.close(asat_db_con);
	//REDIRECT TO LOGIN PAGE
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "../login.jsp");
}
%>