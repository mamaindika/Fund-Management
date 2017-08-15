<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/layout.css">
  <link rel="stylesheet" href="css/datepicker.css">
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript">
    function ShowHideDiv() {
        var chkYes = document.getElementById("chkYes");
        var WHTR = document.getElementById("WHTR");
        WHTR.style.display = chkYes.checked ? "block" : "none";
        var chkNo = document.getElementById("chkNo");
        var NotionTax = document.getElementById("NotionTax");
        NotionTax.style.display = chkNo.checked ? "block" : "none";
        
        
        var Yes = document.getElementById("Yes");
        var Fixed = document.getElementById("Fixed");
        Fixed.style.display = Yes.checked ? "block" : "none";
        var No = document.getElementById("No");
        var Floating = document.getElementById("Floating");
        Floating.style.display = No.checked ? "block" : "none";

    }
</script>

</head>
<body> 
  <!--end of header bar-->
<div class="container-fluid text-center" style="background-color:#F0FFFF">  

<div class="col-md-10" style="padding-top: 5px;">
 
<form class="form-horizontal" style="padding:10px">
<fieldset>

<!-- Form Name -->
<legend style="text-align:left">Close Investment</legend>
<!-- Text input-->
<div class="panel panel-primary">
<div class="panel-heading" style="text-align: left; "><b>Investment Details<b></div>
<div class="panel-body">  
    
<div class="form-group">
<label class="col-md-2 control-label" for="sel1" style="text-align:left">Investment Type</label>
<div class="col-md-3">
<select class="form-control input-sm" id="sel1" name="Investment Type">
     <option>select</option>
    <option>Fixed Deposit</option>
    <option>Debenture</option>
    <option>Treasury Bond</option>
    <option>Treasury Bill</option>
    <option>Re-Purchase Agreement</option>
    <option>Government Bond</option>
    <option>Shares</option>

  </select>
</div>
</div>
    
<div class="form-group">
<label class="col-md-2 control-label" for="ReferenceNo" style="text-align:left">Reference No</label>  
<div class="col-md-3">
<input id="ReceiptNo" name="ReferenceNo" type="text" placeholder="" class="form-control input-sm">
    
</div>
</div>
<!-- Text input-->
<div class="form-group">
<label class="col-md-2 control-label" for="ReceiptNo" style="text-align:left">Receipt No</label>  
<div class="col-md-3">
<input id="ReceiptNo" name="ReceiptNo" type="text" placeholder="" class="form-control input-sm">
    
</div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="FdNo" style="text-align:left"> No</label>  
  <div class="col-md-3">
  <input id="FdNo" name="FdNo" type="text" placeholder="" class="form-control input-sm" required="">
    
  </div>
</div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="Type" style="text-align:left"> Type</label>  
  <div class="col-md-3">
  <input id="Type" name="Type" type="text" placeholder="" class="form-control input-sm" required="">
    
  </div>
</div>


<div class="form-group" id="sandbox-container">
<label class="col-md-2 control-label" for="InvestDate" style="text-align:left">Invest Date</label> 
<div class="col-md-3">
<div class="input-group date">
  <input type="text" class="form-control input-sm"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
</div></div>
<script>
        $('#sandbox-container .input-group.date').datepicker({
    todayBtn: "linked",
    toggleActive: true
});
</script>



<label class="col-md-2 control-label" for="MatureDate" style="text-align:left">Mature Date</label> 
<div class="col-md-3">
<div class="input-group date"  >
  <input type="text" class="form-control input-sm"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
</div></div>
<script>
        $('#sandbox-container .input-group.date').datepicker({
    todayBtn: "linked",
    toggleActive: true
});
</script>

</div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-2 control-label" for="Amount" style="text-align:left">No of Days</label>  
  <div class="col-md-3">
  <input id="Amount" name="NoofDays" type="text" placeholder="" class="form-control input-sm" required="">
  </div>
  </div>

<div class="form-group">
  <label class="col-md-2 control-label" for="Amount" style="text-align:left">Amount</label>  
  <div class="col-md-3">
  <input id="Amount" name="Amount" type="text" placeholder="" class="form-control input-sm" required="">
    
  </div>
</div>
<!-- Multiple Radios (inline) -->

<div class="form-group">
<label class="col-md-2 control-label" for="Tax Rate" style="text-align:left">Tax Rate</label>
<div class="col-md-3" style="text-align:left"> 
<label class="radio-inline" for="chkYes" style="text-align:left">
<input type="radio" name="radios0" id="chkYes" value="0"  onclick="ShowHideDiv()">
WHTR&nbsp;&nbsp;
</label> 
<label class="radio-inline" for="chkNo" style="text-align:left">
<input type="radio" name="radios0" id="chkNo" value="1" onclick="ShowHideDiv()">
Notion Tax Rate
</label> 
</div>
</div>

<div  id="WHTR" class="form-group"  style="display: none">
<label class="col-md-2 control-label" for="WHTR:" style="text-align:left">WHTR:</label> 
<div class="col-md-3">
<input id="txtPassportNumber" name="WHTR:" type="text" placeholder="" class="form-control input-sm" required="">
</div>
</div>

<div id="NotionTax" class="form-group"  style="display: none">
<label class="col-md-2 control-label" for="Notion Tax:" style="text-align:left">Notion Tax Rate:</label> 
<div class="col-md-3">
<input id="txtPassportNumber" name="Notion Tax:" type="text" placeholder="" class="form-control input-sm" required="">
</div>
</div>

<div class="form-group">
<label class="col-md-2 control-label" for="Interest Rate" style="text-align:left">Interest Rate</label>
<div class="col-md-3" style="text-align:left"> 
<label class="radio-inline" for="Yes" style="text-align:left">
<input type="radio" name="radios0" id="Yes" value="0"  onclick="ShowHideDiv()">
Fixed&nbsp;&nbsp;
</label> 
<label class="radio-inline" for="No" style="text-align:left">
<input type="radio" name="radios0" id="No" value="1" onclick="ShowHideDiv()">
Floating
</label> 
</div>
</div>

<div  id="Fixed" class="form-group"  style="display: none">
<label class="col-md-2 control-label" for="Fixed" style="text-align:left">Fixed Rate</label> 
<div class="col-md-3">
<input id="Fixed" name="Fixed" type="text" placeholder="" class="form-control input-sm" required="">
</div>
</div>

<div id="Floating" class="form-group"  style="display: none">
<label class="col-md-2 control-label" for="Floating" style="text-align:left">Floating</label> 
<div class="col-md-3">
<input id="Floating" name="Notion Tax:" type="text" placeholder="" class="form-control input-sm" required="">
</div>
</div>

<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-2 control-label" for="Interest at" style="text-align:left">Interest at</label>
  <div class="col-md-3" style="text-align:left"> 
    <label class="radio-inline" for="radios-2" style="text-align:left">
      <input type="radio" name="radios1" id="radios-2" value="2" checked="checked">
      Maturity
    </label> 
    <label class="radio-inline" for="radios-3" style="text-align:left">
      <input type="radio" name="radios1" id="radios-3" value="3">
      Annually
    </label> 
  </div>
</div>





</div>
</div>

        <!--                 -->                        
<div class="panel panel-primary">
<div class="panel-heading" style="text-align: left; "><b>Interest Details<b></div>

<div class="panel-body">  
<table class="table">
				<thead>
					<tr>
						<th>
							Year
						</th>
						<th>
							Amount
						</th>
						<th>
							Interest Rate
						</th>
						<th>
							Interest
						</th>
                                                <th>
							Tax Rate
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							
						</td>
						<td>
							
						</td>
						<td>
							
						</td>
                                                <td>
							
						</td>
						<td>
							
						</td>
					</tr>
					
					
					<tr class="warning">

				</tbody>
			</table>
            </div>
</div>
  <!--                 -->                      
<div class="panel panel-primary">
<div class="panel-heading" style="text-align: left; "><b><b></div>
<div class="panel-body">  
    
<div class="form-group">
<label class="col-md-2 control-label" for="Remarks" style="text-align:left">Remarks</label>
<div class="col-lg-3"> 
<textarea class="form-control input-sm" id="Remarks" name="Remarks"></textarea>
</div>
</div>
            </div>
</div>                        
                         
            </fieldset>  
</form>
                           
                 </div>
                
	</div>
</div>



</body>
</html>
