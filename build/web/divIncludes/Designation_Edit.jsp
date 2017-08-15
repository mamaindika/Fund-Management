<%-- 
    Document   : editDesignation
    Created on : May 5, 2016, 1:47:53 PM
    Author     : Boc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblDesignations" %>
<!DOCTYPE html>
<html>
    
    
    

    <div> 
      <style>.custom {width: 50px !important;}</style>
    <% TblDesignations acc = (TblDesignations) request.getAttribute("searchResult");
           if (acc != null) {
    %>
<style>
    .form_errorMsg{
    color: red;
    display: none;
}
    .custom {width: 50px !important;}
</style>
<legend><h4 style="text-align: left;"><b>EDIT DESIGNATION</b></h4></legend>
<br>
<form id="togglingForm" name="editDesignation" onsubmit="return formValidation()" style="width:800px;"  class="form-horizontal" style="width:800px" method="post" action="designationUpdateController">

        <!-- Form Name -->
        
    
        
        <div class="form-group" hidden="true">
            <label class="col-md-4 control-label"  style="text-align:left">ID</label> 
                <div class="col-lg-4">
                    <input id="id" name="id" type="text" readonly="true" value="<% out.println(acc.getId()); %>"  class="form-control input-sm">
                </div>
         </div>
                
                
                
                
                <div class="form-group"  >
            <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">DESCRIPTION</label> 
                <div class="col-lg-4">
                    <input id="description" required="true" name="description" value="<% out.println(acc.getDescription()); %>" type="text"  class="form-control input-sm" >
                </div>
<!--                <span class="col-md-4 form_errorMsg" id="msg1"><code>Invalid description</code></span>-->
        </div>
    
 

  <div class="btn">
                       <div class="col-md-3">
                       <div style="margin-left: -140px;">
                           
                          <input id="submit" type="submit" class="btn btn-primary btn-sm" value="UPDATE"/>
                            &nbsp;
                             <a href="Designation_ManagePage.jsp"   class="btn btn-primary btn-sm">BACK</a>
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
function formValidation(){
var description = document.editDesignation.description;
if(allLetter1(description)){
	return true;
	}
	else{
    return false;
	}
} 
function allLetter1(description)
{
    var letters = /^[A-Za-z\u0080-\u00FF\d\s\€]+$/;
    if(description.value.match(letters))
    {
	$('#msg1').css("display", "none");
        return true;
    }
    else
    {
	 $('#msg1').css("display", "block");
        //alert('Description must have alphabet characters only');
        description.focus();
        return false;
    }
}
</script>                  
                     
</form>
                

    <%  }else{  %>
        Invalid Designation
    <%  }  %>
  
 <%
    if(null!=request.getAttribute("errorMessage"))
{%>
    
<h3 style="margin-bottom: -48px; margin-left: -350px; font-size: 15px">
<code>
        <%out.println(request.getAttribute("errorMessage"));%>
</code>        
</h3>

<%        
 }

%>
</html>


