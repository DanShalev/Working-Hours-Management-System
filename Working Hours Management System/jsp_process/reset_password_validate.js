/*------------------VALIDATE FUNCTIONS----------------------------------------*/
function checkNumbers(text_input) {
    var letters = /^[0-9]*$/;
    return (letters.test(text_input));
}
function birthDate(text_input) {
    var date = /^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
    return (date.test(text_input));
}
function checkEmail(text_input) {
    var date = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    return (date.test(text_input));
}
/*------------------OTHER FUNCTIONS----------------------------------------*/
function generatePassword() {
	var pass = Math.floor((Math.random() * 100) + 1);
	$('#password_field').val("Password" + pass);
}

/*------------------ADD USER VALIDATE----------------------------------------*/
function validateForm2() {
	var form_submit = true;
	var id_number=document.forms["reset_password_form"]["id_number"].value;
	var birth_date=document.forms["reset_password_form"]["birth_date"].value;
	var email=document.forms["reset_password_form"]["email"].value;

	/*******************HIDE ERROR MSG*****************************/
	$("#wrong_details_error").html("");
	$("#wrong_details_error").css("margin-top", "0");
    /*=======================id_number===============================*/
	//IF id_number EMPTY:
    if (id_number==null || id_number=='') { 
	    	$("#sp_err3").addClass("help-block help-block_style").text("הזן תעודת זהות.");
	    	
	    	if (!$("#fg3").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
	    		$("#fg3").addClass("has-error has-feedback");
	        	$("#sp3").addClass("glyphicon glyphicon-remove form-control-feedback");
	    	}
	    	form_submit = false;
    }
    //IF id_number NOT LETTERS
    else if (!checkNumbers(id_number)) { 
	    	$("#sp_err3").addClass("help-block help-block_style").text("תעודת זהות יכולה להכיל מספרים בלבד.");
	    	
	    	if (!$("#fg3").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
	    		$("#fg3").addClass("has-error has-feedback");
	        	$("#sp3").addClass("glyphicon glyphicon-remove form-control-feedback");
	    	}
	    	form_submit = false;
    }
    //IF id_number!=9
    else if (id_number.length!=9) { 
		$("#sp_err3").addClass("help-block help-block_style").text("תעודת זהות חייבת להכיל 9 תווים.");
		
		if (!$("#fg3").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
			$("#fg3").addClass("has-error has-feedback");
			$("#sp3").addClass("glyphicon glyphicon-remove form-control-feedback");
		}
		form_submit = false;
    } 
    //GREEN MSG
    else  { 
    	if ($("#fg3").hasClass("has-error")) { //REMOVE ERROR CLASS & MSG
    		$("#fg3").removeClass("has-error has-feedback");
        	$("#sp3").removeClass("glyphicon glyphicon-remove form-control-feedback");
        	$("#sp_err3").removeClass("help-block help-block_style").text("");
    	}
    	//ADD OK CLASS
    	$("#fg3").addClass("has-success has-feedback");
    	$("#sp3").addClass("glyphicon glyphicon-ok form-control-feedback");
    	form_submit = true;
    }
    
    /*=======================birth_date===============================*/
    var year = birth_date.split("-"); //year[0] = form year
    var currentTime = new Date();
    var currentYear = currentTime.getFullYear();
	//IF birth_date EMPTY:
    if (birth_date==null || birth_date=='') { 
	    	$("#sp_err4").addClass("help-block help-block_style").text("הזן תאריך לידה.");
	    	
	    	if (!$("#fg4").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
	    		$("#fg4").addClass("has-error has-feedback");
	        	$("#sp4").addClass("glyphicon glyphicon-remove form-control-feedback");
	    	}
	    	form_submit = false;
    }
    //IF birth_date NOT BIRTHDATE
    else if (!birthDate(birth_date)) { 
	    	$("#sp_err4").addClass("help-block help-block_style").text("תאריך לידה לא תקין. (yyyy-mm-dd)");
	    	
	    	if (!$("#fg4").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
	    		$("#fg4").addClass("has-error has-feedback");
	        	$("#sp4").addClass("glyphicon glyphicon-remove form-control-feedback");
	    	}
	    	form_submit = false;
    }
    //IF formYear < 1900 && formYear > currentYear
    else if (year[0] < 1900 || year[0] > currentYear) { 
	    	$("#sp_err4").addClass("help-block help-block_style").text('הזן שנת לידת בטווח 1900-' + currentYear + '.');
	    	
	    	if (!$("#fg4").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
	    		$("#fg4").addClass("has-error has-feedback");
	        	$("#sp4").addClass("glyphicon glyphicon-remove form-control-feedback");
	    	}
	    	form_submit = false;
    }
	//GREEN MSG
    else {
	    	if ($("#fg4").hasClass("has-error")) { //REMOVE ERROR CLASS & MSG
	    		$("#fg4").removeClass("has-error has-feedback");
	        	$("#sp4").removeClass("glyphicon glyphicon-remove form-control-feedback");
	        	$("#sp_err4").removeClass("help-block help-block_style").text("");
	    	}
	    	//ADD OK CLASS
	    	$("#fg4").addClass("has-success has-feedback");
	    	$("#sp4").addClass("glyphicon glyphicon-ok form-control-feedback");
    }
    
    /*=======================email===============================*/
	//IF email EMPTY:
    if (email==null || email=='') { 
	    	$("#sp_err5").addClass("help-block help-block_style").text("הזן דואר אלקטרוני.");
	    	
	    	if (!$("#fg5").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
	    		$("#fg5").addClass("has-error has-feedback");
	        	$("#sp5").addClass("glyphicon glyphicon-remove form-control-feedback");
	    	}
	    	form_submit = false;
    }
    //IF email NOT VALID
    else if (!checkEmail(email)) { 
	    	$("#sp_err5").addClass("help-block help-block_style").text("הזן כתובת דואר אלקטרוני תקינה. example@mail.com");
	    	
	    	if (!$("#fg5").hasClass("has-error")) { //*IF THERE ISNT ERROR TAG
	    		$("#fg5").addClass("has-error has-feedback");
	        	$("#sp5").addClass("glyphicon glyphicon-remove form-control-feedback");
	    	}
	    	form_submit = false;
    }
    else {
    	if ($("#fg5").hasClass("has-error")) { //REMOVE ERROR CLASS & MSG
    		$("#fg5").removeClass("has-error has-feedback");
        	$("#sp5").removeClass("glyphicon glyphicon-remove form-control-feedback");
        	$("#sp_err5").removeClass("help-block help-block_style").text("");
    	}
    	//ADD OK CLASS
    	$("#fg5").addClass("has-success has-feedback");
    	$("#sp5").addClass("glyphicon glyphicon-ok form-control-feedback");
    }
    
    if(form_submit == false) {
    	$("#modal_bottom_div").css("margin-bottom","40px");
    }
	return form_submit;
}

/*****************************SHOW WRONG DETAILS MSG********************************/
//IF DETAILS ARE INCORRECT
$(document).ready(function() {
  if (wrong_details == true) {
	  //APPLY STYLE TO FIELDS
	  $("#fg3").addClass("has-error has-feedback");
  	  $("#sp3").addClass("glyphicon glyphicon-remove form-control-feedback");
  	  $("#fg4").addClass("has-error has-feedback");
	  $("#sp4").addClass("glyphicon glyphicon-remove form-control-feedback");
	  $("#fg5").addClass("has-error has-feedback");
  	  $("#sp5").addClass("glyphicon glyphicon-remove form-control-feedback");
  	  
	  //MSG
	  $("#wrong_details_error").html(function(i,origText) {
          return origText + "<img src='style/symbols/validate/error.png' alt='error_icon' class='error_icon'>"
              + " אחד הפרטים שהוזנו אינם נכונים.<br>";
      });
	  $("#wrong_details_error").css("margin-top", "5px");
	  
	  $('#modal_forgot_password').modal('show');
  }
});