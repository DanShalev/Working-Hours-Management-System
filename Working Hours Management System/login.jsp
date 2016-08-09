<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
//GET COOKIE
Cookie[] cookies0 = null;
boolean cookie_exist = false;
 
cookies0 = request.getCookies(); //Get an array of Cookies associated with this domain
if(cookies0 != null) {
  for (int i = 0; i<cookies0.length; i++) {
  	if(cookies0[i].getName().equals("asat_system")){
  		cookie_exist = true;
  	}
  }
}

//CHECK IF COOKIE EXIST - REDIRECT
if ((cookie_exist == true && (session.getAttribute("cookie_redirect")!=null && !session.getAttribute("cookie_redirect").equals("redirected")))
		|| (cookie_exist == true && session.getAttribute("cookie_redirect")==null)) {
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "tabs/personal_zone/pz_personal-info.jsp");
	out.close();
} else { //COOKIE EXIST BUT FALSE/COOKIE DOES NOT EXIST
	session.setAttribute("cookie_redirect", "false");
}
%>

<!DOCTYPE html>
<html>
	<head>
		<% /*@ Include META CONTENT @*/ %>
		<%@ include file="../../includes/meta-content.html" %>

		<link rel="stylesheet" href="style/loginStyle.css" />
    	<title>התחברות - אס"ט</title>
		
		<script>
		//INVALID LOGIN SESSION HANDELING
			var wrong_password = false;
			<% /*JSP*/ if (session.getAttribute("wrong_password") == "true") { %>
			wrong_password = true;
			<% /*JSP*/ session.setAttribute("wrong_password", "false"); } %>
		//INVAILD FORGOT PASSWORD DETAILS
			var wrong_details = false;
			<% //if bla bla %>
			<% /*JSP*/ if (session.getAttribute("wrong_details") == "true") { %>
			wrong_details = true;
			<% /*JSP*/ session.setAttribute("wrong_details", "false"); } %>
		
			//ACTIVATE FORGOT PASSWORD
			$(document).ready(function() {
				$("#forgot_password_link").click(function(e) {
						e.preventDefault();
						$('#modal_forgot_password').modal('show');
					});
			});
		</script>
 		<script src="jsp_process/login_validate.js"></script>
 		<script src="jsp_process/reset_password_validate.js"></script>
</head>

<body>
	<div style="float: right; margin-right:15px;">
		<img src="style/AsatLogo.png" style="width: 150px;" alt='asat_hours_logo'>
	</div>
	

	<div id="login_box_container" class="container">
		<div id="login_box">
			<form id="login_form" class="form-signin" role="form" onsubmit="return validateForm()"
			 action="jsp_process/login_validate.jsp" method="POST">
		        <h2 class="form-signin-heading" style="float: right; padding: 0px;">התחבר למערכת</h2>
		        			
		         
		         <% //SAVE USERNAME WHEN RELOADING FORM AND AUTOFOCUS
		         String username = "";
		         String autofocus_username = "autofocus";
		         String autofocus_password = "";
		         if (session.getAttribute("old_username") != null) {
			        	username = (String)session.getAttribute("old_username");
			        	autofocus_username = "";
				        autofocus_password = "autofocus";
			        	session.removeAttribute("old_username");
			        }
		         %>
		         <div id="fg1" class="form-group fg_margin_bottom">
			        <input name="user_id" id="user_id" type="text" class="form-control" placeholder="תעודת זהות" <%= autofocus_username %>
			        value="<%= username %>">
			        
			        <span id="sp1"></span>
			    </div>
			    <div id="fg2" class="form-group fg_margin_bottom">
			        <input name="user_password" id="user_password" type="password" class="form-control" placeholder="סיסמה" <%= autofocus_password %>>
			        <span id="sp2"></span>
			    </div>	   
		        
		        <fieldset id="fs_remember_me" style="float: right; white-space: nowrap;">
		        	<input tabIndex="-1" id="remember_me" name="remember_me" type="checkbox" value="remember-me" style="float: right; white-space: nowrap; "> 
		        	<label  for="remember_me" id="checkbox_label">זכור אותי </label>
		        </fieldset>
		        
				<a tabIndex="-1" id="forgot_password_link" href="#">?שכחת סיסמה</a>
		        <button class="btn btn-lg btn-primary btn-block" type="submit">התחבר</button>
		        
		        <div id="error_msg_login"></div>
		    </form>
		</div>
	</div> <!-- /container -->

<%-- ---------------------------------END CONTENT--------------------------------------%>
<!-- FORGOT PASSWORD MODAL -->
<div id="modal_forgot_password" class="modal fade">
  <div class="modal-dialog" style="width: 415px;">
    <div class="modal-content">
	      <div class="modal-header" style="height: 50px">
		        <button type="button" class="close pull-left" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title pull-right">איפוס סיסמה</h4>
	      </div>
	      <div class="modal-body" style=" direction: rtl;">
	       <div style="color: #f0ad4e;">
		       <span class="glyphicon glyphicon-warning-sign"></span>
		        	על מנת לאפס את הסיסמה יש להזין 3 פרטים מזהים. במידה ושלושתם נכונים, הסיסמה תאופס ותשלח לדוא״ל השמור במערכת.
		      	<br>
	      	</div>
	      	<!-----------------------FORM--------------------->
	      	<form method="POST" id="reset_password_form" onsubmit="return validateForm2();" action="jsp_process/reset_password.jsp">
	      	<!--id_number -->
	      	<div class="form-horizontal" style="margin-top: 16px;">  <!-- FORM HORIZONTAL 1 -->
									<div id="fg3" class="form-group">
								    	<label for="id_number" class="col-sm-2 control-label pull-right form_lables">תעודת זהות</label>
								    	<div class="col-sm-8">
								      		<input id="id_number" name="id_number" type="text" class="form-control" placeholder="הזן תעודת זהות">
								    		<span id="sp3"></span>
								    	</div>
								 	</div>
								 	<span id="sp_err3"></span>
								 	
								 	<!--birth_date -->
									<div id="fg4" class="form-group">
								    	<label for="birth_date" class="col-sm-2 control-label pull-right form_lables">תאריך לידה</label>
								    	<div class="col-sm-8">
								      		<input id="birth_date" name="birth_date" type="date" class="form-control" placeholder="הזן תאריך לידה" value="1990-01-01">
								    		<span id="sp4"></span>
								    	</div>
								 	</div>
								 	<span id="sp_err4"></span>
								 	
								 	<!--email-->
									<div id="fg5" class="form-group" style="margin-bottom: 0px;">
								    	<label for="email" class="col-sm-2 control-label pull-right form_lables">דואר אלקטרוני</label>
								    	<div class="col-sm-8">
								      		<input id="email" name="email" type="email" class="form-control" placeholder="הזן דואר אלקטרוני" style="direction: ltr">
								    		<span id="sp5"></span>
								    	</div>
								 	</div>
								 	<span id="sp_err5"></span>
								 	
								 	<div id="wrong_details_error"></div>
	      	</div>
	      	
	      	<!-----------------END OF FORM--------------------->
	        		<!-- delete_role form + delete & abort button -->
	        		
			        	<div style="float: left; position: relative; bottom: -4px; vertical-align: bottom;">
			        			<!-- submit delete -->
				        		<button class="btn btn-warning" type="submit">
									<span class="glyphicon glyphicon-wrench"></span> אפס סיסמה
								</button>
							
							<!-- abort -->
							<button type="button" class="btn btn-default" data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> בטל
							</button>
			      		</div>
			      		<div id="modal_bottom_div" style="margin-bottom:30px"></div>
	      		</form>
	      </div>
    </div>
  </div>
</div>

<%@ include file="includes/footer.html" %>

</body>
</html>