<%-- 
    Document   : editMasterAccounts
    Created on : May 11, 2016, 10:59:40 AM
    Author     : Boc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblMasteraccounts" %>

<!DOCTYPE html>
<html>
   
<style>
.form_errorMsg{
    color: red;
    display: none;
}
.custom {width: 50px !important;}
</style>
<% TblMasteraccounts acc = (TblMasteraccounts) request.getAttribute("searchResult");
if (acc != null) {
%>

    <form id="togglingForm" name="editMasterAccounts" onsubmit="return formValidation()" class="form-horizontal" style="width:1000px;" method="post" action="updateMasterAccountsController">

        <!-- Form Name -->
        <legend><h4 style="text-align: left;"><b>EDIT MASTER ACCOUNT</b></h4></legend>

        
                <div class="form-group">
                    <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">ACCOUNT NO</label> 
                <div class="col-md-3">
                    <input id="accountNo" name="accountNo" required="true" type="text" readonly="true"  value="<% out.println(acc.getAccountNo()); %>"  class="form-control input-sm">
                </div>
                </div>
                
                <div class="form-group">
                    <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">ACCOUNT NAME</label> 
                <div class="col-md-3">
                    <input id="accountName" name="accountName" required="true" value="<% out.println(acc.getAccountName()); %>" type="text"  class="form-control input-sm" style="padding-left:10px">
                </div>
                
               </div>
                
                <div class="form-group">
                    <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">LEDGER NO</label> 
                <div class="col-md-3">
                    <input id="currentLedger" name="currentLedger" required="true" value="<% out.println(acc.getCurrentLedger()); %>" type="text"  class="form-control input-sm" style="padding-left:10px">
                </div>
                
               </div>
                
               <div class="form-group">
                     <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">ACCOUNT TYPE</label> 
                <div class="col-md-3">
                   <select class="form-control input-sm" id="typeOfAccount" required="true"   name="typeOfAccount">
                      <option><% out.println(acc.getTypeOfAccount()); %></option>
                       <option>Assets</option>
                       <option>Equity</option>
                       <option>Expenses</option>
                       <option>Income</option>
                       <option>Liabilities</option> 
                  </select>
                </div> 
               </div> 
                
                <div class="form-group">
                   <label class="col-md-3 control-label" for="status" style="text-align:left; font-size:12px; color: black">STATUS</label> 
                 <div class="col-md-3">
                   <select class="form-control input-sm" id="status" required="true" name="status">
                      <option><% out.println(acc.getStatus()); %> </option>
                      <option>Active</option>
                      <option>In-Active </option>
                   </select>
                 </div>
                </div>
    
             <div class="form-group">
                        <div class="col-md-9">
                        <div style="padding-left:0px;">
                             
                           
                            <input id="submit" type="submit" class="btn btn-primary btn-sm" value="UPDATE"/>
                            &nbsp;
                            <a href="MasterAccounts_ManagePage.jsp"  class="btn btn-primary btn-sm">BACK</a>
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

    var accountName = document.editMasterAccounts.accountName;
    var currentLedger=document.editMasterAccounts.currentLedger;


 
    
	if(allLetter(accountName) &&allLetter1(currentLedger) ){
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

</script>    
                      
          </form>

    <%  }else{  %>
        Invalid Fund Type
    <%  }  %>
</html>


