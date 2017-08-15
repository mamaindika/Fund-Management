<%@page import="service.UserService"%>
<%@page import="model.TblUser"%>
<style>.custom {width: 50px !important;}</style>


<!--<div class="panel panel-default">
<div class="panel-heading" style="background:#ADD8E6">
    <h3 class="panel-title" style="text-align:left">
        <b>Change Password</b>
</h3>
</div>
    <div class="panel-body" style="background:#99ccff">-->
        
<%@page import="service.userCredentialsService"%>
<%@page import="model.TblUsercredentials" %>


<legend><h4 style="text-align: left;"><b>CHANGE PASSWORD</b></h4></legend>
    <% 
        TblUser user = (TblUser) request.getAttribute("id");
        UserService as = new UserService();
        TblUser acc = as.searchUserAccount(user.getUserName());
        
      
            
    %>


<form name="changePassword" onsubmit="return pass()" style="width:800px" class="form-horizontal" method="post" action="SelfPasswordRestChangeController">

<!-- Password input-->
<div class="form-group" hidden="true">
<label class="col-md-4 control-label" style="text-align:left">PF Number</label>
<div class="col-lg-4">
    <input name="pfNum" type="text" value="<%=acc.getPfNo()%>"  class="form-control input-sm">

</div>
</div>

<!-- Password input-->
<div class="form-group">
<label class="col-md-4 control-label" style="text-align:left; font-size:12px; color: black">USERNAME</label>
<div class="col-lg-4">
    <input  name="userId" readonly="true" type="text" value="<%=acc.getUserName()%>" class="form-control input-sm">

</div>
</div>

<!-- Confirm Password input-->
<div class="form-group">
<label class="col-md-4 control-label" style="text-align:left; font-size:12px; color: black">CURRENT PASSWORD</label>
<div class="col-lg-4">
    <input name="password" type="password" required=""  class="form-control input-sm">

</div>
</div>

<!-- Button -->
 <div class="btn">
                       <div class="col-md-5">
                       <div style="padding-left:0px">
                           
                          
                            <input id="Save" name="action" type="submit" class="btn btn-primary btn-sm" value="RESET PASSWORD"/> 
                           
                                   </div>
                       </div>
</div> 


       </form>	
    
  <%
    if(null!=request.getAttribute("errorMessage"))
{%>
    
<h3 style="margin-top: -78px; margin-right: 350px; font-size: 15px">
<code>
        <%out.println(request.getAttribute("errorMessage"));%>
</code>        
</h3>

<%        
 }

%>   
    
    
    </div>
</div>


