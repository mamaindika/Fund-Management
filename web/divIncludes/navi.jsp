<%@page import="service.UserRolesService"%>
<%@page import="model.TblFundtypes"%>
<%@page import="service.FundTypesService"%>
<%@page import="model.TblUser"%>
<%@page import="model.TblUserroles"%>
<%@page import="java.util.Iterator"%>
<%@page import="service.UserService"%>
<%@page import="java.util.List"%>
<div class="span3">
     <div  style="margin-left: 10px; " margin="0px">
        <div>  
        <ul class="nav nav-list">
        <% 
                if((session.getAttribute("loggedUserId")!=null)&&(session.getAttribute("loggedRoleId")!=null)){ 
//session.getAttribute("loggedRoleId")
                    int userId= (Integer)session.getAttribute("loggedUserId"); 
                //int fundId= (Integer)session.getAttribute("loggedFundType"); 
int roleId= (Integer)session.getAttribute("loggedRoleId"); 
                    UserService  userSer = new UserService();
                    //FundTypesService fundSer = new FundTypesService();
UserRolesService roleSer= new UserRolesService();
                    TblUser logUser = userSer.getUserByuserId(userId);
                   // TblFundtypes logFund=fundSer.getFundByfundId(fundId);
TblUserroles logRole=roleSer.getRolebyId(roleId);
                     
                %>
<%if ((roleId==3)) {%> 


<li style="text-align: left;"><label class="tree-toggle nav-header" style="color:black; font-size:13px;"><kbd>CASH FLOW</kbd></label>
                    <ul class="nav nav-list tree" style="font-size:small">
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="TransactionManagePage.jsp"><b>TRANSACTION</b></a></li>
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="Transaction_listPage.jsp"><b>TRANSACTION LIST</b></a></li>
                    </ul>
                </li>
                <li style="text-align: left;"><label class="tree-toggle nav-header" style="color:black; font-size:13px;"><kbd>INVESTMENT ADMINISTRATION</kbd></label>
                    <ul class="nav nav-list tree" style="font-size:small">
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="openinvestment.jsp"><b>OPEN INVESTMENT</b></a></li>
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="CloseInvestmentManagePage.jsp"><b>CLOSE INVESTMENT</b></a></li>
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="ManageInvestmentAuthorizationPage.jsp"><b>VIEW INVESTMENT</b></a></li>
                    </ul>
                </li>
                <li style="text-align: left;"><label class="tree-toggle nav-header" style="color:black; font-size:13px;"><kbd>REPORTS</kbd></label>
                    <ul class="nav nav-list tree" style="font-size:small">
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="test.jsp"><b>BALANCE SHEET</b></a></li>
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="test.jsp"><b>MATURITY INVESTMENT</b></a></li>
                        <!--  <li style="text-align: left; padding-left:5px"><a href="#"></a></li> -->
                    </ul>
                </li>  
                <li style="text-align: left;"><label class="tree-toggle nav-header" style="color:black; font-size:13px;"><kbd>PROFILE</kbd></label>
                    <ul class="nav nav-list tree" style="font-size:small">
         
              <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="PaswordUserController?id=<%=logUser.getUserName()%>"><b>CHANGE PASSWORD</b></a></li>
                          <%--
                if(session.getAttribute("loggedUserId")!=null){ 
                int userId=(Integer)session.getAttribute("loggedUserId"); 
                    UserService  userSer = new UserService();
                    TblUser logUser = userSer.getUserByuserId(userId);

                    System.out.println(logUser.getLastName()+","+logUser.getMobileNo());
        
                          --%>
<li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="UserModifyController?id=<%=logUser.getUserName()%>"><b>MODIFY DATA</b></a></li>
                        <%-- }  --%>  
                            
                        <!--  <li style="text-align: left; padding-left:5px"><a href="#"></a></li> -->
                    </ul>
                </li> 

<%}%>


<%if (roleId==2) {%>
<li style="text-align: left;"><label class="tree-toggle nav-header" style="color:black; font-size:13px;"><kbd>SET UP</kbd></label>
        <ul class="nav nav-list tree" style="font-size:small">  
        <li style="text-align: left; padding-left:5px"><a  style=" font-size:10.5px;  border-radius: 12px" href="Designation_ManagePage.jsp"><b>DESIGNATION</b></a></li>
        <li style="text-align: left; padding-left:5px"><a  style=" font-size:10.5px;  border-radius: 12px"  href="Transaction_Type_ManagePage.jsp"><b>TRANSACTION TYPES</b></a></li>
        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="FundType_ManagePage.jsp"><b>FUND TYPES</b></a></li>
        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="InvestmentTypesManagePage.jsp"><b>INVESTMENT TYPES</b></a></li>                              
        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="UserRole_ManagePage.jsp"><b>USER ROLES</b></a></li>                     
        </ul>
                </li>
                <!-- <li class="divider"></li> -->
                <li style="text-align: left;"><label class="tree-toggle nav-header" style="color:black; font-size:13px;"><kbd>USER ADMINISTRATION</kbd></label>
                    <ul class="nav nav-list tree" style="font-size:small">
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px"  href="User_ManagePage.jsp"><b>USER ACCOUNTS</b></a></li>
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="test.jsp"><b>USER ROLE RIGHTS</b></a></li>
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="RoleAssignPage.jsp"><b>USER ROLE ASSIGNMENT</b></a></li>
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="FundAssign_ManagePage.jsp"><b>FUND TYPE PERMISSION</b></a></li>
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="test.jsp"><b>REPORT PERMISSION</b></a></li>
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="UserRestPasswordPage.jsp"><b>USER PASSWORD RESET</b></a></li>
                    </ul>
                </li>
                
                
                
                <li style="text-align: left;"><label class="tree-toggle nav-header" style="color:black; font-size:13px;"><kbd>REPORTS</kbd></label>
                    <ul class="nav nav-list tree" style="font-size:small">
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="UserDetailsReportPage.jsp" "><b>USER DETAILS</b></a></li>
                         <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="userRoleReportPage.jsp" "><b>USER ROLE DETAILS</b></a></li>
                    </ul>
                </li>                


              
                <li style="text-align: left;"><label class="tree-toggle nav-header" style="color:black; font-size:13px;"><kbd>PROFILE</kbd></label>
                    <ul class="nav nav-list tree" style="font-size:small">
         
              <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="PaswordUserController?id=<%=logUser.getUserName()%>"><b>CHANGE PASSWORD</b></a></li>
                          <%--
                if(session.getAttribute("loggedUserId")!=null){ 
                int userId=(Integer)session.getAttribute("loggedUserId"); 
                    UserService  userSer = new UserService();
                    TblUser logUser = userSer.getUserByuserId(userId);

                    System.out.println(logUser.getLastName()+","+logUser.getMobileNo());
        
                          --%>
<li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="UserModifyController?id=<%=logUser.getUserName()%>"><b>MODIFY DATA</b></a></li>
                    </ul>
                </li> 
                <% } %>


<%if (roleId==4) {%>

<li style="text-align: left;"><label class="tree-toggle nav-header" style="color:black; font-size:13px;"><kbd>CASH FLOW</kbd></label>
                    <ul class="nav nav-list tree" style="font-size:small">
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px; border-radius: 12px" href="Transaction_AuthorizationPage.jsp"><b>AUTHORIZATION</b></a></li>
                    </ul>
                </li>
<li style="text-align: left;"><label class="tree-toggle nav-header" style="color:black; font-size:13px;"><kbd>ACCOUNT ADMINISTRATION</kbd></label>
                    <ul class="nav nav-list tree" style="font-size:small">
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="MasterAccounts_ManagePage.jsp"><b>MASTER ACCOUNTS</b></a></li>
                          <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="MasterJournals_ManagePage.jsp"><b>MASTER JOURNALS</b></a></li>
                          

                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="Account_Journal_ManagePage.jsp"><b>ACCOUNT JOURNAL MAP</b></a></li> 
                    </ul>
                </li>

                <li style="text-align: left;"><label class="tree-toggle nav-header" style="color:black; font-size:13px;"><kbd>REPORTS</kbd></label>
                    <ul class="nav nav-list tree" style="font-size:small">
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="test.jsp"><b>BALANCE SHEET</b></a></li>
                        <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="test.jsp"><b>MATURITY INVESTMENT</b></a></li>
                        <!--  <li style="text-align: left; padding-left:5px"><a href="#"></a></li> -->
                    </ul>
                </li>  
                <li style="text-align: left;"><label class="tree-toggle nav-header" style="color:black; font-size:13px;"><kbd>PROFILE</kbd></label>
                    <ul class="nav nav-list tree" style="font-size:small">
         
              <li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="PaswordUserController?id=<%=logUser.getUserName()%>"><b>CHANGE PASSWORD</b></a></li>
                          <%--
                if(session.getAttribute("loggedUserId")!=null){ 
                int userId=(Integer)session.getAttribute("loggedUserId"); 
                    UserService  userSer = new UserService();
                    TblUser logUser = userSer.getUserByuserId(userId);

                    System.out.println(logUser.getLastName()+","+logUser.getMobileNo());
        
                          --%>
<li style="text-align: left; padding-left:5px"><a   style=" font-size:10.5px;  border-radius: 12px" href="UserModifyController?id=<%=logUser.getUserName()%>"><b>MODIFY DATA</b></a></li>
                        <%-- }  --%>  
                            
                        <!--  <li style="text-align: left; padding-left:5px"><a href="#"></a></li> -->
                    </ul>
                </li> 
                <% } %>
                
                
                
                
                
                
                
                
                      <% } %> 
            </ul>
        </div>
    </div>
    </div>





