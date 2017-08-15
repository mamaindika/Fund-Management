<%-- 
    Document   : journalEdit
    Created on : Jun 16, 2016, 9:36:01 AM
    Author     : boc
--%>
<%@page import="model.TblMasterjournals" %>
<%@page import="service.MasterJournalsService" %>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<style>.custom {width: 50px !important;}</style>
       <% TblMasterjournals acc = (TblMasterjournals) request.getAttribute("searchResult");
   

        if (acc != null) {

    %>
 
    <div>
<div id="myform">
<form action="MasterJournalsUpdateController" method="post" class="form-horizontal">
  <legend><h4 style="text-align: left;"><b>EDIT ACCOUNT JOURNAL</b></h4> </legend>
<!-- Form Name -->

<!--<div class="form-group" hidden="true">
<label class="col-md-3 control-label"  style="text-align:left">Journal id</label>
<div class="col-md-3"> 
    <input class="form-control input-sm" id="id" name="id" value="">
</div>
</div> -->
<div class="form-group">
<label class="col-md-3 control-label"   style="text-align:left; font-size:12px; color: black">JOURNAL NO</label>
<div class="col-md-3"> 
    <input class="form-control input-sm" id="journalNo" required="true" name="journalNo" value="<% out.println(acc.getJournalNo());%>">
</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">JOURNAL NAME</label>
<div class="col-md-3"> 
<input class="form-control input-sm" id="journalName" required="true"  name="journalName" value="<% out.println(acc.getJournalName());%>" >
</div>
</div>             
            
            
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">DESCRIPTION</label>
<div class="col-md-3"> 
<input class="form-control input-sm" required="true" id="journalDescription" name="journalDescription" value="<% out.println(acc.getJournalDescription());%>" >
</div>
</div>            
 <!-- select-->
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">JOURNAL TYPE</label>
<div class="col-md-3">
    <select class="form-control input-sm" id="typeOfJournal" name="typeOfJournal" value="<% out.println(acc.getTypeOfJournal());%>" >
    <option><% out.println(acc.getTypeOfJournal());%></option>
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
    <input class="form-control input-sm" required="true" id="status" name="status" value="Active" >
</div>
</div>
<div class="form-group">
<div class="col-md-11">
    <div style="margin-left: -160px">
     
     
    <input type="submit" class="btn btn-primary btn-sm" value="SAVE">
     &nbsp; 
     <a href="MasterJournals_ManagePage.jsp"  class="btn btn-primary btn-sm">BACK</a>
</div>
</div>
</div>
 </div>
</div>
</form>



<%  }else{  %>
       
    <%  }  %>
