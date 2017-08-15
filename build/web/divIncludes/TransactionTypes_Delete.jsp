<%@page import="service.TransactionService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblTransactiontype" %>
<!DOCTYPE html>
<html>
    <% 
        int id = Integer.parseInt(request.getParameter("id"));
        TransactionService acs = new TransactionService();
        TblTransactiontype usr = acs.searchAccount(id);
        if (usr != null) {

    %>

    <form id="togglingForm" onsubmit="return confirm('Do you really want to delete the Fund ?');" class="form-horizontal" style="width:800px" method="post" action="TransactionTypeDeleteController">
 <!-- Form Name -->
        <legend><h4 style="text-align: left;"><b>DELETE TRANSACTION TYPE</b></h4></legend>
<br> 
        <!-- Text input-->
    
        <div class="form-group" hidden="true">
            <label class="col-md-4 control-label"  style="text-align:left">ID</label> 
                <div class="col-lg-4">
                    <input id="id" name="id" type="text" readonly="true" value="<% out.println(usr.getTransactionTypeId()); %>"  class="form-control input-sm">
                </div>
         </div>
                 
        
          
                
                <div class="form-group"  >
            <label class="col-md-4 control-label"  style="text-align:left">Description</label> 
                <div class="col-lg-4">
                    <input id="description" readonly="true" name="description" value="<% out.println(usr.getTransactionDescription()); %>" type="text"  class="form-control input-sm" >
                </div>
                
        </div>
                  

  <div class="btn">
                       <div class="col-md-5">
                       <div style="padding-left:0px">
                           
                          <input id="submit" type="submit" class="btn btn-primary btn-xs" value="Delete"/>
                            &nbsp;
                             <a href="Transaction_Type_ManagePage.jsp"   class="btn btn-primary btn-xs">Back</a>
                                   </div>
                       </div>
</div> 
               
                
                
              
                
                
        </form>

    <%  }else{  %>
        Invalid Designation
    <%  }  %>
    

    
    
    
</html>




