<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="service.InvestmentTypesService"%>
<%@page import="model.TblInvestmenttypes"%>
<%@page import="model.TblAccountJournalmapping"%>
<%@page import="model.TblInvestments"%>
<%@page import="model.TblMasterjournals"%>
<%@page import="service.MasterJournalsService"%>
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
  <link rel="stylesheet" href="bootstrap-datepicker/css/datepicker.css">
  <script src="bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  <script src="bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    <style>
    .reveal-if-active {
      opacity: 0;
      max-height: 0;
      overflow: hidden;
      font-size: 16px;
      -webkit-transform: scale(0.8);
              transform: scale(0.8);
      -webkit-transition: 0.5s;
      transition: 0.5s;
    }
    .reveal-if-active label {
      display: block;
      margin: 0 0 3px 0;
    }
    .reveal-if-active input[type=text] {
      width: 100%;
    }
    input[type="radio"]:checked ~ .reveal-if-active, input[type="checkbox"]:checked ~ .reveal-if-active {
      opacity: 1;
      max-height: 100px;
      padding: 10px 20px;
      -webkit-transform: scale(1);
              transform: scale(1);
      overflow: visible;
    }

    *{
      box-sizing: border-box;
    }
    </style>
    <script type="text/javascript">
        var FormStuff = {

      init: function() {
        this.applyConditionalRequired();
        this.bindUIActions();
      },

      bindUIActions: function() {
        $("input[type='radio'], input[type='checkbox']").on("change", this.applyConditionalRequired);
      },

      applyConditionalRequired: function() {

        $(".require-if-active").each(function() {
          var el = $(this);
          if ($(el.data("require-pair")).is(":checked")) {
            el.prop("required", true);
          } else {
            el.prop("required", false);
          }
        });

      }

    };
    FormStuff.init();
    </script>
</head>
<body>
<header> 
<%@ include file="divIncludes/head.jsp" %>
</header> 
  <!--end of header bar-->
<div class="container-fluid text-center" style="background-color:#F0FFFF">  
  <div class="row content">
		<div class="col-md-2 sidenav" style="">
            <%@ include file="divIncludes/navi.jsp" %>

		</div>
<div class="col-md-10" style="padding-left:20px; padding-right:20px">

       <%@ include file="divIncludes/openinvestment.jsp" %>
	</div>
</div>
</div>   
<!-- start footer here--> 
<div id="footer" style="background-color: navy">
  <%@ include file="divIncludes/footer.jsp" %>
</div>

</body>
</html>