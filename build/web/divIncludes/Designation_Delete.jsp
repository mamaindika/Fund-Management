 <%@page import="service.DesignationService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblDesignations" %>
<!DOCTYPE html>
<html>
    <body>
     <style>.custom {width: 50px !important;}</style>
    <% 
        String id = request.getParameter("id");
        DesignationService acs = new DesignationService();
        TblDesignations usr = acs.searchDesignations(id);
        if (usr != null) {

    %>
    <legend><h4 style="text-align: left;"><b>DELETE DESIGNATION</b></h4></legend>
<br>
<div>
    <form id="togglingForm" style="width:800px" onsubmit="return confirm('Do you really want to delete the designation ?');" class="form-horizontal"  method="post" action="designationDeleteController">

<div class="form-group" hidden="true">
<label class="col-md-4 control-label" style="text-align:left">ID</label>
<div class="col-lg-4">
                    <input id="id" name="id" type="text" readonly="true" value="<% out.println(usr.getId()); %>"   class="form-control input-sm" required="">
                </div>
                 </div>
  <div class="form-group">
<label class="col-md-3 control-label" style="text-align:left; font-size:12px; color: black">DESCRIPTION</label>
<div class="col-lg-4">
                    <input id="description" name="description" readonly="true" value="<% out.println(usr.getDescription()); %>" type="text"  class="form-control input-sm" required="" >
                </div>
        </div>

 <div class="btn">
                       <div class="col-md-3">
                       <div style="margin-left: -140px;">
                          
                            <input type="submit" class="btn btn-primary btn-sm"value="DELETE"/>
                            &nbsp;
                            <a href="Designation_ManagePage.jsp"  class="btn btn-primary btn-sm">BACK</a>
                             
                        </div>
                        </div>
                        </div>
        </form>

    <%  }else{  %>
        Invalid Designation
    <%  }  %>
    
    </body>
</html>




