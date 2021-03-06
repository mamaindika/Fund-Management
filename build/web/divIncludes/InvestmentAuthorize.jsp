<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service. InvestmentTypesService"%>
<%@page import="model. TblInvestments"%>
<%@page import="model. TblMasterjournals" %>
<%@page import="model. TblTransactiontype" %>
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
            
            <br><br>

    <div class="col-md-5">  
        <div class="input-group add-on">
        <input type="text" class="form-control" placeholder="Search" name="srch-term" id="system-search">
        <div class="input-group-btn">
        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
        </div>
        </div>
    </div>

        </div>
        <br>
        <br>
         <table class="table table-bordered  table-list-search">
            <thead style="text-align:left">
                <tr>
                    
                    <th>Investment Type</th>
                    <th>Transaction Amount</th>
                    <th>Transaction Date</th>
                    <th>Status</th>
                    <th>Created User</th>
                    <th></th>
                </tr>
            </thead>
            <tbody style="text-align:left">
                <%
                    InvestmentTypesService  as = new InvestmentTypesService();
                    List users = as.listInvestments();
                    for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                        TblInvestments us = (TblInvestments) iterator.next();
                %>
                <tr>
                    <td><%= us.getTblInvestmenttypes().getDescription()%></td>
                 
                 
                   <td>
                    <form  name="Form" action="AuthorizationEditController" method="post">
                    <input type="submit" value="View" name="editButton" class="btn btn-primary btn-xs custom" />
                    <input type="hidden" value="<%= us.getId()%>" name="searchValue" />             
                    <input type="hidden" value="<%= us.getTblAccountJournalmapping().getId()%>" name="searchValue1" />
                    <input type="hidden" value="<%= us.getTblInvestmenttypes().getId()%>" name="searchValue2" />

                    </form>  
                    </td>
                    
                <%  }  %>

                
                
                </tr>
            </tbody>
    </table>
        </div>

</html>
