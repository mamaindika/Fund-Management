<%@page import="service.UserService"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.FundTypesService"%>
<%@page import="model.TblUserroles" %>
<%@page import="model.TblFunduserassign"%>
<%@page import="model.TblFundtypes"%>
<%@page import="model.TblUser"%>
<html>
            <style>
            .custom {
    width: 50px !important;
}
        </style>
    <br>  <br>  <br>  <br>
   <div id="content">
        <div class="row">
            <div class="col-md-2">
                <br /> 
                <a href="FundAssign_Page.jsp" class="btn btn-primary ">
                    <span class="glyphicon glyphicon-plus-sign"></span> 
                    Assign Fund
                </a>
            </div>
        </div> 
        <div class="row">
            <div class="col-md-2">
                <br /> 

            </div>
        </div> 
        <div class="row">
            <div class="col-md-2">
                <br /> 

            </div>
        </div> 

        <div class="row">
            <div class="col-md-2">
                <br /> 

            </div>
        </div> 

  <table class="table table-bordered">
            <thead style="text-align:left">
                <tr>
                    
                  
                    <th colspan="2"></th>
                </tr>
            </thead>
            <tbody style="text-align:left">
                <%
                    FundTypesService as = new FundTypesService ();
                    List users1 = as.listassignFunds();
                    for (Iterator iterator = users1.iterator(); iterator.hasNext();) {
                        TblFunduserassign us = (TblFunduserassign) iterator.next();
                %>
                <tr>
                   
                    <td><%= us.getTblUser().getPfNo()%></td>
                    <td><%= us.getTblFundtypes().getDescription()%></td>
                   
                    
                     <form name="editForm" action="FundAssignEditController" method="post">
                        <div class="row">
                            <div class="col-md-2">  
                                <div class="form-group">
                                <td> <input type="submit" value="Edit" name="editButton" class="btn btn-primary btn-xs custom" /> </td>
                              </div>
                        <input type="hidden" value="<%=us.getTblUser().getPfNo()%>" name="searchValue" />             
                        <input type="hidden" value="<%=us.getTblFundtypes().getId()%>" name="searchValue1" />
                        
                            </div>
                        </div>
                    </form>  
                    
                    
                <%  }  %>
          
                
                
                </tr>
            </tbody>
        </table>
	

    </div>
</html>