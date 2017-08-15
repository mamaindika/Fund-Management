<%@page import="model.TblTransactiontype"%>
<%@page import="service.TransactionService"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.FundTypesService"%>
<%@page import="model.TblFundtypes" %>
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
    
    
    <style>
            .custom {
    width: 50px !important;
}
    </style>

<div class="row" >
<div class="col-md-2">

<button class="btn btn-primary" style="margin-bottom: -70px" data-toggle="modal"  data-target="#myModal">
<span class="glyphicon glyphicon-plus-sign"></span> 
ADD TRANSACTION TYPE
</button> 
    
</div>
</div>    
 <br><br><br><br><br>
        
        

        <div class="row" align="center">
                    
        <table class="table scroll table-list-search" style="width:60%; align-content: center">   
            <thead style="text-align:left">
                <tr>
                    
                    <th>Description</th>
                    <th colspan="2"></th>
                </tr>
            </thead>
            <tbody style="text-align:left">
                <%
                    TransactionService as = new TransactionService();
                    List users = as.listTransactionTypes();
                    for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                        TblTransactiontype us = (TblTransactiontype) iterator.next();
                        String rst = us.getTransTypeState();
                        System.out.println("fund error"+rst);
                        if(rst.equals("Active")){
                %>
                <tr>
                   
                    <td style="width: 60%"><%= us.getTransactionDescription()%></td>
                    
                    <td style="width: 40%; text-align: center">
                    <form name="editForm" action="TransactionTypeEditController" method="post">
                    <input type="submit" value="Edit" name="editButton" class="btn btn-primary btn-xs custom" />
                    <input type="hidden" value="<%=us.getTransactionTypeId() %>" name="searchValue" />
                   
                    <a href="TransactionType_DeletePage.jsp?id=<%=us.getTransactionTypeId()%>" class="btn btn-primary btn-xs custom">Delete</a>
                       
                    </form>  
                    </td>
                       
                <% }
                        else{}
                }  %>
          
                
                
                </tr>
            </tbody>
        </table>
        </div>
                
                
                
                
                
                
<div>
<div id="myModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<!-- Modal content-->
<div class="modal-content">
<div class="modal-body">
                    
                    
                    
                    
                    
                    <style>
     .form_errorMsg{

    
    color: red;
    display: none;

   


}
  
     .custom {width: 50px !important;}
 </style>
 
<form id="togglingForm"  method="post" name="addFundType"  onsubmit="return formValidation()" action="transactionTypeAddController"  class="form-horizontal" style="width:800px">
 
                        <!-- Form Name -->
                        <legend style="width: 550px;"><h4 style="text-align: left;"><b>ADD NEW TRANSACTION TYPE</b></h4></legend>
                        
                        <!-- Text input-->
     
                        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label"  style="text-align:left">TRANSACTION</label>
            <div class="col-md-5">
                    <input id="description" name="type" value="" type="text"  class="form-control input-sm"  >     
            </div>
                    <span class="col-md-1 form_errorMsg" id="msg1"><code>Invalid</code></span>
        </div>
                 
                        
         <div class="form-group">
            <div class="col-md-5">
                
                <div style="padding-left:220px;">
                    
                    <input id="submit"  type="submit" class="btn btn-primary btn-sm custom" value="Save"/>
                    &nbsp;
                    <a href="Transaction_Type_ManagePage.jsp"  class="btn btn-primary btn-sm custom">Back</a>          
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
	
	
	function formValidation()
{

var description = document.addFundType.description;


  	if(allLetter1(description)){
	return true;
	}
	else{
    return false;
	}
    
} 
function allLetter1(description)
{
    var letters = /^[A-Za-z\u0080-\u00FF\d\s\?]+$/;
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

                    <h2>
                        <%
                            String rMessage = request.getParameter("message");
                            if (rMessage == null) {
                                rMessage = "";
                            }
                            out.println(rMessage);

                        %>
                    </h2>

         
                    
                    
                    
                    
                    
                    
                    
                    
</div>      
</div>                     
</div>                      
</div>                     
</div>     
                
                
                
                
                
                
                
                
                
                
                
</html>