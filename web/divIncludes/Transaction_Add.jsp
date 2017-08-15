<%@page import="service.TransactionService"%>
<%@page import="model.TblMasterjournals"%>
<%@page import="model.TblTransactiontype"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.MasterJournalsService"%>
  <style>.custom {width: 60px !important;}</style>
<form  method="post" class="form-horizontal" action="TransactionAddController">

<!-- Form Name -->
<legend><h4 style="text-align: left;"><b>Transaction</b></h4></legend>

<div class="form-group">
<label class="col-md-3 control-label"  style="text-align:left">Transaction Type</label>
<div class="col-md-3">
<select class="form-control input-sm" id="Transaction" name="Transaction">  
                <option>SELECT</option>
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
<label class="col-md-3 control-label"  style="text-align:left">Detail</label> 
<div class="col-md-3">
<input id="Detail" name="Detail" type="text" placeholder="" class="form-control input-sm" required="" style="padding-left:10px">

</div>
</div>



<!-- Text input-->
<div class="form-group" id="sandbox-container">
<label class="col-md-3 control-label"  style="text-align:left">Transaction  Date</label> 
<div class="col-md-3">
<div class="input-group date"  >
  <input type="text" id="TransactionDate" name="TransactionDate" class="form-control" ><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
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
<label class="col-md-3 control-label"  style="text-align:left">Journal Entry</label>
<div class="col-md-3">
<select class="form-control input-sm" id="JournalEntry" name="JournalEntry">  
                                    <option>SELECT</option>
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

<!-- select-->
<div class="form-group">
<label class="col-md-3 control-label" for="sel1" style="text-align:left">Transaction Amount</label>
<div class="col-md-3">
<input id="TransactionAmount" name="TransactionAmount" type="text"  class="form-control input-sm" required="" style="padding-left:10px">

</div>
</div>

<div class="form-group">
<div class="col-md-6">
<div style="padding-left:250px">
    <input type="submit" id="add" value="Add" class="btn btn-primary btn-xs custom">&nbsp;
    <a href="" class="btn btn-primary btn-xs custom"><span class="glyphicon"></span>Clear All</a>
</div>
</div>
</div>
</form>


