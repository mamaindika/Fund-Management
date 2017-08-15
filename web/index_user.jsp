<%-- 
    Document   : login
    Created on : Mar 27, 2016, 11:54:06 AM
    Author     : Hashini Hemanjali
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="service.userCredentialsService"%>
<%@page import="model.TblUsercredentials" %>
<%@page import="model.TblFundtypes" %>
<%@page import="service.FundTypesService"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Fund Management Application</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="jquery/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>



<script>  
function validateform(){  
var userId=document.loginForm.userId.value;  
var password=document.loginForm.password.value;  

if (userId==null || userId==""){  
  alert("User Name can't be blank");  
  return false;  
}else if(password.length<6){  
  alert("Password must be at least 6 characters long.");  
  return false;  
}
}
</script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<header> 
<%@ include file="divIncludes/head_1.jsp" %>
</header> 
    <div class="container-fluid text-center" style="background-color:#F0FFFF"> 
      <br> <br>
      
  <%
    if(null!=request.getAttribute("errorMessage"))
{%>
    
<h3 style="margin-bottom: -48px; font-size: 15px">
<kbd>
        <%out.println(request.getAttribute("errorMessage"));%>
</kbd>        
</h3>

<%        
 }

%>
          
      
      
      
      
    <div class="row content">
    <div class="col-md-4">
    </div>
    <div class="col-md-4" style=" padding-top:100px">
    <div class="panel panel-default">
    <div class="panel-heading" style="background-color:navy">
    <h3 class="panel-title" style="color:white; text-align: left; padding-left:0px"><b>FUND TYPE</b></h3>
    </div>
    <div class="panel-body" style="background-color:#86c5da">
        <%
            String userId = (String)request.getAttribute("searchResult");
            String password = (String)request.getAttribute("searchResult1");
        
        %>
    <form  class="form-horizontal" name="loginForm" onsubmit="return validateform()" action="userFundTypeValidationController"  method="post">
        <div class="form-group">
    <label class="col-md-4 control-label" for="User Name" style="text-align:left; font-size:12px; color: black">USERNAME</label> 
    <div class="col-md-6">
        <input id="userId" name="userId"  readonly="true"  type="text" value="<%out.println(userId);%>"  class="form-control input-sm" style="padding-left:10px">
    </div>
    </div>
    <div class="form-group" >
    <label class="col-md-4 control-label" for="InputPassword" style="text-align:left; font-size:12px; color: black">PASSWORD</label> 
    <div class="col-md-6">
        <input id="password" readonly="true" name="password" value="<%out.println(password);%>"  type="password"  class="form-control input-sm" style="padding-left:10px">

    </div>
    </div>				
    <div class="form-group">
    <label class="col-md-4 control-label" for="sel1" style="text-align:left;  font-size:12px; color: black">FUND TYPE</label>
    <div class="col-md-6">
    <select class="form-control input-sm" id="fundtypes" name="fundtypes" >  
            <option value="-1">SELECT</option>
            <%
            FundTypesService fundtypes = new FundTypesService();
            List listfundtypes = fundtypes.listFundTypes();
            for (Iterator iterator = listfundtypes.iterator(); iterator.hasNext();) {
                  TblFundtypes as = (TblFundtypes) iterator.next();
                  request.setAttribute("fundtypes",as);
            %>
            <option value=<%=as.getId() %>><%= as.getDescription()%></option> 
        <%  }  %>
    </select>     
    </div>
    </div>

    <div class="btn">
        <div class="col-md-12" style="margin-left: 50px" >
    <button id="loginAdmin" name="action"  type="submit" value="loginAdmin" name="loginAdminButton" class="btn btn-primary btn-block">LOGIN</button>
    </div>
    </div>

    </form>
    </div>

    </div>
    <br><br>  <br><br><br><br><br><br> 
    <br><br><br><br><br> <br><br><br> <br><br><br> 
    </div>
     <br>
    </div>
    </div>
    <div id="footer" style="background-color: navy;">
    <%@ include file="divIncludes/footer.jsp" %>
    </div>
    
    

    </body>
</html>