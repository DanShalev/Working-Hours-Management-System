<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="jsp.*, java.sql.*,java.security.MessageDigest" %>
<%
try {
//Get variables from login_form
String login_id = request.getParameter("user_id");
String login_password = request.getParameter("user_password");

if(login_id.equals("Admin")) //CHANGE USERNAME "Admin" to "0" (in DB Admin record is 0)
	login_id = "0";

//PROTECT SQL INJECTION + HTML SPECIAL CHARS (CLEAR DATA BEFORE SQL SCRIPT)
login_id = InputCheck.formInputCheck(login_id);
login_password = InputCheck.formInputCheck(login_password);

//ENCRYPT PASSWORD USING md5()
login_password = InputCheck.md5encrypt(login_password);

//Connect to MySQL server
Connection asat_db_con = MySQL.connect();

//Query
PreparedStatement ps = asat_db_con.prepareStatement("SELECT users_idx FROM users where id=? and password_md5=?");
ps.setString(1, login_id);
ps.setString(2, login_password);
ResultSet rs = ps.executeQuery(); //Get results

//Get number of rows
rs.last();
int rowCount = rs.getRow();

//REDIRECT
if(rowCount==1){
	//SET SESSION
		String firstHash = "CM$"; //RANDOM STRING FOR ENCRYPTION, ALSO IN permission_check.jsp, cookie_check.jsp
		//GET IDX
		String user_idx = null;
		rs.beforeFirst();
		while (rs.next()) {
			user_idx = rs.getString(1); //users_idx
		}
		
		//QUERY
		PreparedStatement ps2 = asat_db_con.prepareStatement("SELECT cookie, user_type,first_name, last_name FROM asat_hours.employees INNER JOIN asat_hours.users "
				+ "ON asat_hours.employees.employees_idx=asat_hours.users.users_idx"
				+ " WHERE users_idx=?");
		ps2.setString(1, user_idx);
		ResultSet rs2 = ps2.executeQuery();
		
		String cookie_value = null, user_type= null,first_name = null, last_name = null;
		while (rs2.next()) {
			cookie_value = rs2.getString(1); //cookie
			user_type = rs2.getString(2); //user_type
			first_name = rs2.getString(3); //first_name
			last_name = rs2.getString(4); //last_name
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
		
	//SET COOKIE IF ASKED FOR
	if (request.getParameter("remember_me") != null) {
		//GET COOKIE VALUE FROM DB
		PreparedStatement ps3 = asat_db_con.prepareStatement("SELECT cookie FROM users WHERE users_idx=?");
		ps3.setString(1, user_idx);
		ResultSet rs3 = ps3.executeQuery();
		
		String cookie = null;
		while (rs3.next()) {
			cookie = rs3.getString(1); //cookie
		}
		//SET COOKIE
		Cookie asat_system = new Cookie("asat_system",cookie);
		asat_system.setMaxAge(60*60*24*30); //SET COOKIE TIME: 1 MONTH
		asat_system.setPath("/");
		response.addCookie(asat_system); //SEND COOKIE
	}
    //Close connection
	rs.close();
    rs2.close();
	MySQL.close(asat_db_con);

    //REDIRECT TO MAIN PAGE - BY USERTYPE
	String redirectUrl = "#";
	if(user_type.equals("hourly_worker")) {
    	redirectUrl = "../tabs/personal_zone/pz_hours-report.jsp";
	} else if (user_type.equals("president")) {
			redirectUrl = "../tabs/president/pr_manage-reports.jsp";
	} else if (user_type.equals("accountant")) {
			redirectUrl = "../tabs/accountant/ac_general-capacity.jsp";
	} else if (user_type.equals("office_manager")) {
			redirectUrl = "../tabs/office_manager/om_manage-reports.jsp";
	} else if (user_type.equals("coordinator")) {
			redirectUrl = "../tabs/personal_zone/pz_c-monthly-report.jsp";
	} else if (user_type.equals("admin")) {
		redirectUrl = "../tabs/system_admin/admin_manage-users.jsp";
	}
    
    response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", redirectUrl);
} else {
	//SET SESSION FOR BADLOGIN
    session.setAttribute("wrong_password", "true");
    session.setAttribute("old_username", request.getParameter("user_id"));
    
 	//Close connection
  	rs.close();
  	MySQL.close(asat_db_con);
	//REDIRECT TO LOGIN PAGE
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "../login.jsp");
}

//TRY-CATCH
} catch (Exception e) {
	throw new Error();
}
%>