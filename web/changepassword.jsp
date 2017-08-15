<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="service.userCredentialsService"%>
<%@page import="service.userCredentialsService"%>
<%@page import="model.TblUsercredentials" %>

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
  
<script>
function pass() {
    var newpassword = document.changePassword.newpassword.value;
    var confirmpassword = document.changePassword.confirmpassword.value;
    var letter = /[a-zA-Z0-9]/;
//    var number = /[0-9]<2/;

    if (newpassword != confirmpassword ) {
        alert("the new password and confirm password must be equal");
        return false;
    }else if (newpassword==null || newpassword=="" || confirmpassword=="" || password==""){  
 alert("Password inputs can't be blank");  
 return false;  

       }else if(newpassword.length<6){  
  alert("Password must be at least 6 characters long.");  
  return false; 
//  }else if(!passwordinput.match(letter<2)){  
//  alert("Password should contain 2 numerics & 2 alpha characters.");  
//  return false; 
   }

}
</script>


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
    
<%@ include file="divIncludes/changepw.jsp" %>
 <br><br><br><br><br><br><br><br><br><br> <br><br><br> <br><br><br><br><br> 
                
               
            
                </div>
	</div>
                
</div>


<!-- start footer here--> 

<div id="footer" style="background-color: navy">
  <%@ include file="divIncludes/footer.jsp" %>
  
</div>
</body>
</html>