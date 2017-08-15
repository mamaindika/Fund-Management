<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.InvestmentTypesService"%>
<%@page import="model.TblInvestmenttypes"%>
<%@page import="model.TblAccountJournalmapping"%>
<%@page import="model.TblInvestments"%>
<%@page import="model.TblMasterjournals"%>
<%@page import="service.MasterJournalsService"%>
<legend style="text-align:left">OPEN INVESTMENT</legend>

<!-- Text input-->
<div class="panel panel-primary">
<div class="panel-heading" style="text-align: left"><b>Interest Details<b></div>
<div class="panel-body">  
<form action="InvestmentOpenController" method="post" id="add" name="add" class="form-horizontal">
<div class="form-group">
    <label class="col-md-2 control-label" style="text-align:left">Investment Type</label> 
        <div class="col-md-3">
            <select class="form-control input-sm" id="InvestmentType" name="InvestmentType">
            <option>SELECT</option>
            <%
            InvestmentTypesService InveSer = new InvestmentTypesService();
            List fund = InveSer.listInvestments();
                  
            for (Iterator iterator = fund.iterator(); iterator.hasNext();) {
                TblInvestmenttypes tblInvestmenttypes = (TblInvestmenttypes) iterator.next();
                request.setAttribute("InvestmentType",tblInvestmenttypes);
                System.out.println("test66"+tblInvestmenttypes.getId());
            %>
            <option value=<%=tblInvestmenttypes.getId()%>><%= tblInvestmenttypes.getDescription()%></option> 
            <% System.out.println("test88"+tblInvestmenttypes.getId());%>
        <%  }  %>
                </select>
    </div>
</div>
<div class="form-group">
<label class="col-md-2 control-label"  style="text-align:left">Journal Entry</label>
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
<div class="form-group">
<label class="col-md-2 control-label" style="text-align:left">Reference No</label>  
<div class="col-md-3">
<input id="referenceNo" name="referenceNo" type="text" placeholder="" class="form-control input-sm">
</div>
</div>
<!-- Text input-->
<div class="form-group">
<label class="col-md-2 control-label" for="ReceiptNo" style="text-align:left">Receipt No</label>  
<div class="col-md-3">
<input id="ReceiptNo" name="ReceiptNo" type="text" placeholder="" class="form-control input-sm"> 
</div>
</div>

<div class="form-group" id="sandbox-container">
<label class="col-md-2 control-label"  style="text-align:left">Invest Date</label> 
<div class="col-md-3">
<div class="input-group date">
    <input type="text" id="date1" name="InvestDate" class="form-control input-sm"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
</div></div>
<script>
        $('#sandbox-container .input-group.date').datepicker({
    todayBtn: "linked",
    toggleActive: true
});
</script>


<label class="col-md-2 control-label" for="MatureDate" style="text-align:left">&nbsp;&nbsp;&nbsp;&nbsp;Mature Date</label> 
<div class="col-md-3">
<div class="input-group date"  >
  <input type="text" id="date2" name="MatureDate" class="form-control input-sm"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
</div></div>
<script>
        $('#sandbox-container .input-group.date').datepicker({
    todayBtn: "linked",
    toggleActive: true
});
</script>
</div>

<div class="form-group">
<label class="col-md-2 control-label"  style="text-align:left">No of Days</label>  
<div class="col-md-3">
<input id="calculated" name="NoOfDays" type="text" placeholder="" class="form-control input-sm" required="">
</div>
</div>

<script type="text/javascript">//<![CDATA[
$(function(){
$(document).ready(function () {
    var selector = function (dateStr) {
            var d1 = $('#date1').datepicker('getDate');
            var d2 = $('#date2').datepicker('getDate');
            var diff = 0;
            if (d1 && d2) {
                diff = Math.floor((d2.getTime() - d1.getTime()) / 86400000); // ms per day
            }
            $('#calculated').val(diff);
        }
    $("#date1").datepicker({
        minDate: new Date(2012, 7 - 1, 8),
        maxDate: new Date(2012, 7 - 1, 28)
    });
    $('#date2').datepicker({ 
        minDate: new Date(2012, 7 - 1, 9),
        maxDate: new Date(2012, 7 - 1, 28)
    });
    $('#date1,#date2').change(selector)
});
});//]]> 

</script>

<div class="form-group">
<label class="col-md-2 control-label" for="Amount" style="text-align:left">Amount</label>  
<div class="col-md-3">
<input id="Amount" name="Amount" type="text" placeholder="" class="form-control input-sm" required="">
</div>
</div>

<div class="form-group">
    <label class="col-md-2 control-label" for="Tax Rate" style="text-align:left">Tax Rate</label>
    <div class="col-md-3" style="text-align:left"> 
    <input type="radio" name="TaxRate" value="W" >
    <label >WHTR</label>
    <input type="radio" name="TaxRate" value="N">
    <label>Notion Tax Rate</label>
    <div class="reveal-if-active">
    <label class="col-md-2 control-label"  style="text-align:left">Value</label>
    <input type="text" id="" name="TaxValue" class="form-control input-sm" data-require-pair="#">
    </div>
    </div>
</div>


<div class="form-group">
    <label class="col-md-2 control-label" for="Interest Rate" style="text-align:left">Interest Rate</label>
    <div class="col-md-3" style="text-align:left"> 
    <input type="radio" name="InterestRate" value="Fixed">
    <label >Fixed </label>
    <input type="radio" name="InterestRate" >
    <label>Floating</label>
    <div class="reveal-if-active">
    <label class="col-md-2 control-label"  style="text-align:left">Value</label>
    <input type="text" id="Fixed" name="InterestValue" class="form-control input-sm" data-require-pair="#">
    </div>
    </div>
</div>



 
<div class="form-group">
  <label class="col-md-2 control-label" for="Interest at" style="text-align:left">Interest at</label>
  <div class="col-md-3" style="text-align:left"> 
    <label class="radio-inline" for="radios-2" style="text-align:left">
      <input type="radio" name="InterestAt" id="radios-2" value="M" checked="checked">
      Maturity
    </label> 
    <label class="radio-inline" for="radios-3" style="text-align:left">
      <input type="radio" name="InterestAt" id="radios-3" value="A">
      Annually
    </label> 
  </div>
</div>
<br>
<!-- Button -->
<div class="form-group">
<div class="col-md-5">
<div style="padding-left:150px;">
<input type="submit" class="btn btn-primary btn-sm custom" value="Save"/>
</div>
</div>
</div> 

</form>
</div>
</div>
<!--                 -->                        
<div class="panel panel-primary">
<div class="panel-heading" style="text-align: left"><b>Interest Details<b></div>

<div class="panel-body">  
<div class="row" align="center">
<table class="table table-bordered" style=" align-content: center">
            <thead style="text-align:left">
                <tr>
                    
                    <th style="text-align:center">Amount</th>
                    <th style="text-align:center">Interest Rate</th>
                    <th style="text-align:center">Interest</th>
                    <th></th>
                </tr>
            </thead>
            <tbody style="text-align:left">
                <%
                    InvestmentTypesService as = new InvestmentTypesService();
                    List investment = as.InvestmentDetailsList();
                    for (Iterator iterator = investment.iterator(); iterator.hasNext();) {
                        TblInvestments us = (TblInvestments) iterator.next();
                %>
                <tr>
                   
                    <td style="width:"><%= us.getAmount()%></td>
                    <td style="width:"><%= us.getInterestValue()%></td>
                    <td style="width:"><%= us.getInterest()%></td>
                 
                    <td style="width: 40%; text-align: center">
                    </td>

                <%  }  %>
                </tr>
            </tbody>
</table>
</div>
</div>
</div>
<!--                 -->                      
<div class="panel panel-primary">
<div class="panel-heading" style="text-align: left"><b><b></div>
<div class="panel-body">  
    
<div class="form-group">
<label class="col-md-2 control-label" for="Remarks" style="text-align:left">Remarks</label>
<div class="col-lg-3"> 
<textarea class="form-control input-sm" id="Remarks" name="Remarks"></textarea>
</div>
</div>
</div>
</div>                        

