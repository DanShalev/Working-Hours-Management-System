<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//CHOOSE BETWEEN USERTYPES
/*SOME JDEE DONT SUPPORT SWITCH FOR STRINGS*/
String name = null;
//------------------------HOURLY WORKER----------------------------------
if(usertype.equals("hourly_worker")) { %>
						<a href="#" class="popover_link" data-placement="left" data-toggle="popover"
							title="<div style='text-align: right;'>עובד שעתי"
							data-content="
								<div style='text-align: right'>
									<strong>תיאור</strong> <br>
									אינו עובד קבוע.
									<br>
									מחוייב לדווח שעות עבודה ולפרט עשייה בהתאם. <br>
								</div>
							" style="text-align: right;">
							<span class="info_notbold">עובד שעתי</span>
						</a>
<% }
//------------------------PRESIDENT----------------------------------
else if (usertype.equals("president")) { %>

						<a href="#" class="popover_link" data-placement="left" data-toggle="popover"
							title="<div style='text-align: right;'>עובד בנשיאות"
							data-content="
								<div style='text-align: right'>
									<strong>תיאור</strong> <br>
								   		  אחראי על כלל המערכת. <br>
								   		 (ניהול משתמשים, ניהול משרדים, פיקוח על שעות העבודה)
									<br><strong>הרשאות</strong><br>
								
									<ul style='padding-right: 13px; margin-bottom: 0px;'>
					  					<li style='padding-botom: 0px'>כלל ההרשאות במערכת.</li>
									</ul>
								</div>
							" style="text-align: right;">
							<span class="info_notbold">עובד בנשיאות</span>
						</a>
<% }
//------------------------ACCOUNTANT----------------------------------
else if (usertype.equals("accountant")) { %>
					<a href="#" class="popover_link" data-placement="left" data-toggle="popover"
							title="<div style='text-align: right;'>מנהל חשבונות"
							data-content="
								<div style='text-align: right'>
									<strong>תיאור</strong> <br>
								   		  אחראי על ניהול השכר והחשבונות של עובדי האגודה.
									<br><strong>הרשאות</strong><br>
								
									<ul style='padding-right: 13px; margin-bottom: 0px;'>
					  					<li style='padding-botom: 0px'>עריכת תקנים (של תפקידים ומשתמשים).</li>
					  					<li style='padding-botom: 0px'>צפייה בהיסטוריית הדיווחים של כלל העובדים במערכת.</li>
										<li style='padding-botom: 0px'>הפקת דו''חות אישיים ודו''ח מיכפל.</li>
									</ul>
								</div>
							" style="text-align: right;">
							<span class="info_notbold">מנהל חשבונות</span>
						</a>
<% }
//------------------------OFFICE MANAGER----------------------------------
else if (usertype.equals("office_manager")) { %>
<a href="#" class="popover_link" data-placement="left" data-toggle="popover"
							title="<div style='text-align: right;'>מנהל משרד"
							data-content="
								<div style='text-align: right'>
									<strong>תיאור</strong> <br>
								   		אחראי על ניהול העובדים הכפופים למשרד.
									<br><strong>הרשאות</strong><br>
								
									<ul style='padding-right: 13px; margin-bottom: 0px;'>
					  					<li>ניהול דיווחים לעובדים הכפופים למשרד.</li>
					  					<li style='padding-botom: 0px'>הפקת דו''חות רלוונטים לעובדים הכפופים למשרד.</li>
									</ul>
								</div>
							" style="text-align: right;">
							<span class="info_notbold">מנהל משרד</span>
						</a>
<% }
//------------------------COORDINATOR----------------------------------
else if (usertype.equals("coordinator")) { %>
	<a href="#" class="popover_link" data-placement="left" data-toggle="popover"
							title="<div style='text-align: right;'>רכז"
							data-content="
								<div style='text-align: right'>
									<strong>תיאור</strong> <br>
								   		מנהל תחום במשרד.
								   		<br>
								   		מחוייב לדווח שעות עבודה חודשיות ולפרט עשייה חודשית.
								</div>
							" style="text-align: right;">
							<span class="info_notbold">רכז</span>
						</a>
<% 
//------------------------ADMIN----------------------------------
} else if (usertype.equals("admin")) { %>
<a href="#" class="popover_link" data-placement="left" data-toggle="popover"
							title="<div style='text-align: right;'>מנהל מערכת"
							data-content="
								<div style='text-align: right'>
									<strong>תיאור</strong> <br>
								   		אחראי על ניהול המשתמשים במערכת.
									<br><strong>הרשאות</strong><br>
								
									<ul style='padding-right: 13px; margin-bottom: 0px;'>
					  					<li>יצירה ועריכת משתמשים.</li>
					  					<li>יצירה ועריכת משרדים.</li>
					  					<li style='padding-botom: 0px'>יצירה ועריכת תפקידים ותקנים.</li>
									</ul>
								</div>
							" style="text-align: right;">
							<span class="info_notbold">מנהל מערכת</span>
						</a>
<% } %>
