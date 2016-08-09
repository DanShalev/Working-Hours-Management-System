/*------------------VALIDATE FUNCTIONS------------------------------------*/
function checkTextAndNumbers(text_input) {
    var letters = /^[0-9a-zA-Z]+$/;
    return (letters.test(text_input));
}
function checkNumbers(text_input) {
    var letters = /^[0-9]*$/;
    return (letters.test(text_input));
}

/*------------------LOGIN VALIDATE----------------------------------------*/
function validateForm() {
	var form_submit = true;
    var username_value=document.forms["login_form"]["user_id"].value;
    var password_value=document.forms["login_form"]["user_password"].value;
	
    //SET DEFULT STYLE AND TEXT
    $("#error_msg_login").html("");

    /*=======================user_id===============================*/
    //IF USER_ID IS EMPTY:
    if (username_value==null || username_value=='') {
    	//ADD ERROR CLASS & MSG
    	if (!$("#fg1").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
    		$("#fg1").addClass("has-error has-feedback");
        	$("#sp1").addClass("glyphicon glyphicon-remove form-control-feedback");
        	$("#user_id").css("padding-right","30px");
    	}
        $("#error_msg_login").html(function(i,origText) {
            return origText + "<img src='style/symbols/validate/error.png' alt='error_icon' class='error_icon'>"
                + " הזן תעודת זהות.<br>";
        });
        form_submit = false;
    }
    //IF USER_ID == "Admin":
    else if (username_value == "Admin") {
        form_submit = true;
    }
    //IF USERNAME IS NOT NUMBERS:
    else if (!checkNumbers(username_value)) {
    	//ADD ERROR CLASS & MSG
    	if (!$("#fg1").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
    		$("#fg1").addClass("has-error has-feedback");
        	$("#sp1").addClass("glyphicon glyphicon-remove form-control-feedback");
        	$("#user_id").css("padding-right","30px");
    	}
        $("#error_msg_login").html(function(i,origText) {
            return origText + "<img src='style/symbols/validate/error.png' alt='error_icon' class='error_icon'>"
                + " תעודת הזהות יכולה להכיל מספרים בלבד.<br>";
        });
        form_submit = false;
    }
    //IF USER_ID IS NOT 9 CHARS:
    else if (username_value.length!= 9) {
    	//ADD ERROR CLASS & MSG
    	if (!$("#fg1").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
    		$("#fg1").addClass("has-error has-feedback");
        	$("#sp1").addClass("glyphicon glyphicon-remove form-control-feedback");
        	$("#user_id").css("padding-right","30px");
    	}
    	
        $("#error_msg_login").html(function(i,origText) {
            return origText + "<img src='style/symbols/validate/error.png' alt='error_icon' class='error_icon'>"
                + " תעודת הזהות חייבת להיות באורך 9 תווים.<br>";
        });
        form_submit = false;
    } else {
    	//REMOVE ERROR
    	if ($("#fg1").hasClass("has-error")) { //REMOVE ERROR CLASS & MSG
    		$("#fg1").removeClass("has-error has-feedback");
        	$("#sp1").removeClass("glyphicon glyphicon-remove form-control-feedback");
        	$("#user_id").css("padding-right","9px");
    	}
    }

    
    /*=======================user_password===============================*/
    //IF PASSWORD IS EMPTY:
    if (password_value==null || password_value=='') {
    	//ADD ERROR CLASS & MSG
    	if (!$("#fg2").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
    		$("#fg2").addClass("has-error has-feedback");
        	$("#sp2").addClass("glyphicon glyphicon-remove form-control-feedback");
        	$("#user_password").css("padding-right","30px");
    	}
    	
        $("#error_msg_login").html(function(i,origText) {
            return origText + "<img src='style/symbols/validate/error.png' alt='error_icon' class='error_icon'>"
                + " הזן סיסמה.<br>";
        });
        form_submit = false;
    }
    
    //IF PASSWORD IS NOT NUMBERS AND LETTERS:
    else if (!checkTextAndNumbers(password_value)) {
    	//ADD ERROR CLASS & MSG
    	if (!$("#fg2").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
    		$("#fg2").addClass("has-error has-feedback");
        	$("#sp2").addClass("glyphicon glyphicon-remove form-control-feedback");
        	$("#user_password").css("padding-right","30px");
    	}
    	
        $("#error_msg_login").html(function(i,origText) {
            return origText + "<img src='style/symbols/validate/error.png' alt='error_icon' class='error_icon'>"
                + " הסיסמה יכולה להכיל אותיות לועזיות ומספרים בלבד.<br>";
        });
        form_submit = false;
    }
    //IF PASSWORD IS NOT 5-16 CHARS:
    else if (password_value.length<5 || password_value.length>16) {
    	//ADD ERROR CLASS & MSG
    	if (!$("#fg2").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
    		$("#fg2").addClass("has-error has-feedback");
        	$("#sp2").addClass("glyphicon glyphicon-remove form-control-feedback");
        	$("#user_password").css("padding-right","30px");
    	}
    	
        $("#error_msg_login").html(function(i,origText) {
            return origText + "<img src='style/symbols/validate/error.png' alt='error_icon' class='error_icon'>"
                + " הסיסמה חייבת להכיל 5-16 תווים.<br>";
        });
        form_submit = false;
    } else {
    //REMOVE ERROR
    	if ($("#fg2").hasClass("has-error")) { //REMOVE ERROR CLASS & MSG
    		$("#fg2").removeClass("has-error has-feedback");
        	$("#sp2").removeClass("glyphicon glyphicon-remove form-control-feedback");
        	$("#user_password").css("padding-right","9px");
    	}
    }
    
    return form_submit;
}

/*-----------------------VALIDATE LOGIN VIA MySQL DB--------------------------------*/
//IF DETAILS ARE INCORRECT
$(document).ready(function() {
  if (wrong_password == true) {
	  $("#error_msg_login").html(function(i,origText) {
          return origText + "<img src='style/symbols/validate/error.png' alt='error_icon' class='error_icon'>"
              + " שם המשתמש או הסיסמה אינם נכונים.<br>";
      });
  }
});
/*------------------DISABLE ADMIN------------------------------------*/
$(document).ready(function() {
	$('#user_id').bind('input', function() { 
		if ($(this).val() == "Admin") {
			$('#remember_me').prop('checked', false);
			$('#fs_remember_me').attr("disabled","");
			$('#remember_me, #checkbox_label').css("cursor","not-allowed");
		} else {
			$('#fs_remember_me').removeAttr("disabled");
			$('#remember_me, #checkbox_label').css("cursor","pointer");
		}
	});
});