<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <script>
    //ACTIVE ONLY SOME PAGES
    $( document ).ready(function() {
    var url = document.URL;
	    if (url.indexOf("tabs/system_admin") > -1) { //TRUE - URL CONTAINS THE STRING
	    	$("#ul_upper_tabs a").removeClass("active");
	    	$("#system_admin_tab").addClass("active");
	    } else if (url.indexOf("tabs/personal_zone") > -1) {
	    	$("#ul_upper_tabs a").removeClass("active");
	    	$("#personal_zone_tab").addClass("active");
	    } else if(url.indexOf("tabs/president") > -1) {
	    	$("#ul_upper_tabs a").removeClass("active");
	    	$("#president_tab").addClass("active");
	    } else if(url.indexOf("tabs/accountant") > -1) {
	    	$("#ul_upper_tabs a").removeClass("active");
	    	$("#accountant_tab").addClass("active");
	    } else if(url.indexOf("tabs/office_manager") > -1) {
	    	$("#ul_upper_tabs a").removeClass("active");
	    	$("#office-manager_tab").addClass("active");
	    }
    });
    </script>
<td></td>


<% //DIFRENT NAVBARS FOR DIFRENT USERS
String usertype_ue = "<td>NAVBAR ERROR</td>";
if (session.getAttribute("usertype_ue") != null) {
    usertype_ue = (String)session.getAttribute("usertype_ue");
}

//-------------------------ADMIN--------------------------------------
if(usertype_ue.equals("admin")) { %>
<td>
	<ul id="ul_upper_tabs" class="nav nav-tabs">
		<li id="system_admin_tab" class="navbar-right">
		     <a href="tabs/system_admin/admin_manage-users.jsp">מנהל מערכת</a>
		</li>
	</ul>
</td>
<% }
//-------------------------PRESIDENT--------------------------------------
else if (usertype_ue.equals("president")) { %>
	<%@ include file="/tabs/president/includes/bubble_calc.jsp" %>

<td>
	<ul id="ul_upper_tabs" class="nav nav-tabs">
		<li id="personal_zone_tab" class="navbar-right">
		     <a href="tabs/personal_zone/pz_p-monthly-report.jsp">אזור אישי</a>
		</li>
		<li id="president_tab" class="navbar-right">
		     <a href="tabs/president/pr_manage-reports.jsp">ניהול עובדים 
		     <% if (!bubble.equals("0")) { %><span class="badge"><%= bubble %></span><% } %></a>
		</li>
		<li id="system_admin_tab" class="navbar-right">
		     <a href="tabs/system_admin/admin_manage-users.jsp">מנהל מערכת</a>
		</li>
	</ul>
</td>
<% }
//-------------------------OFFICE MANAGER--------------------------------------
else if (usertype_ue.equals("office_manager")) { %>
<%@ include file="/tabs/office_manager/includes/bubble_calc.jsp" %>
<td>
	<ul id="ul_upper_tabs" class="nav nav-tabs">
		<li id="personal_zone_tab" class="navbar-right">
		     <a href="tabs/personal_zone/pz_m-monthly-report.jsp">אזור אישי</a>
		</li>
		<li id="office-manager_tab" class="navbar-right">
		     <a href="tabs/office_manager/om_manage-reports.jsp">ניהול משרד 
		     <% if (!bubble.equals("0")) { %><span class="badge"><%= bubble %></span><% } %></a>
		</li>
	</ul>
</td>
<%} 
//-------------------------ACCOUNTANT--------------------------------------
else if (usertype_ue.equals("accountant")) { %>
<td>
	<ul id="ul_upper_tabs" class="nav nav-tabs">
		<li id="personal_zone_tab" class="navbar-right">
		     <a href="tabs/personal_zone/pz_personal-info.jsp">אזור אישי</a>
		</li>
		<li id="accountant_tab" class="navbar-right">
		     <a href="tabs/accountant/ac_general-capacity.jsp">ניהול חשבונות </a>
		</li>
	</ul>
</td>
<% }
//-------------------------COORDINATOR--------------------------------------
else if (usertype_ue.equals("coordinator")) { %>
<td>
	<ul id="ul_upper_tabs" class="nav nav-tabs">
		<li id="personal_zone_tab" class="navbar-right">
		     <a href="tabs/personal_zone/pz_c-monthly-report.jsp">אזור אישי</a>
		</li>
	</ul>
</td>
<% }
//-------------------------HOURLY WORKER--------------------------------------
else if (usertype_ue.equals("hourly_worker")) { %>
<td>
	<ul id="ul_upper_tabs" class="nav nav-tabs">
		<li id="personal_zone_tab" class="navbar-right">
		     <a href="tabs/personal_zone/pz_hours-report.jsp">אזור אישי</a>
		</li>
	</ul>
</td>
<% } %>