<%-- 
    Document   : masterAccounts
    Created on : May 11, 2016, 10:05:44 AM
    Author     : Boc
--%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.masterAccountsService"%>
<%@page import="model.TblMasteraccounts" %>
    <style>.custom {width: 50px !important;}</style>
        
<style> 

table.scroll {
    /* width: 100%; */ /* Optional */
    /* border-collapse: collapse; */
    border-spacing: 0;
    border: none;
}

table.scroll tbody,
table.scroll thead { display: block; }

thead tr th { 
    height: 30px;
    line-height: 30px;
    width: 145px;
    /* text-align: left; */
}

table.scroll tbody {
    height: 400px;
    width: 100%;
    overflow-y: auto;
    overflow-x: hidden;
}

tbody { border-top: none; }

tbody td, thead th {
    /* width: 20%; */ /* Optional */
    border-right: none;
    /* white-space: nowrap; */
}

tbody td:last-child, thead th:last-child {
    border-right: none;
}

tbody tr td{
    
    width: 150px;
    height: 40px;
}


</style>
 <div class="row" >
<div class="col-md-2">

<button class="btn btn-primary" style="margin-bottom: -70px" data-toggle="modal"  data-target="#myModal">
<span class="glyphicon glyphicon-plus-sign"></span> 
ADD MASTER ACCOUNTS DETAILS
</button> 
    
</div>
</div> 
<br><br><br><br>


     <table class="table scroll table-list-search" style="border: solid 2px #cccccc;">
       
            <thead  style="text-align:left">
                
                <tr>
                    
                    <th style="text-align:left; font-size:12px; color: black">ACCOUNT NO</th>
                    <th style="text-align:left; font-size:12px; color: black">ACCOUNT NAME</th>
                    <th colspan="4" style="text-align:left; font-size:12px; color: black">LEDGER NO</th>
                    <th style="text-align:left; font-size:12px; color: black">ACCOUNT TYPE</th>
                    <th style="text-align:left; font-size:12px; color: black">STATUS</th>
                    <th></th>
                </tr>
            </thead>
            <tbody style="text-align:left">
                <%
                    int fundtype= (Integer)request.getSession().getAttribute("loggedFundType");
                    masterAccountsService as = new masterAccountsService();
                    List users = as.listMasterAccountsByFund(fundtype);
                    for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                        TblMasteraccounts us = (TblMasteraccounts) iterator.next();
                %>
                <tr>
                    <td style="text-align:left; color: black"><%= us.getAccountNo()%></td>
                    <td style="text-align:left;  color: black"><%= us.getAccountName()%></td>
                    <td colspan="4" style="text-align:left; color: black"><%= us.getCurrentLedger()%></td>
                    <td  style="text-align:left;  color: black"><%= us.getTypeOfAccount()%></td>
                    <td style="text-align:left; color: black"><%= us.getStatus()%></td>
           
                    <td style="text-align: center">
                    <form name="editForm" action="editMasterAccountsController" method="post">
                    <input type="submit" value="Edit" name="editButton" class="btn btn-primary btn-xs custom" />
                    <input type="hidden" value="<%=us.getAccountNo() %>" name="searchValue" />
                   
                    <a href="deleteMasterAccountsPage.jsp?accountNo=<%=us.getAccountNo()%>" class="btn btn-primary btn-xs custom">Delete</a>
                       
                    </form>  
                    </td>
                    
                <%  }  %>
          
                
                
                </tr>
            </tbody>
        </table>

                
                
                
         
<div id="myModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<!-- Modal content-->
<div class="modal-content">
<div class="modal-body">

    
  
     
	<style>
.form_errorMsg{

    
    color: red;
    display: none;

   


}
.custom {width: 50px !important;}
                </style>

<form id="togglingForm"  method="post" name="addMasterAccounts" onsubmit="return formValidation()" action="addMasterAccountsController"  class="form-horizontal" style="width:800px">
<!-- Form Name -->
<legend style="width: 550px;"><h4 style="text-align: left;"><b>MASTER ACCOUNT DETAILS</b></h4> </legend>


<!-- Text input-->
<div class="form-group">
<label class="col-md-3 control-label" style="text-align:left; font-size:12px; color: black">ACCOUNT NO</label> 
<div class="col-md-3">
<input id="accountNo" name="accountNo" required="true" type="text" placeholder="" class="form-control input-sm" >

</div>
<!--<span class="col-md-3 form_errorMsg" id="msg1"><code>Invalid</code></span>-->
</div>

<!-- Text input-->
<div class="form-group">
<label class="col-md-3 control-label" style="text-align:left; font-size:12px; color: black">ACCOUNT NAME</label> 
<div class="col-md-3">
<input id="accountName" name="accountName" required="true" type="text" placeholder="" class="form-control input-sm" >

</div>
<!--<span class="col-md-3 form_errorMsg" id="msg2"><code>Invalid</code></span>-->
</div>

<!-- Text input-->
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">LEDGER NO</label> 
<div class="col-md-3">
<input id="CurrentLedger" name="currentLedger" required="true" type="text" placeholder="" class="form-control input-sm" >

</div>
<!--<span class="col-md-4 form_errorMsg" id="msg3"><code>Invalid</code></span>-->
</div>

<!-- select-->
<div class="form-group">
<label class="col-md-3 control-label" for="sel1" style="text-align:left; font-size:12px; color: black">ACCOUNT TYPE</label>
<div class="col-md-3">
<select class="form-control input-sm" id="sel1" required="true" name="typeOfAccount">
    <option value="">SELECT</option>
    <option>Assets</option>
    <option>Equity</option>
    <option>Expenses</option>
    <option>Income</option>
    <option>Liabilities</option>

  </select>
</div>
<span class="col-md-3 form_errorMsg" id="msg4"><code>Invalid</code></span>
</div>

<!-- select-->
<div class="form-group">
<label class="col-md-3 control-label" for="sel1" style="text-align:left; font-size:12px; color: black">STATUS</label>
<div class="col-md-3">
    <select class="form-control input-sm" id="sel1" required="true" name="status">
   <option value="">SELECT</option>
   <option>Active</option>
   <option>In-Active </option>
  

  </select>
</div>
<!--<span class="col-md-2 form_errorMsg" id="msg5"><code>Invalid</code></span>-->
</div>

                       <div class="form-group">
                        <div class="col-md-5">
                        <div style="padding-left:200px;">
                           
                            <input id="submit" type="submit" class="btn btn-primary btn-sm" value="SAVE"/>
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
  //alert("The paragraph was clicked.");
    var accountNo = document.addMasterAccounts.accountNo;
    var accountName = document.addMasterAccounts.accountName;
    var CurrentLedger=document.addMasterAccounts.CurrentLedger;
    var typeOfAccount = document.addMasterAccounts.typeOfAccount;
    var status = document.addMasterAccounts.status;

 
    
	if(allLetter3(accountNo) && allLetter(accountName) &&allLetter1(CurrentLedger) &&  validateSelect1(typeOfAccount) && validateSelect2(status) ){
	return true;
	}
	else{
    return false;
	}
    
} 
function allLetter(uname)
{
    var letters = /^[A-Za-z\u0080-\u00FF\d\s\?]+$/;
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
    var letters = /^[A-Za-z\u0080-\u00FF\d\s\?]+$/;
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

function allLetter3(uname)
{
    var letters = /^[A-Za-z\u0080-\u00FF\d\s\?]+$/;
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

function validateSelect1(salutations)  
{  
    //var numbers = /^[1-4]+$/;
    if(salutations.value.match(-1))  
    {   
	$('#msg4').css("display", "block");
        salutations.focus();  
        return false; 
         
                
    }  
    else  
    {  
        $('#msg4').css("display", "none");
        return true;    
    }  
} 

function validateSelect2(gender)  
{  
    //var numbers = /^[1-4]+$/;
    if(gender.value.match(-1))  
    {   
	$('#msg5').css("display", "block");
        gender.focus();  
        return false; 
         
                
    }  
    else  
    {  
        $('#msg5').css("display", "none");
        return true;    
    }  
} 

</script>

</form>


</div>
</div>
</div>
</div>
         
                
                          
                             
                
                
                
                
                