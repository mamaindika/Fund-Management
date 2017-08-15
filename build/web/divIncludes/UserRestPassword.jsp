<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.UserService"%>
<%@page import="model.TblUser" %>
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
    
    
<!--    for search -->
    <script>
        $(document).ready(function() {
    var activeSystemClass = $('.list-group-item.active');

    //something is entered in search form
    $('#system-search').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-list-search tbody');
        var tableRowsClass = $('.table-list-search tbody tr');
        $('.search-sf').remove();
        tableRowsClass.each( function(i, val) {
        
            //Lower text for case insensitive
            var rowText = $(val).text().toLowerCase();
            var inputText = $(that).val().toLowerCase();
            if(inputText != '')
            {
                $('.search-query-sf').remove();
                tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
                    + $(that).val()
                    + '"</strong></td></tr>');
            }
            else
            {
                $('.search-query-sf').remove();
            }

            if( rowText.indexOf( inputText ) == -1 )
            {
                //hide rows
                tableRowsClass.eq(i).hide();
                
            }
            else
            {
                $('.search-sf').remove();
                tableRowsClass.eq(i).show();
            }
        });
        //all tr elements are hidden
        if(tableRowsClass.children(':visible').length == 0)
        {
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No users found.</td></tr>');
        }
    });
});
        </script>
        <style>
            .custom {
    width: 50px !important;
}
        </style>
  <div id="content">

        <div class="row">

            <br><br>
<!--   search input -->
   <div class="row">
    <div class="col-md-5">  
        <div class="input-group add-on">
        <input type="text" class="form-control" placeholder="Username" name="srch-term" id="system-search">
        <div class="input-group-btn">
        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
        </div>
        </div>
    </div>
   </div>
        <div class="row">
            <div class="col-md-2">
                <br> <br> 

            </div>
        </div> 
        	 <table  class="table scroll table-list-search" style=" border: solid 2px #cccccc;">
            <thead>
                <tr>
                    <th style="text-align:left; font-size:12px; color: black">PF NUMBER</th>
                    
                    <th style="text-align:left; font-size:12px; color: black">LAST NAME</th>
                    <th style="text-align:left; font-size:12px; color: black">USER NAME</th>
                 
                    <th style="text-align:left; font-size:12px; color: black">DESIGNATION</th>
                    <th style="text-align:center; font-size:12px; color: black">MOBILE NO</th>
                    <th style="text-align:center; font-size:12px; color: black">STATUS</th>
                    <th></th>
                </tr>
            </thead>
            <tbody style="text-align:left;" >
                <%
                    UserService  as = new UserService();
                    List users = as.listUser();
                    for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                        TblUser us = (TblUser) iterator.next();
                %>
                <tr>
                    <td  style="text-align: left"><%= us.getPfNo() %></td>
                    
                    <td style="text-align: left"> <%= us.getLastName() %></td>
                    <td style="text-align: left"><%= us.getUserName() %></td>
                    <td style="text-align: left"><%= us.getTblDesignations().getDescription()%></td>
                    <td  style="text-align: center"><%= us.getMobileNo() %></td>
                    <td style="text-align: center"><%= us.getStatus() %></td>
                    <td style="text-align: center">
                    <form name="editForm" onsubmit="return confirm('User   <%= us.getPfNo() %>   Password will be reset as his/her USERNAME ');" action="passwordRestController" method="post">
                  
                    <input type="hidden" value="<%= us.getUserName() %>" name="userId" /> 
                    <input type="hidden" value="<%= us.getPfNo() %>" name="pfNum" />  
                    <input type="submit" value="Rest password" name="editButton" class="btn btn-primary btn-xs" />
                    
                    </form>  
                    </td>
                    
                <%  }  %>
          
                
                
                </tr>
            </tbody>
        </table>
        </div>
    </div>
</html>