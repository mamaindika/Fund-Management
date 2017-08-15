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
<legend style="text-align:left">VIEW INVESTMENT</legend>
    <div>
         
        <div class="row">
            
            <br><br>

 <div class="form-group">
    <label class="col-md-2 control-label" style="text-align:left">Investment Type</label> 
        <div class="col-md-3">
            <select class="form-control input-sm" id="selectFilter" name="InvestmentType">
                <option value="-1" >SELECT</option>
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
        <%  }  %>
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
<br><br><br>
</div>  
                <br><br>
        </div> 
         <table class="table table-bordered">
            <thead>
                <tr>
                   <th style="text-align:center">Description</th>
                   <th style="text-align:center">Reference No</th>
                   <th style="text-align:center">Invest Date</th>
                   <th style="text-align:center">Mature Date</th>
                   <th style="text-align:center">Amount</th>
                   <th></th>
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
                  
                    <td style="text-align:center"><%=us.getTblInvestmenttypes().getDescription()%></td>
                    <td style="text-align:center"><%=us.getReferenceNo()%></td>
                    <td style="text-align:center"><%=us.getInvestDate()%></td>
                    <td style="text-align:center"><%=us.getMatureDate()%></td>
                    <td style="text-align:center"><%=us.getAmount()%></td>
                    <td style="text-align:center">
                    <form name="editForm" action="InvestmentViewController" method="post">
                    <input type="submit" name="action"  id="View" value="View" class="btn btn-primary btn-xs custom" />
                    <input type="hidden" value="<%=us.getId()%>" name="searchValue" />             
                    <input type="hidden" value="<%=us.getTblInvestmenttypes().getId()%>" name="searchValue1" />  
                    <input type="hidden" value="<%=us.getTblAccountJournalmapping().getId()%>" name="searchValue2" />  
                    <%System.out.println("searchValue"+us.getId());%> 
                                       
                    </form>
                    </td>
                    
                <%  }  %>

                
                
                </tr>
            </tbody>
    </table>
        </div>

</html>
