 <%@page import="service.UserRolesService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblUserroles" %>
<!DOCTYPE html>
<html>
     <style>.custom {width: 50px !important;}</style>
      <% 
        int id = Integer.parseInt(request.getParameter("id"));
        UserRolesService acs = new UserRolesService();
        TblUserroles usr = acs.searchUserRoles(id);
        if (usr != null) {

    %>

    <form id="togglingForm" onsubmit="return confirm('Do you really want to delete the Roles ?');" class="form-horizontal" style="width:800px" method="post" action="userRolesDeleteController">

        <!-- Form Name -->
        <legend><h4 style="text-align: left;"><b>DELETE ROLE</b></h4></legend>
<br>
        <!-- Text input-->
<div class="form-group" hidden="true">
<label class="col-md-4 control-label" style="text-align:left">ID</label>
<div class="col-lg-4">
                    <input id="id" name="id" type="text" readonly="true" value="<% out.println(usr.getId()); %>"   class="form-control input-sm" required="">
                </div>
                 </div>
  <div class="form-group">
<label class="col-md-4 control-label" style="text-align:left">Description</label>
<div class="col-lg-4">
                    <input id="description" name="description" readonly="true" value="<% out.println(usr.getDescription()); %>" type="text"  class="form-control input-sm" required="" >
                </div>
        </div>

        <div class="btn">
                       <div class="col-md-5">
                       <div style="padding-left:0px">
                          
                            <input type="submit" class="btn btn-primary btn-xs"value="Delete"/>
                            &nbsp;
                            <a href="UserRole_ManagePage.jsp"  class="btn btn-primary btn-xs">Back</a>
                             
                        </div>
                        </div>
                        </div>
        </form>

    <%  }else{  %>
        Invalid Designation
    <%  }  %>
</html>




