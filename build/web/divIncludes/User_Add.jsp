<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblUser" %>
<%@page import="model.TblDesignations" %>
<%@page import="service.UserService" %>
<%@page import="service.DesignationService"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<html>

  		<style>
.form_errorMsg{ 
    color: red;
    display: none;
}
.custom {width: 50px !important;}
                </style>
                
<!--     <style>.custom {width: 50px !important;}</style>-->
     <form   method="post" name="addUser" action="userAddController" onsubmit="return formValidation()" class="form-horizontal" style="text-align: center;">
 
    <legend><h4 style="text-align: left;"><b>ADD NEW USER</b></h4></legend>

                       <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">PF NUMBER</label> 
                            <div class="col-md-3">
                                <input id="pfNo" name="pfNo" type="text" value="" class="form-control input-sm">
<!--                                <span class="form_errorMsg" id="msg1">PF NoT Valid!</span>-->
                            </div>
                            <span class="col-md-2 form_errorMsg" id="msg1"><code>PF No is not valid </code></span>
                        </div>

                        
                        <div class="form-group">
                               <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">USERNAME</label> 
                            <div class="col-md-3">
                                <input id="userName" name="userName" value="" type="text" readonly="true" class="form-control input-sm" style="padding-left:10px"> 
                            </div>
                               <span class="col-md-2 form_errorMsg" id="msg2"><code>Username in not valid </code></span>
                        </div>
                                               <script>
                        
$(document).ready(function() { 
   $('#pfNo').change(function() {
      $('#userName').val("PF"+$('#pfNo').val());
    });
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
    var pfNo = document.addUser.pfNo;
    var userName = document.addUser.userName;
    var salutations=document.addUser.salutations;
    var firstName = document.addUser.firstName;
    var lastName = document.addUser.lastName;
    var gender=document.addUser.gender; 
    var designation=document.addUser.designation; 
    var status=document.addUser.status;
    var officeNo = document.addUser.officeNo;
    var mobileNo = document.addUser.mobileNo;
    var email = document.addUser.email;
    
	if(allLetter3(pfNo) && allLetter(userName) && validateSelect1(salutations) && allLetter1(firstName) && allLetter2(lastName) && validateSelect2(gender)&&  validateSelect3(designation) && allnumeric(officeNo) && allnumeric1(mobileNo) && ValidateEmail(email)  ){
	return true;
	}
	else{
    return false;
	}
    
} 
function allLetter(uname)
{
    var letters = /^[A-Za-z\u0080-\u00FF\d\s\€]+$/;
    if(uname.value.match(letters))
    {
		$('#msg2').css("display", "none");
        return true;
    }
    else
    {
		$('#msg2').css("display", "block");
        //alert('Username must have alphabet characters only');
        uname.focus();
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
function allLetter3(uname)
{
    var letters = /^[A-Za-z\u0080-\u00FF\d\s\€]+$/;
    if(uname.value.match(letters))
    {
		$('#msg1').css("display", "none");
        return true;
    }
    else
    {
	 $('#msg1').css("display", "block");
        //alert('Username must have alphabet characters only');
        uname.focus();
        return false;
    }
}
function alphanumeric(uadd)
{

    var letters = /^[0-9a-zA-Z]+$[€]/;
    if(uadd.value.match(letters))
    {
		$('#msg1').css("display", "none");
        return true;
    }
    else
    {
	 $('#msg1').css("display", "block");
	// $('#msg1').text("wrong input");
        //alert('User address must have alphanumeric characters only');
        uadd.focus();
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

function validateSelect1(salutations)  
{  
    //var numbers = /^[1-4]+$/;
    if(salutations.value.match(-1))  
    {   
	$('#msg8').css("display", "block");
        salutations.focus();  
        return false; 
         
                
    }  
    else  
    {  
        $('#msg8').css("display", "none");
        return true;    
    }  
} 

function validateSelect2(gender)  
{  
    //var numbers = /^[1-4]+$/;
    if(gender.value.match(-1))  
    {   
	$('#msg9').css("display", "block");
        gender.focus();  
        return false; 
         
                
    }  
    else  
    {  
        $('#msg9').css("display", "none");
        return true;    
    }  
} 

function validateSelect3(designation)  
{  
    //var numbers = /^[1-4]+$/;
    if(designation.value.match(-1))  
    {   
	$('#msg10').css("display", "block");
        designation.focus();  
        return false; 
         
                
    }  
    else  
    {  
        $('#msg10').css("display", "none");
        return true;    
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
                          <div class="form-group">
                            <label class="col-md-2 control-label" style="text-align:left; font-size:12px; color: black">SALUTATION</label>
                            <div class="col-md-3">

                                
                                <select class="form-control input-sm" id="salutations" name="salutations"  >  
                                    <option value="-1">SELECT</option>
                                    <option >Miss</option>
                                    <option >Ms</option>
                                    <option >Mr</option>
                                    <option >Mrs</option>

                                </select>
                            </div>
                            <span class="col-md-3 form_errorMsg" id="msg8"><code>Please select your Salutation </code></span>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">FIRST NAME</label> 
                            <div class="col-md-3">
                                <input id="firstName" name="firstName" value="" type="text"  class="form-control input-sm" style="padding-left:10px"> 
                             </div>
                            <span class="col-md-3 form_errorMsg" id="msg3"><code>First name is not valid </code></span>
                        </div>
                        
                        <div class="form-group">
                                 <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">LAST NAME</label> 
                            <div class="col-md-3">
                                <input id="lastName" name="lastName" value="" type="text"  class="form-control input-sm" style="padding-left:10px">   
                             </div>
                                 <span class="col-md-3 form_errorMsg" id="msg4"><code>Last name is not valid </code></span>
                        </div>
  <div class="form-group">
                            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">GENDER</label>
                            <div class="col-md-3">
                                <select class="form-control input-sm" id="gender" name="gender">
                                    <option value="-1">SELECT</option>
                                    <option>Male</option>
                                    <option>Female</option>  
                                </select>
                            </div>
                            <span class="col-md-3 form_errorMsg" id="msg9"><code>Please select your Gender </code></span>
                        </div>
                  
          <div class="form-group">
                            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">DESIGNATION</label>
                            <div class="col-md-3">
                                
                                <select class="form-control input-sm" id="designation" name="designation" >  
                                    <option value="-1">SELECT</option>
                                    <%
                                        DesignationService ds = new DesignationService();
                                        List listDesig = ds.listDesignations();
                                        //userService ds = new userService();
                                        //List users = ds.listDesignations();
                  
                                        for (Iterator iterator = listDesig.iterator(); iterator.hasNext();) {
                                              TblDesignations as = (TblDesignations) iterator.next();
                                              request.setAttribute("designation",as);
                                    %>
                                        <option value=<%=as.getId() %>><%= as.getDescription()%></option> 
                                      
                                    
                                     <%  }  %>
                                </select>

                            </div>
                                <span class="col-md-3 form_errorMsg" id="msg10"><code>Please select your Designation </code></span>
                        </div> 
               
                     
                        <div class="form-group">
                            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">STATUS</label> 
                            <div class="col-md-3">
                                <select class="form-control input-sm" id="status" name="status" readonly="true">
                                    <option>Active</option>
                                    <option>Deceased</option>
                                    <option>In-Active </option>
                                </select>
                              
                            </div>
                            <span class="col-md-3 form_errorMsg" id="msg11"><code>Please select your Status </code></span>
                        </div>
                                                    <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-2 control-label" style="text-align:left; font-size:12px; color: black">OFFICE NO</label> 
                            <div class="col-md-3">
                                <input id="officeNo" name="officeNo" value="" type="text"  class="form-control input-sm" >
                            </div>
                            <span class="col-md-3 form_errorMsg" id="msg5"><code>Office No is not valid </code></span>
                        </div>
                                                
                         <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">MOBILE NO</label> 
                            <div class="col-md-3">
                                <input id="mobileNo" name="mobileNo" type="text" value=""  class="form-control input-sm">		
                                  </div>
                            <span class="col-md-3 form_errorMsg" id="msg6"><code>Mobile No is not valid </code></span>
                            </div>
                      

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">EMAIL</label> 
                            <div class="col-md-3">
                                <input id="email" name="email" type="email"  value="" class="form-control input-sm">
                              </div>
                            <span class="col-md-3 form_errorMsg" id="msg7"><code>Email is not valid</code> </span>
                        </div>
                    
                        
                            <!-- Button <input type="submit" class="btn btn-sm btn-primary" value="Save"/>
                    -->
                        <div class="form-group">
                        <div class="col-md-5">
                        <div style="padding-left:150px;">
                           
                        
                            

                        <input id="submit" type="submit" class="btn btn-primary btn-sm " value="SAVE"/> &nbsp;
                        <a href="User_AddPage.jsp"  class="btn btn-primary btn-sm ">CLEAR</a> &nbsp;
                        <a href="User_ManagePage.jsp"  class="btn btn-primary btn-sm ">BACK</a>

                  </div>
                        </div>
                        </div> 
                    </form>

<       
          
</html>