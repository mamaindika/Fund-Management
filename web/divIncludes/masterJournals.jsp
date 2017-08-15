<%-- 
    Document   : masterAccounts
    Created on : May 11, 2016, 10:05:44 AM
    Author     : Boc
--%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.MasterJournalsService"%>
<%@page import="model.TblMasterjournals" %>

<html>
    <head>
        
        
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
        
        
    </head>    
    
    
   <style>.custom {width: 50px !important;}</style>
    <div>

        
        
  <div class="row" >
<div class="col-md-2">

<button class="btn btn-primary" style="margin-bottom: -70px" data-toggle="modal"  data-target="#myModal">
<span class="glyphicon glyphicon-plus-sign"></span> 
ADD MASTER JOURNALS DETAILS
</button> 
    
</div>
</div> 
<br><br><br><br>
 

     
            
       <!-- <form name="searchForm" action="searchController">
            <div class="row">
                <div class="col-md-2">  
<div class="form-group">
                        <label class="control-label" for="id">
                            Designation ID
                        </label>
                        <input type="text" class="form-control input-sm" id="id" name="searchValue" value="" >
</div>
</div>            
                <div class="col-md-2">
                    <br /> 
                  <input type="submit" value="Filter" name="searchButton" class="btn btn-primary btn-sm" />

</div>
</div>           
        </form> -->
 
           
     <table class="table scroll table-list-search" style="border: solid 2px #cccccc;">
       
            <thead  style="text-align:left">
                
                <tr>
                     <th style="text-align:left; font-size:12px; color: black">JOURNAL NO</th>
                    <th style="text-align:left; font-size:12px; color: black">JOURNAL NAME</th>
                    <th style="text-align:left; font-size:12px; color: black">DESCRIPTION</th>
                    <th style="text-align:left; font-size:12px; color: black">JOURNAL TYPE</th>
                  
                    <th colspan="2"></th>
                </tr>
            </thead>
            <tbody style="text-align:left">
                <%
                    MasterJournalsService as = new MasterJournalsService();
                    List users = as.listMasterjournals();
                    for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                        TblMasterjournals us = (TblMasterjournals) iterator.next();
                        if(us.getTblFundtypes().getId().equals(session.getAttribute("loggedFundType"))){
                %>
                <tr>
                    <td style="text-align:left"><%= us.getJournalNo()%></td>
                    <td style="text-align:left"><%= us.getJournalName()%></td>
                    <td style="text-align:left"><%= us.getJournalDescription()%></td>
                    <td style="text-align:left"><%= us.getTypeOfJournal()%></td>
                    
                    
           
                  
                    <td style="text-align: center">
                    <form name="editForm" action="MasterJournalsEditController" method="post">
                    <input type="submit" value="Edit" name="editButton" class="btn btn-primary btn-xs custom" />
                    <input type="hidden" value="<%=us.getJournalNo()%>" name="searchValue" />
                   
                    <a href="MasterJournals_DeletePage.jsp?journalNo=<%=us.getJournalNo()%>" class="btn btn-primary btn-xs custom">Delete</a>
              
                    </form>  
                    </td>
                    
                <%  } } %>
          
                
                
                </tr>
            </tbody>
        </table>
    </div>
                
                
                
                
         
<div id="myModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<!-- Modal content-->
<div class="modal-content">
<div class="modal-body">

    
                  
                
<style>
.form_errorMsg{

    
    color: red;
    display: none;

   


}.custom {width: 50px !important;}
                </style>



<div id="myform">
<form action="MasterJournalsAddController" name="addMasterJournals" onsubmit="return formValidation()" method="post" class="form-horizontal" style="width:800px">
    <legend style="width: 550px;"><h4 style="text-align: left;"><b>ACCOUNT JOURNALS</b></h4> </legend>
<!-- Form Name -->
<div class="form-group" >
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">JOURNAL NO</label>
<div class="col-md-3"> 
    <input class="form-control input-sm" required="true" id="journalNo" name="journalNo">
</div>
<!--<span class="col-md-3 form_errorMsg" id="msg1"><code>Invalid</code></span>-->
</div>  
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">JOURNAL NAME</label>
<div class="col-md-3"> 
<input class="form-control input-sm" required="true" id="journalName" name="journalName">
</div>
<!--<span class="col-md-3 form_errorMsg" id="msg2"><code>Invalid</code></span>-->
</div>             
            
            
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">JOURNAL DESCRIPTION</label>
<div class="col-md-3"> 
<input class="form-control input-sm" required="true" id="journalDescription" name="journalDescription"></textarea>
</div>
<!--<span class="col-md-4 form_errorMsg" id="msg3"><code>Invalid</code></span>-->
</div>            
 <!-- select-->
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">JOURNAL TYPE</label>
<div class="col-md-3">
<select class="form-control input-sm" required="true" id="typeOfJournal" name="typeOfJournal">
    <option value="">SELECT</option>
    <option>Investment</option>
    <option>Contribution</option>
    <option>Payments</option>
    <option>Shares</option>

  </select>
</div>
<!--<span class="col-md-3 form_errorMsg" id="msg4"><code>Invalid</code></span>-->
</div>           

<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">STATUS</label>
<div class="col-md-3">
    <input class="form-control input-sm" required="true" id="status" name="status" value="Active" readonly="true">
</div>
</div>
<div class="form-group">
<div class="col-md-11">
<div style="padding-right:130px;">
    <input id="submit" type="submit" class="btn btn-primary btn-sm" value="SAVE">
     &nbsp; 
     <a href="MasterJournals_ManagePage.jsp"  class="btn btn-primary btn-sm">BACK</a>
                         
    
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
    var journalNo = document.addMasterJournals.journalNo;
    var journalName = document.addMasterJournals.journalName;
    var journalDescription=document.addMasterJournals.journalDescription;
    var typeOfJournal = document.addMasterJournals.typeOfJournal;

	if(allLetter3(journalNo) && allLetter(journalName) &&allLetter1(journalDescription) &&  validateSelect1(typeOfJournal)){
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


</script>
 
</form>
</div>







</div>
</div>
</div>
</div>
         
                  
                
                
                
                
</html>