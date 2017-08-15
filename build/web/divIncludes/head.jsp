<%@page import="service.FundTypesService"%>
<%@page import="model.TblFunduserassign"%>
<%@page import="com.sun.glass.ui.SystemClipboard"%>
<%@page import="model.TblUser"%>
<%@page import="model.TblFundtypes"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.UserService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<nav class="navbar navbar-inverse">
<div class="container-fluid">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">

</button>
<a class="navbar-brand"><img alt="" src="images/boc.jpg" height="59px" width="80px" style="margin-left: 10px;"></a>
</div>
<div class="collapse navbar-collapse" id="myNavbar">
<ul class="nav navbar-nav" style="color:white">

<h3><b>SUPERANNUATION DEPARTMENT</b></h3><h5>FUND MANAGEMENT APPLICATION</h5>
</ul>
<ul class="nav navbar-nav navbar-right">
    <ul class="nav navbar-nav"  style="color:white">
        
        
            <% 
                if((session.getAttribute("loggedUserId")!=null)){ 
                int userId= (Integer)session.getAttribute("loggedUserId"); 
               // int fundId= (Integer)session.getAttribute("loggedFundType"); 
                    UserService  userSer = new UserService();
                   // FundTypesService fundSer = new FundTypesService();
                    TblUser logUser = userSer.getUserByuserId(userId);
                  //  TblFundtypes logFund=fundSer.getFundByfundId(fundId);
                    System.out.println(logUser.getLastName()+","+logUser.getMobileNo());  
            %>
              
            <li style="text-align: right" value=<%=logUser.getUserName()%>><h5><b><kbd><%=logUser.getSalutations()%>&nbsp;<%=logUser.getFirstName()%>&nbsp;<%=logUser.getLastName()%></kbd></b></h5>
            
                    <% } %>  
    <h5><b><kbd><%
    Date dNow = new Date( );
    SimpleDateFormat ft = 
    new SimpleDateFormat ("yyyy MMM d E");
    out.print( ft.format(dNow));
%></kbd></b></h5>

<%
 if (session == null || session.getAttribute("loggedUserId") == null) {
        response.sendRedirect("index.jsp"); // No logged-in user found, so redirect to login page.
    } else {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0);
       // chain.doFilter(req, res);  
     //response.sendRedirect("index.jsp");
    %>

 <div id="button" align="right" >
        <button type="button" onclick="window.location.href='dashboardpage.jsp'" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-home"></span><b> HOME</b>
        </button>
    <button type="button" onclick="window.location.href='LogOutController'" class="btn btn-default btn-sm">
        <span class="glyphicon glyphicon-log-out"></span><b> LOG OUT</b>
        </button>
</div>   

    <% } %>
</li>
    </ul>
</ul>

</ul>
</div>

</nav>