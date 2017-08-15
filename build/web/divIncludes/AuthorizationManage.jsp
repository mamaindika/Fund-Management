<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service. TransactionService"%>
<%@page import="model. TblTransactionsdetails" %>
<%@page import="model. TblMasterjournals" %>
<%@page import="model. TblTransactiontype" %>
<html>
    <br>
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
                    <th style="text-align:left; font-size:12px; color: black">TRANSACTION DESCRIPTION</th>
                    <th style="text-align:left; font-size:12px; color: black">TRANSACTION TYPE</th>
                    <th style="text-align:left; font-size:12px; color: black">TRANSACTION AMOUNT</th>
                    <th style="text-align:left; font-size:12px; color: black">TRANSACTION DATE</th>
                    <th style="text-align:left; font-size:12px; color: black">STATUS</th>
                    <th style="text-align:left; font-size:12px; color: black">CREATED USER</th>
                    <th></th>
                </tr>
            </thead>
            <tbody style="text-align:left">
                <%
                    TransactionService  as = new TransactionService();
                    List users = as.PendingTransactionsList();
                    for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                        TblTransactionsdetails us = (TblTransactionsdetails) iterator.next();
                        if(us.getTblFundtypes().getId().equals(session.getAttribute("loggedFundType"))){
                %>
                <tr>
                    <td style="text-align:left;"><%= us.getTransactionDescription()%></td>
                    <td style="text-align:left;"><%= us.getTblTransactiontype().getTransactionDescription()%></td>
                    <td style="text-align:left"><%= us.getTransactionAmount()%></td>
                    <td style="text-align:left;"><%= us.getTransactionDate()%></td>
                    <td style="text-align:left;"><%= us.getStatus() %></td>
                    <td style="text-align:left;"><%= us.getCreatedUser()%></td>
                   <td style="text-align:center;">
                    <form  name="Form" action="AuthorizationEditController" method="post">
                    <input type="submit" value="View" name="editButton" class="btn btn-primary btn-xs custom" />
                    <input type="hidden" value="<%= us.getId()%>" name="searchValue" />             
                    <input type="hidden" value="<%= us.getTblAccountJournalmapping().getId()%>" name="searchValue1" />
                    <input type="hidden" value="<%= us.getTblTransactiontype().getTransactionTypeId()%>" name="searchValue2" />
                    
                    <%System.out.println("searchValue"+us.getId());%> 
                             <%System.out.println("searchValue1"+us.getTblAccountJournalmapping().getId());%>   
                                      <%System.out.println("searchValue2"+us.getTblTransactiontype().getTransactionTypeId());%>   
                    
                    </form>  
                    </td>
                    
                <% } }  %>

                
                
                </tr>
            </tbody>
    </table>
        </div>

</html>
