<%-- 
    Document   : AuthorizationPage
    Created on : Jun 22, 2016, 8:13:38 AM
    Author     : boc
--%>

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

</head>
<body>
<header> 
<%@ include file="divIncludes/head.jsp" %>
    </header> 
  <!--end of header bar-->
<div class="container-fluid text-center" style="background-color:#F0FFFF">    
  <div class="row content">
		<div class="col-md-2 sidenav">
            <%@ include file="divIncludes/navi.jsp" %>

		</div>
 <div class="col-md-10" style="padding-left:20px; padding-right:20px">
         <div class="col-md-12"     style="text-align: left; height:30px">
      <%@ include file="link.jsp" %>

		</div>    
<%@ include file="divIncludes/AuthorizationManage.jsp" %>

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
