<%@page import="model.TblUsercredentials"%>
<%@page import="service.userCredentialsService"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblUser" %>
<%@page import="model.TblDesignations" %>
<%@page import="service.UserService" %>
<%@page import="service.DesignationService" %>
<!DOCTYPE html>
<html>
<style>
.form_errorMsg{
    color: red;
    display: none;
}
.custom {width: 50px !important;}
</style>
    
    <% 
        String userName = request.getParameter("id");
        UserService as = new UserService();
        TblUser acc = as.searchUserAccount(userName);
        
        DesignationService ac = new DesignationService();
        int Id = acc.getTblDesignations().getId();
        TblDesignations uss = ac.searchDesignationsID(Id);
        
        userCredentialsService ucs = new userCredentialsService();
        TblUsercredentials us = ucs.searchUserCredentials(userName);
     
//        if((usr != null)&&(us != null)&&(uss !=null)){
        if((acc != null)&&(us != null)){
            
    %>

    <form  class="form-horizontal"  onsubmit="return confirm('Do you really want to delete the User ?');" method="post" action="userDeleteController" name="userUpdate1" onsubmit="return formValidation()">

        <!-- Form Name -->
        <legend><h4 style="text-align: left;"><b>DELETE USER</b></h4></legend>
   
        <div class="form-group">
            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black" >PF NUMBER</label> 
                <div class="col-md-3">
                    <input id="pfNo" name="pfNo" type="text" value="<% out.println(acc.getPfNo()); %>" readonly="true" class="form-control input-sm" >
                </div>
        </div>
                
           <div class="form-group">
            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black" >USERNAME</label> 
                <div class="col-md-3">
                    <input id="userName"  name="userName" value="<% out.println(acc.getUserName()); %>" type="text" readonly="true" class="form-control input-sm" style="padding-left:10px">
                </div>
        </div>       
         
          <div class="form-group">
                            <label class="col-md-2 control-label"  style="text-align:left">Salutations</label>
                            <div class="col-md-3">
                                <select class="form-control input-sm" readonly="true" value="<% out.println(acc.getSalutations()); %>" id="salutations" name="salutations">
                                    <option><% out.println(acc.getSalutations()); %></option>
                         
                                </select>

                            </div>
                        </div>        
        <div class="form-group">
            <label class="col-md-2 control-label" for="User Name"  style="text-align:left; font-size:12px; color: black" >FIRST NAME</label> 
                <div class="col-md-3">
                    <input readonly="true" id="firstName" name="firstName" value="<% out.println(acc.getFirstName()); %>" type="text"  class="form-control input-sm" style="padding-left:10px">
                </div>
                <span class="col-md-3 form_errorMsg" id="msg3">First Name is not valid !</span>
        </div>
                        <div class="form-group">
            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black" >LAST NAME</label> 
                <div class="col-md-3">
                    <input id="lastName" readonly="true" name="lastName" value="<% out.println(acc.getLastName()); %>" type="text"  class="form-control input-sm" style="padding-left:10px">
                </div>
                <span class="col-md-3 form_errorMsg" id="msg4">Last Name is not valid !</span>
        </div>

        <div class="form-group">
            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black" >GENDER</label>
            <div class="col-md-3">
            <select class="form-control input-sm" readonly="true"  value=" <% out.println(acc.getGender()); %>" id="gender" name="gender">
                  <option> <% out.println(acc.getGender()); %></option>
               
            </select>
            </div>
        </div>
        <!-- Text input-->
     <div class="form-group">
                            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black" >DESIGNATION</label>
                            <div class="col-md-3">
                                <select class="form-control input-sm" readonly="true" id="designation" name="designation" >  
                                    <option value=<%=uss.getId() %>><% out.println(uss.getDescription()); %></option>
        
                                </select>

                            </div>
                        </div> 
     
        <!-- Text input-->
        <div class="form-group" >
            <label class="col-md-2 control-label" for="status" style="text-align:left; font-size:12px; color: black" >STATUS</label> 
            <div class="col-md-3" >
                <input readonly="true" class="form-control input-sm" id="status"  value="<% out.println(acc.getStatus()); %>" name="status">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="Office No" style="text-align:left; font-size:12px; color: black" >OFFICE NO</label> 
            <div class="col-md-3">
                <input id="officeNo" readonly="true" name="officeNo" value="<% out.println(acc.getOfficeNo()); %>" type="text" placeholder="Office No" class="form-control input-sm" >
            </div>
             <span class="col-md-3 form_errorMsg" id="msg5">Office No is not valid !</span>
        </div>
                
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="Mobile No" style="text-align:left; font-size:12px; color: black" >MOBILE NO</label> 
            <div class="col-md-3">
                <input id="mobileNo" readonly="true" name="mobileNo" type="text" value="<% out.println(acc.getMobileNo()); %>" placeholder="Mobile No" class="form-control input-sm" >
            </div>
            <span class="col-md-3 form_errorMsg" id="msg6">Mobile No is not valid !</span>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="inputEmail" style="text-align:left; font-size:12px; color: black" >EMAIL</label> 
            <div class="col-md-3">
                <input id="email" name="email" readonly="true" type="email" placeholder="email" value="<% out.println(acc.getEmail()); %>" class="form-control input-sm" >
            </div>
            <span class="col-md-3 form_errorMsg" id="msg7">Email is not valid !</span>
        </div>
            
             <div class="form-group">
                        <div class="col-md-5">
                        <div style="padding-left:150px;">
                            
                             
                               <input id="submit" type="submit" class="btn btn-primary btn-sm" value="DELETE"/>&nbsp;
                               <a href="User_ManagePage.jsp"  class="btn btn-primary btn-sm">BACK</a>
                               
    </div>
                        </div>
                        </div>
            
              <script>
            $(document).ready(function() { 

 $("#submit").click(
            function () {
			
			if(formValidation()){
			
			}
              
            }            
        );

	
});
	
	
	function formValidation()
{
  //alert("The paragraph was clicked.");
    var firstName = document.userUpdate1.firstName;
    var lastName = document.userUpdate1.lastName;
    var officeNo = document.userUpdate1.officeNo;
    var mobileNo = document.userUpdate1.mobileNo;
    var email = document.userUpdate1.email;
    
	if(allLetter1(firstName) && allLetter2(lastName) && allnumeric(officeNo) && allnumeric1(mobileNo) && ValidateEmail(email)  ){
	return true;
	}
	else{
    return false;
	}
    
} 

function allLetter1(uname)
{
    var letters = /^[A-Za-z\u0080-\u00FF\d\s\€]+$/;
    if(uname.value.match(letters))
    {
	$('#msg3').css("display", "none");
        return true;
    }
    else
    {
	 $('#msg3').css("display", "block");
        //alert('Username must have alphabet characters only');
        uname.focus();
        return false;
    }
}
function allLetter2(uname)
{
    var letters = /^[A-Za-z\u0080-\u00FF\d\s\€]+$/;
    if(uname.value.match(letters))
    {
	    $('#msg4').css("display", "none");
        return true;
    }
    else
    {
	 $('#msg4').css("display", "block");
        //alert('Username must have alphabet characters only');
        uname.focus();
        return false;
    }
}

function allnumeric(uzip)
{
    var numbers = /^\d{10}$/;
    if(uzip.value.match(numbers))  
    {   $('#msg5').css("display", "none");
        return true;  
    }  
    else  
    {  
	 $('#msg5').css("display", "block");
        //alert('ZIP code must have numeric characters only');  
        uzip.focus();  
        return false;  
    }  
} 

function allnumeric1(uzip)
{
    var numbers = /^\d{10}$/;
    if(uzip.value.match(numbers))  
    {  
		$('#msg6').css("display", "none");
        return true;  
    }  
    else  
    {  
	 $('#msg6').css("display", "block");
        //alert('ZIP code must have numeric characters only');  
        uzip.focus();  
        return false;  
    }  
}  
function ValidateEmail(uemail)  
{  
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
    if(uemail.value.match(mailformat))  
    {   
		$('#msg7').css("display", "none");
        return true;  
    }  
    else  
    {  
	     $('#msg7').css("display", "block");
        //alert("You have entered an invalid email address!");  
        uemail.focus();  
        return false;  
    }  
} 


</script>
            
          </form>

    <%  }else{  %>
        Invalid PF Number
    <%  }  %>
</html>




