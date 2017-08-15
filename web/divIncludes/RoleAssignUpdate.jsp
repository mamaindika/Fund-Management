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
<%    TblUser u = (TblUser) request.getAttribute("searchResult"); 
      TblUserroles ur =(TblUserroles) request.getAttribute("searchResult1");
      TblRoleassign acc=(TblRoleassign)request.getAttribute("searchResult2");
            if((u != null)&&(ur != null)&&(acc != null)) {
%>

<div class="row">
<form action="RoleAssignUpdateController" method="post" id="update" name="update">
    
     <legend><h4 style="text-align: left;"><b>ROLE UPDATE</b></h4></legend>
  
         
        
        <div class="form-group" hidden="true">
            <label class="col-md-3 control-label"  style="text-align:left">ID</label> 
                <div class="col-lg-3">
                    <input id="id" name="id" type="text" readonly="true" value="<% out.println(acc.getId()); %>"  class="form-control input-sm">
                </div>
         </div>
                 
        
          
                

        </div>
              <div class="form-group"  >
            <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">PF NUMBER</label> 
                <div class="col-lg-3">
               
                <input id="pfno" name="pfno" type="text" readonly="true" value="<%=u.getPfNo()%>"  class="form-control input-sm">
               
                </div>
        </div>  
                <br><br>
                
                
                         <div class="form-group"  >
            <label class="col-md-3 control-label"  style="text-align:left; font-size:12px; color: black">ROLE</label> 
                <div class="col-lg-3">
                                <select class="form-control input-sm"  name="role"  id="role"  >
                 
                    <option value=<%=ur.getId()%>><% out.println(ur.getDescription()); %></option>
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
                
                
<br><br>
  <div class="btn">
                       <div class="col-md-3">
                       <div style="margin-left: -240px;">
                           
                          <input id="submit" type="submit" class="btn btn-primary btn-sm" value="UPDATE"/>
                            &nbsp;
                             <a href="RoleAssignPage.jsp"   class="btn btn-primary btn-sm">BACK</a>
                                   </div>
                       </div>
</div> 
     













































          </form>
        </div>

              <%  }else{  %>
        Invalid
    <%  }  %>
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