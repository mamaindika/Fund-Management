<%-- 
    Document   : journalDelete
    Created on : Jun 16, 2016, 9:11:25 AM
    Author     : boc
--%>

<%@page import="model.TblMasterjournals" %>
<%@page import="service.MasterJournalsService" %>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<style>.custom {width: 50px !important;}</style>
   <% 
        int journalNo = Integer.parseInt(request.getParameter("journalNo"));
        MasterJournalsService acs = new MasterJournalsService();
        TblMasterjournals usr = acs.searchAccount(journalNo);
        if (usr != null) {

    %>


<div id="myform">
<form action="MasterJournalsDeleteController" method="post" class="form-horizontal" onsubmit="return confirm('Do you really want to delete the journal ?');">
    <legend><h4 style="text-align: left;"><b> DELETE ACCOUNT JOURNAL</b></h4> </legend>
<!-- Form Name -->
 
<!--<div class="form-group" hidden="true">
<label class="col-md-3 control-label"  style="text-align:left">Journal id</label>
<div class="col-md-3"> 
    <input class="form-control input-sm" id="id" name="id" value="">
</div>
</div>-->
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">JOURNAL NO</label>
<div class="col-md-3"> 
    <input readonly="TRUE" class="form-control input-sm" id="journalNo" name="journalNo" value="<% out.println(usr.getJournalNo());%>">
</div>
</div>
 
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">JOURNAL NAME</label>
<div class="col-md-3"> 
<input class="form-control input-sm" id="journalName" name="journalName" value="<% out.println(usr.getJournalName());%>" readonly="true">
</div>
</div>             
            
            
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">DESCRIPTION</label>
<div class="col-md-3"> 
<input class="form-control input-sm" id="journalDescription" name="journalDescription" value="<% out.println(usr.getJournalDescription());%>" readonly="true">
</div>
</div>            
 <!-- select-->
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">JOURNAL TYPE</label>
<div class="col-md-3">
    <select class="form-control input-sm" id="typeOfJournal" name="typeOfJournal" value="<% out.println(usr.getTypeOfJournal());%>" readonly="true">
   <option><% out.println(usr.getTypeOfJournal());%></option>
    <option>Investment</option>
    <option>Contribution</option>
    <option>Payments</option>
    <option>Shares</option>

  </select>
</div>
</div>           
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">STATUS</label>
<div class="col-md-3">
    <input class="form-control input-sm" id="status" name="status" value="Active" readonly="true">
</div>
</div>
<div class="form-group">
<div class="col-md-11">
<div style="margin-left: -160px">
      
      
    <input type="submit" class="btn btn-primary btn-sm" value="DELETE">
    &nbsp;
    <a href="MasterJournals_ManagePage.jsp"  class="btn btn-primary btn-sm">BACK</a>
</div>
</div>
</div>

</form>

</div>
<%  }else{  %>
       
    <%  }  %>
