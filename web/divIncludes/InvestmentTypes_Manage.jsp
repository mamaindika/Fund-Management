<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.InvestmentTypesService"%>
<%@page import="model.TblInvestmenttypes" %>
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
ADD INVESTMENT TYPE
</button> 
    
</div>
</div>    
<br><br><br><br><br>     
       
      
      
      
      
      
      
      
    <div>
        <div class="row" align="center">
             
        
       <table class="table scroll table-list-search" style=" border: solid 2px #cccccc;">
            <thead style="text-align:left">
                <tr>
                    
                    <th style="text-align:left; font-size:12px; color: black" >DESCRIPTION</th>
                    <th colspan="2"></th>
                </tr>
            </thead>
            <tbody style="text-align:left">
                <%
                    InvestmentTypesService as = new InvestmentTypesService();
                    List users = as.listInvestments();
                    for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                        TblInvestmenttypes us = (TblInvestmenttypes) iterator.next();
                %>
                <tr>
                   
                    <td style="width: 80%; text-align:left;"><%= us.getDescription()%></td>
  
                    <td style="width: 80%; text-align:right;">
                    <form name="editForm" action="investmentTypeEditController" method="post">
                    <input type="submit" value="Edit" name="editButton" class="btn btn-primary btn-xs custom" />
                    <input type="hidden" value="<%=us.getId() %>" name="searchValue" />
                   
                    <a href="InvestmentType_DeletePage.jsp?id=<%=us.getId()%>" class="btn btn-primary btn-xs custom">Delete</a>
                       
                    </form>  
                    </td>
                    
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
                
                
                
                
                
                
     
<style>
.form_errorMsg{
    color: red;
    display: none;
}
.custom {width: 50px !important;}
 </style>

<form   method="post" name="addInvestments" onsubmit="return formValidation()" action="investmentTypeAddController"  class="form-horizontal" style="width:800px">
 
                        <!-- Form Name -->
                        <legend style="width: 550px;"><h4 style="text-align: left;"><b>ADD INVESTMENT TYPE</b></h4></legend>
                      
                        <!-- Text input-->
     
                        <!-- Text input-->
            <div class="form-group">
            <label class="col-md-2 control-label"  style="text-align:left; font-size:12px; color: black">DESCRIPTION</label>
            <div class="col-md-5">
                <input id="description" required="true" name="description" value="" type="text"  class="form-control input-sm"  >     
            </div>
<!--            <span class="col-md-1 form_errorMsg" id="msg1"><code>Invalid</code></span>-->
        </div>
         
                        
         <div class="form-group">
            <div class="col-md-5">
                
                <div style="padding-left:220px;">
                    
                    <input id="submit"  type="submit" class="btn btn-primary btn-sm custom" value="SAVE"/>
                    &nbsp;
                    <a href="InvestmentTypesManagePage.jsp"  class="btn btn-primary btn-sm custom">BACK</a>          
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
var description = document.addInvestments.description;
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

              
                
 </div>      
</div>                     
</div>                      
</div>                     
</div>               
                        
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
</body>
</html>