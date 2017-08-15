<%-- 
    Document   : editDesignation
    Created on : May 5, 2016, 1:47:53 PM
    Author     : Boc
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.FundTypesService"%>
<%@page import="model.TblFundtypes"%>
<%@page import="model.TblUser"%>
<%@page import="model.TblFunduserassign"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <style>.custom {width: 50px !important;}</style>
    <% TblUser acc = (TblUser) request.getAttribute("searchResult");
        TblFundtypes ac = (TblFundtypes) request.getAttribute("searchResult1");
        TblFunduserassign accc = (TblFunduserassign) request.getAttribute("searchResult2");
           if (acc != null) {
    %>
<style>
    .form_errorMsg{
    color: red;
    display: none;
}
    .custom {width: 50px !important;}
</style>

<form id="togglingForm" name="editDesignation" onsubmit="return formValidation()"  class="form-horizontal"  method="post" action="FundAssignUpdateController">
 
        <!-- Form Name -->
        <legend><h4 style="text-align: left;"><b>EDIT FUND ASSIGN</b></h4></legend>
        <br>  

         <div class="form-group" hidden="true">
            <label class="col-md-4 control-label"  style="text-align:left">ID</label> 
        <div class="col-lg-4">
            <input id="id" name="id" type="text" readonly="true" value="<% out.println(accc.getId()); %>"  class="form-control input-sm">
        </div>
</div>
        
        
        
        
<div class="form-group"  >
            <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">PF NUMBER</label> 
        <div class="col-lg-3">
            <input id="id" name="pfno" type="text" readonly="true" value="<% out.println(acc.getPfNo()); %>"  class="form-control input-sm">
        </div>
</div>

        
<div class="form-group"  >
            <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">NAME</label> 
       <div class="col-lg-3">
            <input id="id" name="id" type="text" readonly="true" value="<% out.println(acc.getFirstName()); %> <% out.println(acc.getLastName()); %>"  class="form-control input-sm">
        </div>
        
</div>
     
        
<div class="form-group"  >
            <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">FUND TYPE</label> 
        <div class="col-lg-3">
         <select class="form-control input-sm" name="fund">
                    <option><% out.println(ac.getDescription()); %></option>
                    <%

                  FundTypesService fundSer = new FundTypesService();
                    List fund = fundSer.listFundTypes();
                  for (Iterator iterator = fund.iterator(); iterator.hasNext();) {
                     TblFundtypes tblFundtypes = (TblFundtypes) iterator.next();
                     request.setAttribute("fund",tblFundtypes);
                     System.out.println("test66"+tblFundtypes.getId());
                    %>
                    <option value=<%=tblFundtypes.getId()%>><%= tblFundtypes.getDescription()%></option> 
                    <% System.out.println("test88"+tblFundtypes.getId());%>
                <%  }  %>
         </select>
        </div>
            <span class="col-md-4 form_errorMsg" id="msg1">PLEASE ADD YOUR FUND TYPE !</span>
</div>
 
        
     
         
         
  <div class="btn">
                       <div class="col-md-2">
                       <div style="margin-left: -240px;">
                           
                          <input id="submit" type="submit" class="btn btn-primary btn-sm" value=" SAVE "/>
                            &nbsp;
                             <a href="FundAssign_ManagePage.jsp"  class="btn btn-primary btn-sm">BACK</a>
                                   </div>
                       </div>
</div> 
     


         
         
         
         
         
         
         
         
         
         
         
         
         
<script>
                        
$(document).ready(function() { 
   	
 $("#submit").click(
            function () {
                if(formValidation()){
            }
            }            
        );
});
function formValidation(){
var description = document.editDesignation.description;
if(allLetter1(description)){
	return true;
	}
	else{
    return false;
	}
} 
function allLetter1(description)
{
    var letters = /^[A-Za-z\u0080-\u00FF\d\s\€]+$/;
    if(description.value.match(letters))
    {
	$('#msg1').css("display", "none");
        return true;
    }
    else
    {
	 $('#msg1').css("display", "block");
        //alert('Description must have alphabet characters only');
        description.focus();
        return false;
    }
}
</script>                  
                        
          </form>
  
    <%  }else{  %>
        Invalid Designation
    <%  }  %>
</html>


