<%-- 
    Document   : deleteMasterAccounts
    Created on : May 11, 2016, 11:21:39 AM
    Author     : Boc
--%>

<%@page import="service.masterAccountsService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblMasteraccounts" %>
<!DOCTYPE html>
<html>
    <style>.custom {width: 50px !important;}</style>
    <% 
        int accountNo = Integer.parseInt(request.getParameter("accountNo"));
        masterAccountsService acs = new masterAccountsService();
        TblMasteraccounts usr = acs.searchAccount(accountNo);
        if (usr != null) {

    %>

    <form  onsubmit="return confirm('Do you really want to delete the Master Accounts ?');"  class="form-horizontal" style="width:1000px" method="post" action="deleteMasterAccountsController">

 
        <!-- Form Name -->
     <legend><h4 style="text-align: left;"><b>DELETE MASTER ACCOUNT</b></h4></legend>
   
      
            
                 <div class="form-group">
                    <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">ACCOUNT NO</label> 
                <div class="col-md-3">
                     <input id="accountNo" name="accountNo" readonly="true" type="text" value="<% out.println(usr.getAccountNo()); %>"   class="form-control input-sm" required="">  
                </div>
                </div>
                
                <div class="form-group">
                    <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">ACCOUNT NAME</label> 
                <div class="col-md-3">
                    <input id="accountName" name="accountName" readonly="true" value="<% out.println(usr.getAccountName()); %>" type="text"  class="form-control input-sm" required="" style="padding-left:10px">
                </div>
               </div>
                
                <div class="form-group">
                    <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">LEDGER NO</label> 
                <div class="col-md-3">
                    <input id="currentLedger" name="currentLedger" readonly="true" value="<% out.println(usr.getCurrentLedger()); %>" type="text"  class="form-control input-sm" required="" style="padding-left:10px">
                </div>
               </div>
                
               <div class="form-group">
                     <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">ACCOUNT TYPE</label> 
                <div class="col-md-3">
                   <select class="form-control input-sm" readonly="true" id="typeOfAccount"   name="typeOfAccount">
                      <option><% out.println(usr.getTypeOfAccount()); %></option>
                       <option>Assets</option>
                       <option>Equity</option>
                       <option>Expenses</option>
                       <option>Income</option>
                       <option>Liabilities</option> 
                  </select>
                </div> 
               </div> 
                
                <div class="form-group">
                   <label class="col-md-2 control-label" for="status" style="text-align:left; font-size:12px; color: black">STATUS</label> 
                 <div class="col-md-3">
                   <select class="form-control input-sm" readonly="true" id="status" name="status">
                      <option><% out.println(usr.getStatus()); %> </option>
                      <option>Active</option>
                      <option>Deceased</option>
                      <option>In-Active </option>
                   </select>
                 </div>
                </div>
                
               
      
            
                         <div class="form-group">
                         <div class="col-md-7">
                        <div style="padding-left:0px;">
                            
                             
                              <input type="submit" class="btn btn-primary btn-sm"  value="DELETE"/>
                              &nbsp; 
                              <a href="MasterAccounts_ManagePage.jsp"  class="btn btn-primary btn-sm">BACK</a>
                            </div>
                        </div>
                        </div>
        </form>

    <%  }else{  %>
        Invalid Master Account
    <%  }  %>
</html>





