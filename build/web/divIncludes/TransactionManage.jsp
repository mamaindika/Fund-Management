<%-- 
    Document   : TransactionManage
    Created on : Jul 27, 2016, 4:05:01 PM
    Author     : boc
--%>

<%@page import="model.TblMasterjournals"%>
<%@page import="service.MasterJournalsService"%>
<%@page import="model.TblTransactiontype"%>
<%@page import="model.TblTransactionsdetails"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.TransactionService"%>
<html>
  <style>.custom {width: 50px !important;}</style>
 <div class="row" >
<div class="col-md-2">

<button class="btn btn-primary" style="margin-bottom: -70px" data-toggle="modal"  data-target="#myModal">
<span class="glyphicon glyphicon-plus-sign"></span> 
ADD TRANSACTION
</button> 
    
</div>
</div> 
<br><br><br><br><br>
  
  
  
  
  
  
  
  
  
    <div>

        <div class="row">
            <div class="col-md-2">
                <br /> 

            </div>
        </div> 
        <div class="row">
                <div class="col-md-5">  
        <div class="input-group add-on">
        <input type="text" class="form-control" placeholder="Search" name="srch-term" id="system-search">
        <div class="input-group-btn">
        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
        </div>
        </div>
    </div>
            <br><br><br>
        </div> 

        <div class="row">
         <table class="table table-bordered table-list-search ">
            <thead style="text-align: center">
                <tr>
                    <th style="text-align: center">Transaction Description</th>
                    <th style="text-align: center">Transaction Type</th>
                    <th  style="text-align: center">Transaction Amount</th>
                    <th style="text-align: center">Status</th>
                    <th style="text-align: center">Created User</th>
            <a href="TransactionManage.jsp"></a>
                    <th></th>
                </tr>
            </thead>
            <tbody style="text-align:left">
                <%
                    TransactionService  as = new TransactionService();
                    List users = as.TransactionsdetailsList();
                    for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                        TblTransactionsdetails us = (TblTransactionsdetails) iterator.next();
                %>
                <tr>
                    <td style="text-align: center"><%= us.getTransactionDescription()%></td>
                    <td style="text-align: center"><%= us.getTblTransactiontype().getTransactionDescription()%></td>
                    <td  style="text-align: center"><%= us.getTransactionAmount()%></td>
                    <td style="text-align: center"><%= us.getStatus() %></td>
                    <td style="text-align: center"><%= us.getCreatedUser()%></td>
                    <td style="text-align: center">
                    <form  name="Form" action="TransactionEditController" method="post">
                    <input type="submit" value="View" name="editButton" class="btn btn-primary btn-xs custom" />
                    <input type="hidden" value="<%= us.getId()%>" name="searchValue" />             
                    <input type="hidden" value="<%= us.getTblAccountJournalmapping().getId()%>" name="searchValue1" />
                    <input type="hidden" value="<%= us.getTblTransactiontype().getTransactionTypeId()%>" name="searchValue2" />
                    
                    <%System.out.println("searchValue"+us.getId());%> 
                    <%System.out.println("searchValue1"+us.getTblAccountJournalmapping().getId());%>   
                    <%System.out.println("searchValue2"+us.getTblTransactiontype().getTransactionTypeId());%>   
                    </form>                                   
                    </td>
                <%  }  %> 
                </tr>
            </tbody>
    </table>

        </div> 


    </div>
                
                
                
                
                
                
<div>             

<div id="myModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<!-- Modal content-->
<div class="modal-content">
<div class="modal-body">                
                
                
                
    <form  method="post" class="form-horizontal" action="TransactionAddController" style="width: 800px">

<!-- Form Name -->
<legend style="width: 550px"><h4 style="text-align: left;"><b>Transaction</b></h4></legend>

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
                                              TblMasterjournals asE = (TblMasterjournals) iterator.next();
                                              request.setAttribute("JournalName",asE);
                                    %>
                                    <option value=<%=asE.getJournalNo()%>><%= asE.getJournalName()%></option> 

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
<div style="padding-left:200px">
    <input type="submit" id="add" value="Add" class="btn btn-primary btn-sm custom">&nbsp;
    <a href="" class="btn btn-primary btn-sm custom"><span class="glyphicon"></span>Clear</a>&nbsp;
     <a href=" TransactionManagePage.jsp"  class="btn btn-primary btn-sm custom">Back</a> 
   
</div>
</div>
</div>
</form>


                
                
  </div>
</div>
</div>
</div>
</div>              
                
                
                
                
                
                
                
                
                
                
                
                
</html>