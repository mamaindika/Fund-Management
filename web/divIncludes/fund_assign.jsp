<%-- 
    Document   : role assign
    Created on : Jun 17, 2016, 9:08:09 AM
    Author     : boc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblFunduserassign"%>
<%@page import="model.TblFundtypes"%>
<%@page import="service.FundTypesService"%>
<%@page import="model.TblRoleassign"%>
<%@page import="model.TblUser"%>
<%@page import="service.UserService"%>
<%@page import="model.TblUserroles"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.UserRolesService"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fund Management Application</title>
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

<body>

    
<div class="row">
<div class="col-md-2">

<button class="btn btn-primary" data-toggle="modal"  data-target="#myModal">
<span class="glyphicon glyphicon-plus-sign"></span> 
ASSIGN FUND TYPE
</button> 
</div>
</div>
 
  
<br><br>   
 <%
    if(null!=request.getAttribute("errorMessage"))
{%>
    
<h3 style="  font-size: 15px">
<kbd>
        <%out.println(request.getAttribute("errorMessage"));%>
</kbd>        
</h3>

<%        
 }

%>     
  
<div>
<div>
  <div>   
 <div>
 <div class="row">
<div class="form-group">
<label class="col-md-2 control-label" style="text-align:left; font-size:12px; color: black">FUND TYPE</label> 
<div class="col-md-3">
    
        <select class="form-control input-sm" id="selectFilter" name="fund">
                    <option value="-1">SELECT</option>
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
                
<script>
$('#selectFilter').change(function(){
    var trs = $('#fundAssign tr');
 
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
</div>

  

     
 
<div>     
    <table class="table scroll table-list-search" style=" border: solid 2px #cccccc;">
            <thead>
                <tr >
                   <th style="text-align:left; font-size:12px; color: black">PF NUMBER</th>
                   <th style="text-align:left; font-size:12px; color: black">LAST NAME</th>
                   <th style="text-align:left; font-size:12px; color: black">FUND TYPE</th>
                   <th style="text-align:left; font-size:12px; color: black">STATUS</th>
                   <th></th>
                </tr>
            </thead>
            <tbody style="text-align: left" id="fundAssign">
                <%

                    FundTypesService as = new FundTypesService ();
                    List users1 = as.listassignFunds();
                    for (Iterator iterator = users1.iterator(); iterator.hasNext();) {
                       TblFunduserassign us = (TblFunduserassign) iterator.next();
                %>
                 <tr class="<%= us.getTblFundtypes().getId()%>">
                  
                    <td><%= us.getTblUser().getPfNo()%></td>
                    <td> <%= us.getTblUser().getLastName()%></td>
                    <td><%= us.getTblFundtypes().getDescription()%></td>    
                    <td><%= us.getTblUser().getStatus()%></td>
                    
                    <td style="text-align: center">
                    <form name="editForm" action="FundAssignEditController" method="post">
                    <input type="submit" value="Edit" name="editButton" class="btn btn-primary btn-xs custom" />
                    <input type="hidden" value="<%=us.getTblUser().getPfNo()%>" name="searchValue" />             
                    <input type="hidden" value="<%=us.getTblFundtypes().getId()%>" name="searchValue1" />
                    <input type="hidden" value="<%=us.getId() %>" name="searchValue2" />
                    <a href="FundAssign_DeletePage.jsp?id=<%=us.getId()%>" class="btn btn-primary btn-xs custom">Delete</a>
                       
                    </form>  
                    </td>
  
                <%  }  %>

                
                
                </tr>
            </tbody>
        </table>
                

</div>
</div>  
  
</div>               
                












<div>             

<div id="myModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<!-- Modal content-->
<div class="modal-content">
<div class="modal-body">
<form action="FundAssignController" onsubmit="return validateForm()" id="add" name="fundAssign" method="post" class="form-horizontal">

                    <legend style="width: 550px;"><h4 style="text-align: left;"><b>USER FUND TYPE ASSIGN</b></h4></legend>
       

    
    
    
    
<div class="form-group">
<label class="col-md-4 control-label"  style="text-align:left; font-size:12px; color: black">PF NUMBER</label>
<div class="col-md-5">
   
    <input type="text" required="" class="form-control input-sm"id="pfno" name="pfno">      
    </div>
<code id="demo"></code>
    </div> 
   
                    
                        
    <div class="form-group">
    <label class="col-md-4 control-label"  style="text-align:left; font-size:12px; color: black">FUND TYPE</label>
    <div class="col-md-5">
        <select class="form-control input-sm" id="selectFilter" required="" name="fund">
                    <option value="">SELECT</option>
                    <%

                  
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
        <code id="demoo"></code>
    </div> 
    

    <div class="form-group">
    <div class="col-md-12">
    <div>
        &nbsp; &nbsp;   &nbsp;     &nbsp;     &nbsp; &nbsp;
    <input type="submit" class="btn btn-primary btn-sm" value="SAVE">
    &nbsp;
    <a href="FundAssign_ManagePage.jsp"  class="btn btn-primary btn-sm ">BACK</a>                    
    </div>
    </div>
    </div>
<script>

function validateForm() {
    var x = document.forms["fundAssign"]["pfno"].value;
    var y = document.forms["fundAssign"]["fund"].value;
    if (x == null || x == "") {
        document.getElementById("demo").innerHTML = "Invalid";
        return false;
    }else if(y == "-1" || y == "SELECT"){
        document.getElementById("demoo").innerHTML = "Invalid";
        return false;
    }
}
</script>
        
</form>

</div>
</div>
</div>
</div>
</div>               
                
                
                
                
          











                
                
                
                
                
                
                
                
                
                
    </body>
</html>
