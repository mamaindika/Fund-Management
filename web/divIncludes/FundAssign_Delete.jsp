 <%@page import="model.TblFundtypes"%>
<%@page import="service.UserService"%>
<%@page import="model.TblUser"%>
<%@page import="model.TblFunduserassign"%>
<%@page import="service.FundTypesService"%>
<%@page import="service.DesignationService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblDesignations" %>
<!DOCTYPE html>
<html>
    <body>
     <style>.custom {width: 50px !important;}</style>
    <% 
        int id = Integer.parseInt(request.getParameter("id"));
        
        FundTypesService acs = new FundTypesService();
        TblFunduserassign usr = acs.searchAssignFund(id);
        
        
        TblFundtypes nmm = acs.getFundByfundId(usr.getTblFundtypes().getId());
        
        UserService nme = new UserService();
        TblUser nm = nme.getUserByPFNO(usr.getTblUser().getPfNo());
        
        
        
//        FundTypesService typ = new FundTypesService();
//        TblFundtypes type = typ.searchUserFundType(usr.getStatus());
//        

        
        if (usr != null) {

    %>
    <legend><h4 style="text-align: left;"><b>DELETE FUND ASSIGN</b></h4></legend>
<br>
<div>
    <form id="togglingForm" onsubmit="return confirm('Do you really want to delete the assigned fund type ?');" class="form-horizontal"  method="post" action="fundAssignDeleteController">

        <div class="form-group" hidden="true">
            <label class="col-md-4 control-label"  style="text-align:left">ID</label> 
                <div class="col-lg-4">
                    <input id="id" name="id" type="text" readonly="true" value="<% out.println(usr.getId()); %>"   class="form-control input-sm" required="">
                </div>
        </div>
                
        <div class="form-group"  >
            <label class="col-md-3 control-label" style="text-align:left; font-size:12px; color: black">PF NUMBER</label> 
                <div class="col-lg-3">
                    <input id="description" name="description" readonly="true" value="<%out.println(usr.getTblUser().getPfNo()); %>" type="text"  class="form-control input-sm" required="">
                </div>
        </div>
      
        
        <div class="form-group"  >
            <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">NAME</label> 
                <div class="col-lg-3">
                    <input id="description" name="description" readonly="true" value=" <%out.println(nm.getFirstName()); %> <%out.println(nm.getLastName()); %>" type="text"  class="form-control input-sm" required="">
                </div>
        </div>
                 
        <div class="form-group"  >
            <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">FUND TYPE</label> 
                <div class="col-lg-3">
                    <input id="description" name="description" readonly="true" value="<%out.println(nmm.getDescription()); %>" type="text"  class="form-control input-sm" required="">
                </div>
        </div>         
                
<!--                <div class="form-group">
            <label class="col-md-2 control-label"  style="text-align:left">FUND TYPE</label> 
                <div class="col-md-3">
                    <input id="description" name="description" readonly="true" value="" type="text"  class="form-control input-sm" required="">
                </div>
        </div>-->
                      
                

     <div class="btn">
                       <div class="col-md-5">
                       <div style="margin-left: -240px;">
                           
                            <input type="submit" class="btn btn-primary btn-sm" value="DELETE"/>
                            &nbsp;
                            <a href="FundAssign_ManagePage.jsp"  class="btn btn-primary btn-sm">BACK</a>
                             
                        </div>
                        </div>
                        </div>
        </form>

    <%  }else{  %>
        Invalid Designation
    <%  }  %>
    
    </body>
</html>




