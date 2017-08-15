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
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
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
<br><br>
        <div class="row">


<!--   search input -->
   <div class="row">
    <div class="col-md-5">  
        <div class="input-group add-on">
        <input type="text" class="form-control" placeholder="Search" name="srch-term" id="system-search">
        <div class="input-group-btn">
        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
        </div>
        </div>
    </div>
   </div>
        <div class="row">
            <div class="col-md-2">
                <br /><br><br> 

            </div>
        </div> 
        	 <table class="table scroll table-list-search">
            <thead>
                <tr>
                    <th >PF No</th>
                    
                    <th >Last name</th>
                    <th >Username</th>
                 
                    <th style="text-align: center" >Designation</th>
                    <th style="text-align: center">Mobile No</th>
                    <th style="text-align: right">Status</th>
                   
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
                    <td  style="text-align: left"><%= us.getPfNo() %></td>
                    
                    <td style="text-align: left"> <%= us.getLastName() %></td>
                    <td style="text-align: left"><%= us.getUserName() %></td>
                    <td style="text-align: left"><%= us.getTblDesignations().getDescription()%></td>
                    <td  style="text-align: left"><%= us.getMobileNo() %></td>
                    <td style="text-align: right"><%= us.getStatus() %></td>
        
                    
                <%  }  %>
          
                
                
                </tr>
            </tbody>
        </table>
        </div>
    </div>
                


<div>             

<div id="myModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<!-- Modal content-->
<div class="modal-content">
<div class="modal-body">
<form action="ReportGeneratorController" target="_blank" onsubmit="return validateForm()"  method="post" class="form-horizontal">

                    <legend style="width: 550px;"><h4 style="text-align: left;"><b>USER REPORT DETAILS</b></h4></legend>
       

    
    

                    
                        
    <div class="form-group">
    <label class="col-md-4 control-label"  style="text-align:left">DETAILS</label>
    <div class="col-md-5">
        <select class="form-control input-sm" id="users" name="UserVl">
                    <option >All users</option>
                    <option>Active</option>
                    <option>In-Active</option>
                    <option>Deceased</option>

        </select>
    </div>
        <code id="demoo"></code>
    </div> 
    

    <div class="form-group">
    <div class="col-md-12">
    <div>
        &nbsp; &nbsp;   &nbsp;     &nbsp;     &nbsp; &nbsp;
    <input type="submit" class="btn btn-primary btn-sm custom" value="Print">
    &nbsp;
    <a href="UserDetailsReportPage.jsp"  class="btn btn-primary btn-sm custom">Back</a>                    
    </div>
    </div>
    </div>

        
</form>

</div>
</div>
</div>
</div>
</div>               
                
 <br>               
                    
                
          <div class="row">
              <div class="col-md-2" >

<button class="btn btn-primary" data-toggle="modal"  style="margin-right: -1650px;" data-target="#myModal">
<span class="glyphicon glyphicon-plus-sign"></span> 
PRINT DETAILS
</button> 
</div>
</div>            
                
                
</html>
