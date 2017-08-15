<%@page import="com.sun.glass.ui.SystemClipboard"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TblRoleassign"%>
<%@page import="model.TblUser"%>
<%@page import="service.UserRolesService"%>
<%@page import="service.UserService"%>
<%@page import="model. TblUserroles"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
<style>.custom {width: 50px !important;}</style>
        <style type="css/text">
                    .dual-list .list-group {
            margin-top: 8px;
        }

        .list-left li, .list-right li {
            cursor: pointer;
        }

        .list-arrows {
            padding-top: 100px;
        }

            .list-arrows button {
                margin-bottom: 20px;
            }
            
        </style>
    </head>
    <body>
        <form action="RoleAssignController" method="post" id="add" name="add">
        <div class="row">
		<div class="col-md-12">
		   
	<div class="form-group">
            <label class="col-md-2 control-label" for="sel1" style="text-align:left">Role</label>
            <div class="col-md-3">
                <select class="form-control input-sm" id="sel1" name="role">
                    <option>select</option>
                    <%
                    UserRolesService roleSer = new UserRolesService();
                    List role = roleSer.listUserRoles();
                  
                  for (Iterator iterator = role.iterator(); iterator.hasNext();) {
                     TblUserroles tbluserroles = (TblUserroles) iterator.next();
                     request.setAttribute("role",tbluserroles);
                     System.out.println("test66"+tbluserroles.getId());
                    %>
                    <option value=<%=tbluserroles.getId()%>><%= tbluserroles.getDescription()%></option> 
                    <% System.out.println("test88"+tbluserroles.getId());%>
                <%  }  %>
                </select>
            </div>
        </div>
		
                    <br><br><br>	
		
		</div>
	</div>
	<div class="row">

        <div class="dual-list list-left col-md-5">
                <b>All Users Except Selected</b>
            <div class="well text-right">
                <div class="row">
                    <div class="col-md-10">  
                        
                    </div>
                    <div class="col-md-2">
                        <div class="btn-group">
                            <a class="btn btn-default selector" title="select all"><i class="glyphicon glyphicon-unchecked"></i></a>
                        </div>
                    </div>
                </div>

              <select class="form-control input-sm" id="sel1" name="pfno">
                    <option>select</option>
                <%
                    UserService userSer = new UserService();
                    List users = userSer.ActivelistUsers();
                for (Iterator iterator = users.iterator(); iterator.hasNext();) {
                    TblUser tbluser = (TblUser) iterator.next();
                    request.setAttribute("pfno",tbluser);
                    System.out.println("test66"+tbluser.getPfNo());
                %>
                    <option value=<%=tbluser.getPfNo()%>><%= tbluser.getPfNo()%></option> 
                <% System.out.println("test88"+tbluser.getPfNo());%>
            <%  }  %>
                </select> 
                </div>
        </div>

       
 <div class="list-arrows col-md-2 text-center">
            <br><br>
       
            <button id="add" name="add" class="btn btn-primary btn-xs custom  move-right btn-primary">
                <span class="glyphicon glyphicon-chevron-right">Add</span>
            </button>
                   </form>
              <br>
     
   
        </div>

        <div class="dual-list list-right col-md-5">
                <b>Only Selected Users</b>
            <div class="well">
                <div class="row">
                    <div class="col-md-2">
                        <div class="btn-group">
                            <a class="btn btn-default selector" title="select all"><i class="glyphicon glyphicon-unchecked"></i></a>
                        </div>
                    </div>
                    <div class="col-md-10">
                          <ul class="list-group" style="text-align: left" name="pfno" >
                            <%
                            UserRolesService uRole = new UserRolesService();
                            List users1 = uRole.listassignRoles();
                            for (Iterator iterator = users1.iterator(); iterator.hasNext();) {
                                TblRoleassign RoleAs = (TblRoleassign) iterator.next(); 
                                request.setAttribute("pfno",RoleAs.getTblUser().getPfNo());
                            %>
                    <li class="list-group-item"   name="pfno" value=<%=RoleAs.getTblUser().getPfNo()%>><%=RoleAs.getTblUser().getPfNo()%></li>  
                            <%  }  %>
                 </ul>
                    </div>
                </div>
          
            </div>
        </div>
          </form>
	</div>

</body>
<script>
         $(function () {

            $('body').on('click', '.list-group .list-group-item', function () {
                $(this).toggleClass('active');
            });
            $('.list-arrows button').click(function () {
                var $button = $(this), actives = '';
                if ($button.hasClass('move-left')) {
                    actives = $('.list-right ul li.active');
                    actives.clone().appendTo('.list-left ul');
                    actives.remove();
                } else if ($button.hasClass('move-right')) {
                    actives = $('.list-left ul li.active');
                    actives.clone().appendTo('.list-right ul');
                    actives.remove();
                }
            });
            $('.dual-list .selector').click(function () {
                var $checkBox = $(this);
                if (!$checkBox.hasClass('selected')) {
                    $checkBox.addClass('selected').closest('.well').find('ul li:not(.active)').addClass('active');
                    $checkBox.children('i').removeClass('glyphicon-unchecked').addClass('glyphicon-check');
                } else {
                    $checkBox.removeClass('selected').closest('.well').find('ul li.active').removeClass('active');
                    $checkBox.children('i').removeClass('glyphicon-check').addClass('glyphicon-unchecked');
                }
            });
            $('[name="SearchDualList"]').keyup(function (e) {
                var code = e.keyCode || e.which;
                if (code == '9') return;
                if (code == '27') $(this).val(null);
                var $rows = $(this).closest('.dual-list').find('.list-group li');
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rows.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });

        });
        </script>
</html>