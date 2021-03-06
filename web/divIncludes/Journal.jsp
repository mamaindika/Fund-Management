<%@page import="model.TblMasteraccounts" %>
<%@page import="service.masterAccountsService" %>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<style>.custom {width: 50px !important;}</style>
<div id="myform">
<form id="togglingForm" method="post" action="MasterJournalsAddController" class="form-horizontal"> 
<h4 style="text-align: left;"><b>Account Journals</b></h4> 
<!-- Form Name -->
<div class="panel panel- active">
<div class="panel-heading" style="text-align: left; background-color:#ADD8E6"><b>Master Journal Details<b></div>

<div class="panel-body">  
<div class="form-group">
<label class="col-md-3 control-label" for="Journal Name" style="text-align:left">Journal Name</label>
<div class="col-md-3"> 
<input class="form-control input-sm" id="Journal Name" name="Journal Name">
</div>
</div>             
            
            
<div class="form-group">
<label class="col-md-3 control-label" for="Journal Description" style="text-align:left">Journal Description</label>
<div class="col-md-3"> 
<input class="form-control input-sm" id="JournalDescription" name="JournalDescription"></textarea>
</div>
</div>            
 <!-- select-->
<div class="form-group">
<label class="col-md-3 control-label" for="sel1" style="text-align:left">Type Of Journal</label>
<div class="col-md-3">
<select class="form-control input-sm" id="sel1" name="TypeOfJournal">
    <option>select</option>
    <option>Investment</option>
    <option>Contribution</option>
    <option>Payments</option>
    <option>Shares</option>

  </select>
</div>
</div>           

<div class="form-group">
<label class="col-md-3 control-label" for="sel1" style="text-align:left">Status</label>
<div class="col-md-3">
    <input class="form-control input-sm" id="Status" name="Status" value="Active" readonly="true">
</div>
</div>
</div>
</div>
<div class="panel panel-active">
<div class="panel-heading" style="text-align: left; background-color:#ADD8E6"><b>Account Details<b></div>
<div class="panel-body">
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left">Process</label>
<div class="col-md-3">
<select class="form-control input-sm" id="Process" name="Process">
    <option>Credit</option>
    <option>Debit</option>
    

  </select>
</div>
</div>  

<div class="form-group">
<label class="col-md-3 control-label" for="sel1" style="text-align:left">Account Name</label>
<div class="col-md-3">
<select class="form-control input-sm" id="AccountName" name="AccountName" >  
                                    <option>select</option>
                                    <%
                                        masterAccountsService ds = new masterAccountsService();
                                        List listDesig = ds.listMasterAccounts();
                                        for (Iterator iterator = listDesig.iterator(); iterator.hasNext();) {
                                              TblMasteraccounts as = (TblMasteraccounts) iterator.next();
                                              request.setAttribute("AccountName",as);
                                    %>
                                    <option value=<%=as.getAccountNo()%>><%= as.getAccountName()%></option> 

                                     <%  }  %>
</select>

<!-- Text input-->
</div></div>

<script>
                      
$(document).ready(function() { 
    $('#AccountName').change(function() {
      $('#AccountNo').val($('#AccountName').val());
    });
});</script>
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left">Account No</label> 
<div class="col-md-3">
<input id="AccountNo" name="AccountNo" value="" type="text" placeholder="" class="form-control input-sm" required="" style="padding-left:10px">
</div>
</div> 

<div class="form-group">
<div class="col-md-12">
<div style="padding-left:800px">
    <input type="submit" id="add" value="Add">
  
</div>
</div>
</div>
</div>
</div>
<div id="mydata">

<table class="table" id="myTableData">
    <tr>
        <td>Process</td>
	<td>Account Name </td>
        <td>Account No</td>
        <td> </td>
    </tr>
</table>
</div>
<div class="form-group">
<div class="col-md-12">
<div style="padding-left:800px">
<input type="submit" id="add" value="Add" class="btn btn-primary btn-xs custom">
</div>
</div>
</div>

</form>
</div>


