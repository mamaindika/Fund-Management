<%--
    Document   : Authorization
    Created on : Jun 22, 2016, 8:39:08 AM
    Author     : boc
--%>
<%@page import="service.TransactionService"%>
<%@page import="model.TblMasterjournals"%>
<%@page import="model.TblTransactiontype"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.MasterJournalsService"%>
<%@page import="model.TblTransactionsdetails"%>
<html>
    <head>
        <link rel="stylesheet" href="css/datepicker.css">
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    </head>
     <style>
        .custom {
    width: 80px !important;
        }
    </style>
<% 
    TblTransactionsdetails acc = (TblTransactionsdetails) request.getAttribute("searchResult");
    TblMasterjournals ac = (TblMasterjournals) request.getAttribute("searchResult1");
    TblTransactiontype a = (TblTransactiontype) request.getAttribute("searchResult2");
    if ((acc != null)&&(ac != null)&&(a != null)) {
%>
<form  method="post" class="form-horizontal" action="AuthorizationUpdateController">
<!-- Form Name -->
<legend><h4 style="text-align: left;"><b>CONTRIBUTION</b></h4></legend>
<div class="form-group" hidden="true">
    <label class="col-md-2 control-label"  style="text-align:left">ID</label> 
        <div class="col-md-3">
            <input id="id" name="id" type="text" readonly="true" value="<% out.println(acc.getId()); %>"  class="form-control input-sm" required="">
        </div>
 </div>
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">TRANSACTION TYPE</label>
<div class="col-md-3">
<select class="form-control input-sm" id="Transaction"  name="Transaction">  
                <option value=<%=a.getTransactionTypeId()%>><% out.println(a.getTransactionDescription()); %></option>
                    <%
                        TransactionService transSer  = new TransactionService();
                        List listTRa= transSer.listTransaction();
                        for (Iterator iterator = listTRa.iterator(); iterator.hasNext();) {
                              TblTransactiontype ty = (TblTransactiontype) iterator.next();
                              request.setAttribute("Transaction",ty);
                   %>
                <option value=<%=ty.getTransactionTypeId()%>><%= ty.getTransactionDescription()%></option> 

                                     <%  }  %>
</select>
</div>
</div>

<!-- Text input-->
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">DETAILS</label> 
<div class="col-md-3">
<input id="Detail" name="Detail" value="<% out.println(acc.getTransactionDescription()); %>" type="text" placeholder="" class="form-control input-sm" required="" style="padding-left:10px">

</div>
</div>



<!-- Text input-->
<div class="form-group" id="sandbox-container">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">TRANSACTION DATE</label> 
<div class="col-md-3">
<div class="input-group date"  >
    <input type="text" required="" id="TransactionDate" value="<% out.println(acc.getTransactionDate()); %>" name="TransactionDate" class="form-control" ><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
</div></div>
<script>
    $('#sandbox-container .input-group.date').datepicker({
    todayBtn: "linked",
    toggleActive: true
});
</script>

</div>

<!-- select-->


<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">JOURNAL ENTRY</label>
<div class="col-md-3">
<select class="form-control input-sm" value="<% out.println(ac.getJournalName()); %>" id="JournalEntry" name="JournalEntry">  
                                    <option value=<%=ac.getJournalNo()%>><% out.println(ac.getJournalName()); %></option>
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
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">TRANSACTION AMOUNT</label>
<div class="col-md-3">
<input id="TransactionAmount" name="TransactionAmount" type="text" value="<% out.println(acc.getTransactionAmount()); %>" class="form-control input-sm" required="" style="padding-left:10px">

</div>
</div>
<div class="form-group" hidden="true">
    <label class="col-md-2 control-label"  style="text-align:left">ID</label> 
        <div class="col-md-3">
            <input id="createdDate" name="createdDate" type="text" readonly="true" value="<% out.println(acc.getCreatedDate()); %>"  class="form-control input-sm" required="">
        </div>
 </div>
<div class="form-group" hidden="true">
    <label class="col-md-2 control-label"  style="text-align:left">ID</label> 
        <div class="col-md-3">
            <input id="createdUser" name="createdUser" type="text" readonly="true" value="<% out.println(acc.getCreatedUser()); %>"  class="form-control input-sm" required="">
        </div>
 </div>









<!-- select-->
<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">COMMENTS</label>
<div class="col-md-3">
    <textarea id="Comments" name="Comments" type="text"  class="form-control input-sm" required="" style="padding-left:10px">
        </textarea>
</div>
</div>

<div class="form-group">
<div class="col-md-9">
    <br>
<input type="submit"  name="action"  id="Authorize" value="AUTHORIZED" class="btn btn-sm btn-primary">&nbsp;
<input type="submit"  name="action"  id="Modify" value="MODIFY" class="btn btn-sm btn-primary">&nbsp;
<input type="submit"  name="action"  id="Reject" value="REJECT" class="btn btn-sm btn-primary">
</div>
</div>
</form>
 <%  }else{  %>
        Invalid
    <%  }  %>
</html>

