<%-- 
    Document   : DemoPage
    Created on : Sep 20, 2016, 9:07:28 AM
    Author     : boc
--%>

<%@page import="model.TblUser"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.UserService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Fund Management Application</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
<script type="text/javascript" src="jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>







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
    width: 150px;
    /* text-align: left; */
}

table.scroll tbody {
    height: 200px;
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
<script>
    
    var $table = $('table.scroll'),
    $bodyCells = $table.find('tbody tr:first').children(),
    colWidth;

// Adjust the width of thead cells when window resizes
$(window).resize(function() {
    // Get the tbody columns width array
    colWidth = $bodyCells.map(function() {
        return $(this).width();
    }).get();
    
    // Set the width of thead columns
    $table.find('thead tr').children().each(function(i, v) {
        $(v).width(colWidth[i]);
    });    
}).resize(); // Trigger resize handler
    
    
</script>
    
    
    
<table class="scroll table-bordered">
    <thead>
        <tr>
                    <th style="text-align:center">PF No</th>
                    
                    <th style="text-align:center">Last Name</th>
                    <th style="text-align:center">User Name</th>
                 
                    <th style="text-align:center">Designation</th>
                    <th style="text-align:center">Mobile No</th>
                    <th style="text-align:center">Status</th>
                    <th></th>
        </tr>
    </thead>
<tbody style="text-align:left;" >
                <%
                    UserService  as = new UserService();
                    List users = as.listUsers();
                    for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                        TblUser us = (TblUser) iterator.next();
                %>
                <tr>
                    <td  style="text-align: center"><%= us.getPfNo() %></td>
                    
                    <td style="text-align: center"> <%= us.getLastName() %></td>
                    <td style="text-align: center"><%= us.getUserName() %></td>
                    <td style="text-align: center"><%= us.getTblDesignations().getDescription()%></td>
                    <td  style="text-align: center"><%= us.getMobileNo() %></td>
                    <td style="text-align: center"><%= us.getStatus() %></td>
                    <td style="text-align: center">
                    <form name="editForm" action="userEditController" method="post">
                    <input type="submit" value="Edit" name="editButton" class="btn btn-primary btn-xs custom" />
                    <input type="hidden" value="<%= us.getTblDesignations().getId()%>" name="searchValue1" />             
                        <input type="hidden" value="<%=us.getUserName()%>" name="searchValue" />
                        <a href="User_DeletePage.jsp?id=<%=us.getUserName()%>" class="btn btn-primary btn-xs custom">Delete</a>
                       
                    </form>  
                    </td>
                    
                <%  }  %>
          
                
                
                </tr>
            </tbody>
    
</table>   
    
    
    
    
    
    
    
    
    
</body>
</html>