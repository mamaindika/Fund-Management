<%@page import="model.TblMasteraccounts" %>
<%@page import="model.TblMasterjournals" %>
<%@page import="model.TblAccountJournalmapping" %>
<%@page import="service.masterAccountsService" %>
<%@page import="service. MasterJournalsService" %>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<style>.custom { width: 50px !important;}</style>
    <%  TblAccountJournalmapping acc = (TblAccountJournalmapping) request.getAttribute("searchResult");
        TblMasteraccounts ac = (TblMasteraccounts) request.getAttribute("searchResult1");
        TblMasterjournals a = (TblMasterjournals) request.getAttribute("searchResult2");
            if ((acc != null)&&(ac != null)&&(a != null)) {

    %>

<form action="Account_JournalUpdateController" method="post" class="form-horizontal" >
<legend><h4 style="text-align: left;"><b>ACCOUNT DETAILS</b></h4> </legend>



    
    <div class="form-group" hidden="true">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">ACCOUNT NO</label> 
<div class="col-md-3">
<input id="id" name="id"  type="text" placeholder="" value="<% out.println(acc.getId()); %>" class="form-control input-sm" required="" style="padding-left:10px">
</div>
</div> 
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">JOURNAL NAME</label>
<div class="col-md-3">
<select class="form-control input-sm" id="JournalName" name="JournalName" value="<% out.println(acc.getTblMasterjournals().getJournalNo()); %>" >  
        <option value="<%=a.getJournalNo()%>"><% out.println(a.getJournalName()); %></option>
            <%
                MasterJournalsService ms = new MasterJournalsService();
                  ms = new MasterJournalsService();
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
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">PROCESS</label>
<div class="col-md-3">
<select class="form-control input-sm" id="Process" name="Process" value="<% out.println(acc.getProcess()); %>">
     <option><% out.println(acc.getProcess()); %></option>
    <option>Credit</option>
    <option>Debit</option>
   
  </select>
</div>
</div>  

<div class="form-group">
<label class="col-md-3 control-label" for="sel1" style="text-align:left; font-size:12px; color: black">ACCOUNT NAME</label>
<div class="col-md-3">
<select class="form-control input-sm" id="AccountName" name="AccountName" value="<% out.println(ac.getAccountNo()); %>" >  
    <option value="<%=ac.getAccountNo()%>"><% out.println(ac.getAccountName()); %></option>
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

<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">ACCOUNT NO</label> 
<div class="col-md-3">
<input id="AccountNo" name="AccountNo"  type="text" placeholder="" value="<% out.println(ac.getAccountNo()); %>" class="form-control input-sm" required="" style="padding-left:10px">
</div>
</div> 
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">STATUS</label>
<div class="col-md-3">
    <input class="form-control input-sm" id="status" name="status" value="<% out.println(acc.getStatus()); %>" readonly="true">
</div>
</div>


<div class="form-group">
<div class="col-md-12">
<div style="padding-right:250px;">
    <input type="submit" class="btn btn-primary btn-sm" value="SAVE">
    &nbsp;
     <a href="Account_Journal_ManagePage.jsp"  class="btn btn-primary btn-sm">BACK</a>
</div>
</div>

</div>
</form>


    <%  }else{  %>
        Invalid Designation
    <%  }  %>