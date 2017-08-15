<%-- 
    Document   : editDesignation
    Created on : May 5, 2016, 1:47:53 PM
    Author     : Boc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblTransactiontype" %>
<!DOCTYPE html>
<html>
       
    <% TblTransactiontype acc = (TblTransactiontype) request.getAttribute("searchResult");
   

        if (acc != null) {

    %>

<style>
     .form_errorMsg{
color: red;
    display: none;
}
.custom {width: 50px !important;}
 </style>
    
    <form id="togglingForm" name="editTransactiontype" onsubmit="return formValidation()"  class="form-horizontal" style="width:800px" method="post" action="TransactionTypeUpdateController">

        <!-- Form Name -->
        <legend><h4 style="text-align: left;"><b>EDIT TRANSACTION TYPE</b></h4></legend>
        
        <br>
         
        
        <div class="form-group" hidden="true">
            <label class="col-md-4 control-label"  style="text-align:left">ID</label> 
                <div class="col-lg-4">
                    <input id="id" name="id" type="text" readonly="true" value="<% out.println(acc.getTransactionTypeId()); %>"  class="form-control input-sm">
                </div>
         </div>
                 
        
          
                
                <div class="form-group"  >
            <label class="col-md-4 control-label"  style="text-align:left">Description</label> 
                <div class="col-lg-4">
                    <input id="description" name="description" value="<% out.println(acc.getTransactionDescription()); %>" type="text"  class="form-control input-sm" >
                </div>
                <span class="col-md-4 form_errorMsg" id="msg1"><code>Invalid description</code></span>
        </div>
                  

  <div class="btn">
                       <div class="col-md-5">
                       <div style="padding-left:0px">
                           
                          <input id="submit" type="submit" class="btn btn-primary btn-xs" value="Update"/>
                            &nbsp;
                             <a href="Transaction_Type_ManagePage.jsp"   class="btn btn-primary btn-xs">Back</a>
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

var description = document.editFundtype.description;


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
    
<h3 style="margin-bottom: -48px; margin-left: -190px;">
<code>
        <%out.println(request.getAttribute("errorMessage"));%>
</code>        
</h3>

<%        
 }

%>    
    
    
    
    
    
    
    
    
    
    
    
    
</html>


