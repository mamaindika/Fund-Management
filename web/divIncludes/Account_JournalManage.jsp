<%@page import="model.TblInvestmenttypes"%>
<%@page import="model.TblInvestments"%>
<%@page import="service.InvestmentTypesService"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.masterAccountsService"%>
<%@page import="service.MasterJournalsService"%>
<%@page import="model.TblAccountJournalmapping" %>
<%@page import="model.TblMasteraccounts"%>
<%@page import="model.TblMasterjournals"%>
<html>
    
    <head>
        
                       <style> 

table.scroll {
    /* width: 100%; */ /* Optional */
    /* border-collapse: collapse; */
    border-spacing: 0;
    border: none;
}

table.scroll tbody,
table.scroll thead { display: block; }

thead tr th { 
    height: 30px;
    line-height: 30px;
    width: 145px;
    /* text-align: left; */
}

table.scroll tbody {
    height: 400px;
    width: 100%;
    overflow-y: auto;
    overflow-x: hidden;
}

tbody { border-top: none; }

tbody td, thead th {
    /* width: 20%; */ /* Optional */
    border-right: none;
    /* white-space: nowrap; */
}

tbody td:last-child, thead th:last-child {
    border-right: none;
}

tbody tr td{
    
    width: 150px;
    height: 40px;
}


</style>
        
        
    </head>   
    
    
<style>.custom { width: 60px !important;}</style>
 <div class="row" >
<div class="col-md-2">

<button class="btn btn-primary" style="margin-bottom: -70px" data-toggle="modal"  data-target="#myModal">
<span class="glyphicon glyphicon-plus-sign"></span> 
ACCOUNT JOURNAL MAPPINNG
</button> 
    
</div>
</div> 
<br><br><br><br>


 <div>
 <div class="row">


<div class="form-group">
<label class="col-md-2 control-label" style="text-align:left; font-size:12px; color: black">JOURNAL NAME</label> 
<div class="col-md-3">
    
        <select class="form-control input-sm" id="selectFilter" name="journalName">
            <option value="-1">SELECT</option>
            <%
                MasterJournalsService ms = new MasterJournalsService();
                List listjournals= ms.listMasterjournals();
                  
            for (Iterator iterator = listjournals.iterator(); iterator.hasNext();) {
                TblMasterjournals tblMasterjournals = (TblMasterjournals) iterator.next();
                request.setAttribute("journalName",tblMasterjournals);
               
               if(tblMasterjournals.getTblFundtypes().getId().equals(session.getAttribute("loggedFundType"))){

            %>
            <option value=<%=tblMasterjournals.getJournalNo()%>><%=tblMasterjournals.getJournalName()%></option> 
            
             <%  } } %>
        </select>
</div>
                
<script>
$('#selectFilter').change(function(){
    var trs = $('#journaln tr');
 
    if(this.value == -1){
         trs.show(); 
       
    }else{
       var $el = $('.'+this.value);
       trs.not($el).hide();
     
       $el.show();       
    }
});
</script>   
</div>  
<br><br>
</div> 
        <table class="table scroll table-list-search" style="border: solid 2px #cccccc;">
            <thead style="text-align:left">
                <tr>
                   <th style="text-align:left; font-size:12px; color: black">JOURNAL NAME</th>
                   <th style="text-align:left; font-size:12px; color: black">ACCOUNT NAME</th>
                   <th style="text-align:left; font-size:12px; color: black">ACCOUNT NO</th>
                   <th style="text-align:left; font-size:12px; color: black">PROCESS</th>
                   <th></th>
                </tr>
            </thead>
            <tbody style="text-align:center" id="journaln">
                <%

                    MasterJournalsService as = new MasterJournalsService();
                    List users = as.listMappedAccountJournalmapping();
                    for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                       TblAccountJournalmapping us = (TblAccountJournalmapping) iterator.next();
                       if(us.getTblFundtypes().getId().equals(session.getAttribute("loggedFundType"))){
                %>
                
                 <tr class="<%=us.getTblMasterjournals().getJournalNo()%>">
                  
                    <td style="text-align:left;"><%=us.getTblMasterjournals().getJournalName()%></td>
                    <td style="text-align:left;"><%= us.getTblMasteraccounts().getAccountName()%></td>
                    <td style="text-align:left;"><%= us.getTblMasteraccounts().getAccountNo()%></td>
                    <td style="text-align:left;"><%= us.getProcess()%></td>
                    <td style="text-align:center">
                    <form name="editForm" action="Account_JournalEditController" method="post">
                    <input type="submit" value="Edit" name="editButton" class="btn btn-primary btn-xs custom" />
                    <input type="hidden" value="<%=us.getId()%>" name="searchValue" />     
                    <input type="hidden" value="<%=us.getTblMasteraccounts().getAccountNo()%>" name="searchValue1" />             
                    <input type="hidden" value="<%=us.getTblMasterjournals().getJournalNo()%>" name="searchValue2" />
                    <a href="Account_Journal_DeletePage.jsp?id=<%=us.getId()%>" class="btn btn-primary btn-xs custom">Delete</a>
                    </form>
                    </td>
                    
                <%  }
}%>

                
                
                </tr>
            </tbody>
        </table>
 </div>
                
                


<div>             

<div id="myModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<!-- Modal content-->
<div class="modal-content">
<div class="modal-body">
<form action="Account_JournalMappingController" method="post" class="form-horizontal">
 <legend style="width: 550px;"><h4 style="text-align: left;"><b>ACCOUNT JOURNALS MAPPING DETAILS</b></h4> </legend>   
    
    <div class="form-group">
    <label class="col-md-4 control-label"  style="text-align:left; font-size:12px; color: black">JOURNAL NAME</label>
    <div class="col-md-5">
        <select class="form-control input-sm" required="" id="JournalName" name="JournalName">  
        <option value="">SELECT</option>
            <%
              MasterJournalsService ms1 = new MasterJournalsService();
              List listjournals1= ms1.listMasterjournals();
              for (Iterator iterator = listjournals1.iterator();  iterator.hasNext();) {
                      TblMasterjournals as1 = (TblMasterjournals) iterator.next();
                      request.setAttribute("JournalName",as1);
                    if(as1.getTblFundtypes().getId().equals(session.getAttribute("loggedFundType"))){ 
            %>
        <option value=<%=as1.getJournalNo()%>><%= as1.getJournalName()%></option> 

        <%  }  }%>
    </select>
    </div>
    </div>
    
    <div class="form-group">
    <label class="col-md-4 control-label"  style="text-align:left; font-size:12px; color: black">PROCESS</label>
    <div class="col-md-5">
    <select class="form-control input-sm" id="Process" name="Process">
        <option>Credit</option>
        <option>Debit</option>
    </select>
    </div>
    </div>  

    <div class="form-group">
    <label class="col-md-4 control-label" for="sel1" style="text-align:left; font-size:12px; color: black">ACCOUNT NAME</label>
    <div class="col-md-5">
        <select class="form-control input-sm" required="" id="AccountName" name="AccountName" >  
        <option value="">SELECT</option>
            <%
                masterAccountsService ds = new masterAccountsService();
                List listDesig = ds.listMasterAccounts();
                for (Iterator iterator = listDesig.iterator(); iterator.hasNext();) {
                    TblMasteraccounts ass = (TblMasteraccounts) iterator.next();
                    request.setAttribute("AccountName",ass);
                     if(ass.getTblFundtypes().getId().equals(session.getAttribute("loggedFundType"))){
             %>
        <option value=<%=ass.getAccountNo()%>><%= ass.getAccountName()%></option> 

             <%  }}  %>
    </select>
    <!-- Text input-->
    </div>
    </div>
    
<script>                  
$(document).ready(function() { 
    $('#AccountName').change(function() {
      $('#AccountNo').val($('#AccountName').val());
    });
});
</script>
    <div class="form-group">
    <label class="col-md-4 control-label"  style="text-align:left; font-size:12px; color: black">ACCOUNT NO</label> 
    <div class="col-md-5">
    <input id="AccountNo" name="AccountNo"  value="" type="text" placeholder="" class="form-control input-sm" required="" style="padding-left:10px">
    </div>
    </div> 
    <div class="form-group">
    <label class="col-md-4 control-label"  style="text-align:left; font-size:12px; color: black">STATUS</label>
    <div class="col-md-5">
    
        <select class="form-control input-sm" id="status" name="status" readonly="true">  
          <option>Active</option>
        </select>
    </div>
    </div>

    <div class="form-group">
    <div class="col-md-12">
    <div>
                       
    <input type="submit" class="btn btn-primary btn-sm custom" value="SAVE">
    &nbsp;
    <a href="Account_Journal_ManagePage.jsp"  class="btn btn-primary btn-sm custom">BACK</a> 
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