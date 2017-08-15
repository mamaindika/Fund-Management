<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.UserRolesService"%>
<%@page import="model.TblUserroles" %>
<html>
   <style>.custom {width: 50px !important;}</style>
   <br>  <br>  <br>
    <div>
        <div class="row">
            <div class="col-md-2">
                <br /> 
                <a href="UserRole_AddPage.jsp" class="btn btn-primary ">
                    <span class="glyphicon glyphicon-plus-sign"></span> 
                    Add Roles
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

       <!-- <form name="searchForm" action="searchController">
            <div class="row">
                <div class="col-md-2">  
                    <div class="form-group">
                        <label class="control-label" for="id">
                            Designation ID
                        </label>
                        <input type="text" class="form-control input-sm" id="id" name="searchValue" value="" >
                    </div>
                </div>
                <div class="col-md-2">
                    <br /> 
                  <input type="submit" value="Filter" name="searchButton" class="btn btn-primary btn-sm" />

                </div>  
            </div>
        </form> -->

        
     <table class="table table-bordered">
            <thead style="text-align:left">
                <tr>
                    
                    <th style="text-align:center">Description</th>
                    <th colspan="2"></th>
                </tr>
            </thead>
            <tbody style="text-align:left">
                <%
                    UserRolesService  as = new UserRolesService ();
                    List users = as.listUserRoles();
                    for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                        TblUserroles us = (TblUserroles) iterator.next();
                %>
                <tr>
                   
                    <td><%= us.getDescription()%></td>
                   
                    
                     <form name="editForm" action="RolesEditController" method="post">
                        <div class="row">
                            <div class="col-md-2">  
                                <div class="form-group">
                                <td> <input type="submit" value="Edit" name="editButton" class="btn btn-primary btn-xs custom" /> </td>
                              </div>
                            </div>
                            <div class="col-md-2">
                                <input type="hidden" value="<%=us.getId() %>" name="searchValue" />
                                <td> <a href="UserRole_DeletePage.jsp?id=<%=us.getId() %>" class="btn btn-primary btn-xs custom">Delete</a> </td>
                                </div>
                        </div>
                    </form>  
                    
                    
                <%  }  %>
          
                
                
                </tr>
            </tbody>
        </table>
    </div>
</html>