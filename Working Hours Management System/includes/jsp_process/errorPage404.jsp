<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
isErrorPage="true"%>

<!DOCTYPE html>
<html>
	<head>
		<% /*@ Include META CONTENT @*/ %>
		<%@ include file="../meta-content.html" %>
	    <title>שגיאה 404 - אס"ט</title>
	    
		<style>
			/*SIDE-MENU COLOR*/ #admin_manage-users_sm {background-color: #d8d8d8;}
		</style>
	</head>
<body>

<table id="layout-table">
    <tr id="tr_top_row">
    	<td>
			<img src="style/AsatLogo.png" style="width: 150px;" alt='asat_hours_logo'>
		</td>
		<td id="user_info-top-left">

		</td>
    </tr>
    <tr id="tr_second_row">
        <td></td>
		<td>
			<ul id="ul_upper_tabs" class="nav nav-tabs">
				<li class="active navbar-right">
				     <a href="#">מערכת</a>
				</li>
			</ul>
		</td>
    </tr>
    <tr>
        <td id="td_side_menu"></td>
        
        <td id="td_content_box">
         	<div id="main_content_box"> <!-- MAIN CONTENT BOX -->

				<h2 id="h2_heading">שגיאה: 404</h2>
				
				<ul id="ul_edit_user" class="list-group">
					<li class="list-group-item">

						<div style='color: #a94442; font-size: 18px;'><span class='glyphicon glyphicon-remove'></span>
							הדף לא נמצא.
						 </div>
						<!-- BACK BUTTON -->
							<div style="text-align: left;">
								<a class="btn btn-primary" href="login.jsp">
									 <span class="glyphicon glyphicon-share-alt"></span> חזרה
								</a>
							</div>
					</li>
				</ul>
						
         	</div> <!-- CLOSE MAIN CONTENT BOX -->
        </td>
    </tr>
</table>

<%@ include file="../footer.html" %>
</body>
</html>