 <%@page import="service.InvestmentTypesService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblInvestmenttypes" %>
<!DOCTYPE html>
<html>
    <% 
        int id = Integer.parseInt(request.getParameter("id"));
        InvestmentTypesService acs = new InvestmentTypesService();
        TblInvestmenttypes usr = acs.searchAccount(id);
        if (usr != null) {

    %>
      <style>.custom {width: 50px !important;}</style>
    <form  onsubmit="return confirm('Do you really want to delete the investment ?');" class="form-horizontal" style="width:800px" method="post" action="investmentTypeDeleteController">

        <!-- Form Name -->
        <legend><h4 style="text-align: left;"><b>DELETE INVESTMENT TYPE</b></h4></legend>
<br> 
        <!-- Text input-->
<div class="form-group" hidden="true">
<label class="col-md-4 control-label" style="text-align:left">ID</label>
<div class="col-lg-4">
                    <input id="id" name="id" type="text" readonly="true" value="<% out.println(usr.getId()); %>"   class="form-control input-sm" required="">
                </div>
                 </div>
                
 <div class="form-group">
<label class="col-md-4 control-label" style="text-align:left; font-size:12px; color: black">DESCRIPTION</label>
<div class="col-lg-4">
                    <input id="description" name="description" readonly="true" value="<% out.println(usr.getDescription()); %>" type="text"  class="form-control input-sm" required="" >
                </div>
        </div>

 <div class="btn">
                       <div class="col-md-5">
                       <div style="padding-left:0px">
                          
                            <input type="submit" class="btn btn-primary btn-sm" value="DELETE"/>
                            &nbsp;
                            <a href="InvestmentTypesManagePage.jsp"  class="btn btn-primary btn-sm">BACK</a>
                             
                        </div>
                        </div>
                        </div>
        </form>

    <%  }else{  %>
        Invalid Designation
    <%  }  %>
</html>




