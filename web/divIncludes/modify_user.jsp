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
        TblUser acc = (TblUser) request.getAttribute("searchResult");
       TblDesignations ac = (TblDesignations) request.getAttribute("searchResult1");
            if ((acc != null)&&(ac != null)) {
    %>

    <form  class="form-horizontal" method="post" action="userUpdateController" name="userUpdate1" onsubmit="return formValidation()">

        <!-- Form Name -->
        <legend><h4 style="text-align: left;"><b>EDIT DATA</b></h4></legend>
 
        <div class="form-group">
            <label class="col-md-3 control-label"  style="text-align:left;  font-size:12px; color: black">PF NUMBER</label> 
                <div class="col-md-3">
                    <input id="pfNo" name="pfNo" type="text" value="<% out.println(acc.getPfNo()); %>" readonly="true" class="form-control input-sm" >
                </div>
        </div>
                
           <div class="form-group">
            <label class="col-md-3 control-label"  style="text-align:left;  font-size:12px; color: black">USERNAME</label> 
                <div class="col-md-3">
                    <input id="userName" name="userName" value="<% out.println(acc.getUserName()); %>" type="text" readonly="true" class="form-control input-sm" style="padding-left:10px">
                </div>
        </div>       
         
          <div class="form-group">
                            <label class="col-md-3 control-label"  style="text-align:left;  font-size:12px; color: black">SALUTATION</label>
                            <div class="col-md-3">
                                <select class="form-control input-sm" value="<% out.println(acc.getSalutations()); %>" id="salutations" name="salutations">
                                    <option><% out.println(acc.getSalutations()); %></option>
                                    <option>Miss</option>
                                    <option>Ms</option>
                                    <option>Mr</option>
                                    <option>Mrs</option>
                                </select>

                            </div>
                        </div>        
        <div class="form-group">
            <label class="col-md-3 control-label" for="User Name"  style="text-align:left;  font-size:12px; color: black">FIRST NAME</label> 
                <div class="col-md-3">
                    <input id="firstName" name="firstName" required="" value="<% out.println(acc.getFirstName()); %>" type="text"  class="form-control input-sm" style="padding-left:10px">
                </div>
<!--                <span class="col-md-3 form_errorMsg" id="msg3">First Name is not valid !</span>-->
        </div>
                        <div class="form-group">
            <label class="col-md-3 control-label"  style="text-align:left;  font-size:12px; color: black">LAST NAME</label> 
                <div class="col-md-3">
                    <input id="lastName" required="" name="lastName" value="<% out.println(acc.getLastName()); %>" type="text"  class="form-control input-sm" style="padding-left:10px">
                </div>
<!--                <span class="col-md-3 form_errorMsg" id="msg4">Last Name is not valid !</span>-->
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label"  style="text-align:left;  font-size:12px; color: black">GENDER</label>
            <div class="col-md-3">
            <select class="form-control input-sm"  value=" <% out.println(acc.getGender()); %>" id="gender" name="gender">
                  <option> <% out.println(acc.getGender()); %></option>
                <option>Male</option>
                    <option>Female</option>
            </select>
            </div>
        </div>
        <!-- Text input-->
     <div class="form-group">
                            <label class="col-md-3 control-label"  style="text-align:left;  font-size:12px; color: black">DESIGNATION</label>
                            <div class="col-md-3">
                                <select class="form-control input-sm" id="designation" name="designation" >  
                                    <option value=<%=ac.getId() %>><% out.println(ac.getDescription()); %></option>
                                    <%
                                        DesignationService ds = new DesignationService();
                                        List listDesig = ds.listDesignations();  
                                        for (Iterator iterator = listDesig.iterator(); iterator.hasNext();) {
                                              TblDesignations as = (TblDesignations) iterator.next();  
                                                if(ac.getId()!=as.getId()){
                                    %>
                                        <option value=<%=as.getId() %>><%= as.getDescription()%></option> 
                                     <%  }}  %>
                                </select>

                            </div>
                        </div> 
     
        <!-- Text input-->
        <div class="form-group"  >
            <label class="col-md-3 control-label" for="status" style="text-align:left;  font-size:12px; color: black">STATUS</label> 
            <div class="col-md-3" >
                <select class="form-control input-sm" id="status" readonly="true" value=" <% out.println(acc.getStatus()); %>" name="status">
    <option><% out.println(acc.getStatus()); %></option>

</select>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="Office No" style="text-align:left;  font-size:12px; color: black">OFFICE NUMBER</label> 
            <div class="col-md-3">
                <input id="officeNo" required="" name="officeNo" value="<% out.println(acc.getOfficeNo()); %>" type="text" placeholder="Office No" class="form-control input-sm" >
            </div>
             <!--span class="col-md-3 form_errorMsg" id="msg5">Office No is not valid !</span-->
        </div>
                
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="Mobile No" style="text-align:left;  font-size:12px; color: black">MOBILE NUMBER</label> 
            <div class="col-md-3">
                <input id="mobileNo" required="" name="mobileNo" type="text" value="<% out.println(acc.getMobileNo()); %>" placeholder="Mobile No" class="form-control input-sm" >
            </div>
<!--            <span class="col-md-3 form_errorMsg" id="msg6">Mobile No is not valid !</span>-->
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="inputEmail" style="text-align:left;  font-size:12px; color: black">EMAIL</label> 
            <div class="col-md-3">
                <input id="email" name="email" required="" type="email" placeholder="email" value="<% out.println(acc.getEmail()); %>" class="form-control input-sm" >
            </div>
<!--            <span class="col-md-3 form_errorMsg" id="msg7">Email is not valid !</span>-->
        </div>
            
             <div class="form-group">
                        <div class="col-md-7">
                        <div style="padding-left:150px;">
                            
                             
                               <input id="submit" type="submit" class="btn btn-primary btn-sm" value="UPDATE"/>&nbsp;
                               
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




