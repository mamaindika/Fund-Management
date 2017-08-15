<%@page import="model.TblMasteraccounts" %>
<%@page import="model.TblMasterjournals" %>
<%@page import="model.TblAccountJournalmapping" %>
<%@page import="service.masterAccountsService" %>
<%@page import="service.MasterJournalsService" %>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<style>.custom { width: 50px !important;}</style>
<div id="myform">
<form action="Account_JournalMappingController" method="post" class="form-horizontal">
<div class="panel panel-active">
<div class="panel-heading" style="text-align: left; background-color:#ADD8E6"><b>Account Details<b></div>
<div class="panel-body">
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left">Journal Name</label>
<div class="col-md-3">
<select class="form-control input-sm" id="JournalName" name="JournalName" >  
                                    <option>select</option>
                                    <%
                                        MasterJournalsService ms = new MasterJournalsService();
                                        List listjournals= ms.listMasterjournals();
                                        for (Iterator iterator = listjournals.iterator(); iterator.hasNext();) {
                                              TblMasterjournals as = (TblMasterjournals) iterator.next();
                                              request.setAttribute("JournalName",as);
                                    %>
                                    <option value=<%=as.getJournalNo()%>><%= as.getJournalName()%></option> 

                                     <%  }  %>
</select>

</div>
</div>
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
                                              TblMasteraccounts ass = (TblMasteraccounts) iterator.next();
                                              request.setAttribute("AccountName",ass);
                                    %>
                                    <option value=<%=ass.getAccountNo()%>><%= ass.getAccountName()%></option> 

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
<label class="col-md-3 control-label"  style="text-align:left">Status</label>
<div class="col-md-3">
    <input class="form-control input-sm" id="status" name="status" value="Active" readonly="true">
</div>
</div>


<div class="form-group">
<div class="col-md-12">
<div style="padding-left:800px">
    <input type="submit" class="btn btn-primary btn-xs custom" value="Save">
</div>
</div>
</div></form>
</div>
</div>
</div>
