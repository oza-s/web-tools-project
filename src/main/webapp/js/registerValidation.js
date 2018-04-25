function submitForm(object)
{
	console.log("Inside javascript" + object);
	var form = document.getElementById("registrationForm");
	var firstName = document.getElementById("fname").value;
	var lastName = document.getElementById("lname").value;
	var emailId = document.getElementById("emailId").value;
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var phoneNo = document.getElementById("phoneNo").value;
	
	var regexObject = new RegexValidation(firstName,lastName,emailId,username,password,phoneNo);
	console.log("Before");
	var isSuccessFirstName = regexObject.validateNames(firstName);
	var isSuccessLastName = regexObject.validateNames(lastName);
	var isSuccessPhoneNo = regexObject.validateNumber(phoneNo);
	var isSuccessEmail = regexObject.emailValidation(emailId);
	var isSuccessPassword = regexObject.passwordValidation(password);

	console.log("End");
	if(!isSuccessFirstName)
	{
		alert("Not more than 20 characters and No numbers allowed!!!");
		document.getElementById("fname").focus();
		return;
	}
	
	if(!isSuccessLastName)
	{
		alert("Not more than 20 characters and No numbers allowed!!!");
		document.getElementById("lname").focus();
		return;
	}
	
	if(!isSuccessPhoneNo)
	{
		alert("Not more than 10 numbers allowed !!!");
		document.getElementById("phoneNo").focus();
		return;
	}
	
	if(!isSuccessEmail)
	{
		alert("Not a valid e-mail address");
		document.getElementById("emailId").focus();
		return;
	}
	if(!isSuccessPassword)
	{
		alert("Not a valid password!! Password must contain at least one number, one lowercase and one uppercase letter ,at least six characters that are letters, numbers or the underscore");
		document.getElementById("password").focus();
		return;
	}
	else if(isSuccessFirstName && isSuccessLastName && isSuccessPhoneNo && isSuccessEmail && isSuccessPassword)
	{
		console.log("Inside true");
		alert(JSON.stringify(regexObject));
		/*$.ajax(
				{
	            type: 'post' , // method attribute of form
	            url: 'add.htm',  // action attribute of form
	            dataType : 'json',
	            contentType: 'application/json',
	            mimeType: 'application/json',
		    // convert form data to json format
	            data : JSON.stringify(regexObject),
         });*/
		return true;
	}
	
	function RegexValidation(firstName,lastName,emailId,username,password,phoneNo)
	{
		this.firstName = firstName;
		this.lastName = lastName;
		this.emailId = emailId;
		this.username = username;
		this.password = password;
		this.phoneNo = phoneNo;	
		
		this.validateNames = function(names)
		{
			console.log("Name is: " + names);
			var hasNumber = /\d/;
			if(names.length > 20 || hasNumber.test(names) || names.length == 0 )
			{	
				return false;
			}
			else
			{
				return true;
			}
		}
		
		this.validateNumber = function(number)
		{
			console.log("Number is: "  + number);
			var hasAlphabet = /[^0-9]/;
			var alphaLength = number.match(hasAlphabet);
			if(number.length > 10 || number.length == 0)
			{	
				return false;
			}
			else{
				return true;
			}
		}
		
		this.emailValidation = function(emailId)
		{
			console.log("Email id: " + emailId);
		    var atpos = emailId.indexOf("@");
		    var dotpos = emailId.lastIndexOf(".");
		    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=emailId.length || emailId.length == 0) 
		    {
		        return false;
		    }
			else
			{
				return true;
			}
		}
		
		this.passwordValidation = function(password)
		{
			console.log("Password is: " + password);
			// at least one number, one lowercase and one uppercase letter
		    // at least six characters that are letters, numbers or the underscore
			//https://www.thepolyglotdeveloper.com/2015/05/use-regex-to-test-password-strength-in-javascript/
			var strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,})");
		    if(password.length == 0)
		    	{
		    		return false;
		    	}
		    else
		    {
		    	console("Password test: " + strongRegex.test(password));
		    	return strongRegex.test(password);
		    }
		    
		}
	}
}
