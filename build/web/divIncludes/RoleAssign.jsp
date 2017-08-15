<%-- 
    Document   : role assign
    Created on : Jun 17, 2016, 9:08:09 AM
    Author     : boc
--%>
<%@page import="model.TblRoleassign"%>
<%@page import="model.TblUser"%>
<%@page import="service.UserService"%>
<%@page import="model.TblUserroles"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.UserRolesService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <body>
 <div class="row" >
<div class="col-md-2">

<button class="btn btn-primary" style="margin-bottom: -70px" data-toggle="modal"  data-target="#myModal">
<span class="glyphicon glyphicon-plus-sign"></span> 
ASSIGN ROLE TYPE
</button> 
    
</div>
</div>    
 <br><br><br><br>

 <div>
   <div>   
 <div>
 <div class="row">
<div class="form-group">
<label class="col-md-2 control-label" style="text-align:left; font-size:12px; color: black"">ROLE TYPE</label> 
<div class="col-md-3">
    
        <select class="form-control input-sm" id="selectFilter" name="role">
            <option value="-1">SELECT</option>
                  <%    UserRolesService roleSer = new UserRolesService();
                    List role = roleSer.listUserRoles();
                  
                  for (Iterator iterator = role.iterator(); iterator.hasNext();) {
                     TblUserroles tbluserroles = (TblUserroles) iterator.next();
                     request.setAttribute("role",tbluserroles);
                     System.out.println("test66"+tbluserroles.getId());
                    %>
                    <option value=<%=tbluserroles.getId()%>><%= tbluserroles.getDescription()%></option> 
                    <% System.out.println("test88"+tbluserroles.getId());%>
                <%  }  %>
        </select>
</div>
                
<script>
$('#selectFilter').change(function(){
    var trs = $('#roleTypeAssign tr');
 
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
<div class="row" align="center">
             
        
        <table class="table scroll table-list-search" style="width:60%; border: solid 2px #cccccc; align-content: center">
    <thead style="text-align:left">
        <tr>
           <th style="text-align:left; font-size:12px; color: black">PF NUMBER</th> 
           <th style="text-align:left; font-size:12px; color: black">USER ROLE</th>
           <th></th>
        </tr>
    </thead>
    <tbody style="text-align:left" id="roleTypeAssign">
        <%
            UserRolesService as = new UserRolesService ();
            List users1 = as.listassignRoles();
            for (Iterator iterator = users1.iterator(); iterator.hasNext();) {
                TblRoleassign us = (TblRoleassign) iterator.next();
        %>
        <tr class="<%= us.getTblUserroles().getId()%>">

             <td style="width: 30%"><%= us.getTblUser().getPfNo()%></td>
             <td style="width: 60%"><%= us.getTblUserroles().getDescription()%></td>
             <td style="width: 20%; text-align: left">
            <form name="editForm" action="RoleAssignEditController" method="post">
            <input type="submit" value="Edit" name="editButton" class="btn btn-primary btn-xs custom" />
            <input type="hidden" value="<%=us.getTblUser().getPfNo()%>" name="searchValue" />             
            <input type="hidden" value="<%=us.getTblUserroles().getId()%>" name="searchValue1" />
            <input type="hidden" value="<%=us.getId() %>" name="searchValue2" />
                   
                          
                    </form>  
                    </td>
                <%  }  %>
          
                
                
                </tr>

    </tbody>
</table>
</div> 
 </div> 
 </div>           
                
                
                
                
                
                
                
                
                
                
                
      
<div id="myModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<!-- Modal content-->
<div class="modal-content">
<div class="modal-body">
<form action="RoleAssignController" onsubmit="return validateForm()" id="add" name="roleAssign" method="post" class="form-horizontal">

                 <legend style="width: 550px;"><h4 style="text-align: left;"><b>USER ROLE ASSIGN </b></h4></legend>   
       

    
    
    
<div class="form-group" >
<label class="col-md-4 control-label"   style="text-align:left; font-size:12px; color: black">PF NUMBER</label>
<div class="col-md-5">

                
    <input type="text" required="" class="form-control input-sm"id="pfnom" name="pfno">          
    </div>
<code id="demo"></code>
    </div> 
  
      
    <div class="form-group">
    <label class="col-md-4 control-label"   style="text-align:left; font-size:12px; color: black">ROLE</label>
    <div class="col-md-5">
        <select class="form-control input-sm" required="" id="selectFilter" name="role">
            <option value="">SELECT</option>
                  <%   
                  
                  for (Iterator iterator = role.iterator(); iterator.hasNext();) {
                     TblUserroles tbluserroles = (TblUserroles) iterator.next();
                     request.setAttribute("role",tbluserroles);
                     System.out.println("test66"+tbluserroles.getId());
                    %>
                    <option value=<%=tbluserroles.getId()%>><%= tbluserroles.getDescription()%></option> 
                    <% System.out.println("test88"+tbluserroles.getId());%>
                <%  }  %>
        </select>
    </div>
        <code id="demoo"></code>
    </div> 
                  
                 

    <div class="form-group">
    <div class="col-md-12">
    <div>
        &nbsp;  &nbsp;   &nbsp;     &nbsp;     &nbsp; &nbsp;
    <input type="submit" class="btn btn-primary btn-sm custom" value="Save">
    &nbsp;
    <a href="RoleAssignPage.jsp"  class="btn btn-primary btn-sm custom">Back</a>                    
    </div>
    </div>
    </div>
        
<script>

function validateForm() {
    var x = document.forms["roleAssign"]["pfno"].value;
    var y = document.forms["roleAssign"]["role"].value;
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
