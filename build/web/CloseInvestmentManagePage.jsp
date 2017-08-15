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
    
 <link rel="stylesheet" href="bootstrap-datepicker/css/datepicker.css">
 <script src="bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
 <script src="bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
 
 
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
<header> 
<%@ include file="divIncludes/head.jsp" %>
</header> 
  <!--end of header bar-->
<div class="container-fluid text-center" style="background-color:#F0FFFF">  
  <div class="row content">
		<div class="col-md-2 sidenav" style="">
            <%@ include file="divIncludes/navi.jsp" %>

		</div>
 <div class="col-md-10" style="padding-left:20px; padding-right:20px">
<!-- Form Name -->
<legend><h4 style="text-align: left;"><b>CLOSE INVESTMENT</b></h4></legend>

<div class="row">

<%@page import="model.TblInvestmenttypes"%>
<%@page import="service.InvestmentTypesService"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service. TransactionService"%>
<%@page import="model. TblTransactionsdetails" %>
<%@page import="model. TblMasterjournals" %>
<%@page import="model. TblTransactiontype" %>
<%@page import="model. TblInvestments" %>
<html>
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
    <style>.custom {width: 50px !important;}</style>

    <div>
         
        <div class="row">

 <div class="form-group">
    <label class="col-md-2 control-label" style="text-align:left; font-size:12px; color: black">INVESTMENT TYPE</label> 
        <div class="col-md-3">
            <select class="form-control input-sm" id="selectFilter" name="InvestmentType">
            <option value="-1">SELECT</option>
            <%
            InvestmentTypesService InveSer = new InvestmentTypesService();
            List fund = InveSer.listInvestments();
                  
            for (Iterator iterator = fund.iterator(); iterator.hasNext();) {
                TblInvestmenttypes tblInvestmenttypes = (TblInvestmenttypes) iterator.next();
                request.setAttribute("InvestmentType",tblInvestmenttypes);
                System.out.println("test66"+tblInvestmenttypes.getId());
            %>
            <option value=<%=tblInvestmenttypes.getId()%>><%= tblInvestmenttypes.getDescription()%></option> 
            <% System.out.println("test88"+tblInvestmenttypes.getId());%>
            
            <%
            }    
            %>
            </select>
    </div>
                
                     <script>
$('#selectFilter').change(function(){
    var trs = $('#investment tr');
 
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
    <table class="table scroll table-list-search" style="border: solid 2px #cccccc;">
            <thead>
                <tr>
                    <th style="text-align:left; font-size:12px; color: black">DESCRIPTION</th>
                    <th style="text-align:left; font-size:12px; color: black">REFERENCE NO</th>
                   <th style="text-align:left; font-size:12px; color: black">INVEST DATE</th>
                   <th style="text-align:left; font-size:12px; color: black">MUTURE DATE</th>
                   <th style="text-align:left;  font-size:12px; color: black">AMOUNT</th>
                    <th style="text-align:left;  font-size:12px; color: black"></th>
                </tr>
            </thead>
            <tbody style="text-align:left" id="investment">
                <%
                    InvestmentTypesService  as = new InvestmentTypesService();
                    List users = as.InvestmentDetailsList();
                    for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                        TblInvestments us = (TblInvestments) iterator.next();
                %>
                <tr class="<%= us.getTblInvestmenttypes().getId()%>">
                  
                    <td style="text-align: left; font-size:12px; color: black"><%= us.getTblInvestmenttypes().getDescription()%></td>
                    <td style="text-align: left; font-size:12px; color: black"><%= us.getReferenceNo()%></td>
                    <td style="text-align: left; font-size:12px; color: black"><%= us.getInvestDate()%></td>
                    <td style="text-align: left; font-size:12px; color: black"><%= us.getMatureDate()%></td>
                    <td style="text-align:left; font-size:12px; color: black"><%= us.getAmount()%></td>
                    <td style="text-align: left; font-size:12px; color: black">
                    <form name="editForm" action="InvestmentViewController" method="post">
                    <input type="submit" name="action"  id="Close" value="Close" class="btn btn-primary btn-xs custom" />
                    <input type="hidden" value="<%= us.getId()%>" name="searchValue" />             
                    <input type="hidden" value="<%= us.getTblInvestmenttypes().getId()%>" name="searchValue1" />  
                    <input type="hidden" value="<%= us.getTblAccountJournalmapping().getId()%>" name="searchValue2" />  
                    <%System.out.println("searchValue"+us.getId());%>                  
                    </form>
                    </td>
                <%  }  %>
                </tr>
            </tbody>
    </table>
</div>
</html>
</div>
</div>
</div>
                 <br><br><br><br><br><br><br><br><br><br> <br><br><br> <br>
</div>
<!-- start footer here--> 

<div id="footer" style="background-color: navy">
  <%@ include file="divIncludes/footer.jsp" %>
</div>
</body>
</html>

