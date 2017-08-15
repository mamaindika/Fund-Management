<%@page import="service.FundTypesService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblFundtypes" %>
<!DOCTYPE html>
<html>
    <% 
        int id = Integer.parseInt(request.getParameter("id"));
        FundTypesService acs = new FundTypesService();
        TblFundtypes usr = acs.searchAccount(id);
        if (usr != null) {

    %>

    <form id="togglingForm" onsubmit="return confirm('Do you really want to delete the Fund ?');" class="form-horizontal" style="width:800px" method="post" action="fundTypeDeleteController">
 <!-- Form Name -->
        <legend><h4 style="text-align: left;"><b>DELETE FUND TYPE</b></h4></legend>
<br> 
        <!-- Text input-->
    
        <div class="form-group" hidden="true">
            <label class="col-md-4 control-label"  style="text-align:left">ID</label> 
                <div class="col-lg-4">
                    <input id="id" name="id" type="text" readonly="true" value="<% out.println(usr.getId()); %>"  class="form-control input-sm">
                </div>
         </div>
                 
        
          
                
                <div class="form-group"  >
            <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">DESCRIPTION</label> 
                <div class="col-lg-4">
                    <input id="description" readonly="true" name="description" value="<% out.println(usr.getDescription()); %>" type="text"  class="form-control input-sm" >
                </div>
                
        </div>
                  

  <div class="btn">
                       <div class="col-md-5">
                       <div style="margin-left: -140px;">
                           
                          <input id="submit" type="submit" class="btn btn-primary btn-sm" value="DELETE"/>
                            &nbsp;
                             <a href="FundType_ManagePage.jsp"   class="btn btn-primary btn-sm">BACK</a>
                                   </div>
                       </div>
</div> 
               
                
                
              
                
                
        </form>

    <%  }else{  %>
        Invalid Designation
    <%  }  %>
    

    
    
    
</html>




