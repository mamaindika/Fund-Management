/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TblRoleassign;
import model.TblUser;
import model.TblUserroles;
import service.UserRolesService;

/**
 *
 * @author boc
 */

@WebServlet(name = "RoleAssignController", urlPatterns = {"/RoleAssignController"})
public class RoleAssignController extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        int roleId = Integer.parseInt(request.getParameter("role"));  
        int pfNo = Integer.parseInt(request.getParameter("pfno"));
        UserRolesService nm = new UserRolesService();
        TblRoleassign result = nm.getRoleById(pfNo, roleId);
        TblRoleassign resu = nm.getUserByUserId(pfNo);
        
        if(result == null && resu == null){
        
        
        
        try {
            /* TODO output your page here. You may use following sample code. */


  System.out.println("inside cont role:- "+request.getParameter("role"));
  System.out.println("inside cont pfno:- "+request.getParameter("pfno"));
  
 
            TblUserroles  tempd = new TblUserroles();
            tempd.setId(roleId);
            System.out.println(roleId);
            
   
            TblUser  temppfNo = new TblUser();
            temppfNo.setPfNo(pfNo);
            System.out.println(pfNo);

            TblRoleassign roleAss  = new TblRoleassign(temppfNo, tempd, 1);
           
            UserRolesService  roleSer = new UserRolesService();
            String resultMessage = roleSer.assignRoles(roleAss);
            System.out.println("1"+temppfNo);
            System.out.println("2"+tempd);
            RequestDispatcher rd = request.getRequestDispatcher("RoleAssignPage.jsp?message=" + resultMessage);
            request.setAttribute("searchResult", null);
            rd.forward(request, response);
         
            
        } finally {
            out.close();
        }
        
        }else{
            out.println("<script type=\"text/javascript\">");
                out.println("alert('Role has been assigned already');");
                out.println("location='RoleAssignPage.jsp';");
                out.println("</script>");
        }
        
        
        
    }

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

