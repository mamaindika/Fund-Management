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
      <% 
        int id = Integer.parseInt(request.getParameter("id"));
        MasterJournalsService acs = new MasterJournalsService();
        TblAccountJournalmapping usr = acs.searchAccountJournalmapping(id);
        if (usr != null) {

    %>

<form action="Account_JournalMappingController" method="post" class="form-horizontal">

<label class="col-md-3 control-label"  style="text-align:left">Journal Name</label>
<div class="col-md-3">
<select class="form-control input-sm" id="JournalName" name="JournalName" value="<% out.println(usr.getTblMasterjournals().getJournalName()); %>" >  
        <option><% out.println(usr.getTblMasterjournals().getJournalName()); %></option>
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

<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left">Process</label>
<div class="col-md-3">
<select class="form-control input-sm" id="Process" name="Process" value="<% out.println(usr.getProcess()); %>">
    <option>Credit</option>
    <option>Debit</option>
    

  </select>
</div>
</div>  

<div class="form-group">
<label class="col-md-3 control-label" for="sel1" style="text-align:left">Account Name</label>
<div class="col-md-3">
<select class="form-control input-sm" id="AccountName" name="AccountName" value="<% out.println(usr.getTblMasteraccounts().getAccountName()); %>" >  
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
<input id="AccountNo" name="AccountNo" value="" type="text" placeholder="" class="form-control input-sm" required="" style="padding-left:10px" value="<% out.println(usr.getTblMasteraccounts().getAccountNo()); %>">
</div>
</div> 
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left">Status</label>
<div class="col-md-3">
    <input class="form-control input-sm" id="status" name="status" value="<% out.println(usr.getStatus()); %>"readonly="true">
</div>
</div>


<div class="form-group">
<div class="col-md-12">
<div style="padding-left:800px">
    <input type="submit" class="btn btn-primary btn-xs custom" value="Save">
</div>
</div>
</div>
</form>

    <%  }else{  %>
        Invalid 
    <%  }  %>