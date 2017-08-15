/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TblDesignations;
import model.TblRoleassign;
import model.TblUserroles;
import service.DesignationService;
import service.UserRolesService;

/**
 *
 * @author boc
 */
@WebServlet(name = "userRolesUpdateController", urlPatterns = {"/userRolesUpdateController"})
public class userRolesUpdateController extends HttpServlet {

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
        
        int id = Integer.parseInt(request.getParameter("id").trim());
        String description = request.getParameter("description");
        UserRolesService acs = new UserRolesService();
        TblUserroles result = acs.searchUserRolesDesc(description);
        
        
        if(result == null){
        
        try {
            /* TODO output your page here. You may use following sample code. */
            
           
            TblRoleassign tblRoleassigns=null;
            
            TblUserroles ac = new TblUserroles(description,(Set<TblRoleassign>)tblRoleassigns);
   
            
              System.out.println("test0="+id);
              System.out.println("test1="+description);
              
            
            
              System.out.println("test2="+id);
              System.out.println("test3="+description);
              ac.setId(id);
              String resultMessage = acs.updateUserRoles(ac);
            
              System.out.println("test4="+id);
              System.out.println("test5="+description);
              
            TblUserroles add_obj= acs.searchUserRoles(id);
                
              System.out.println("test6="+id);
              System.out.println("test7="+description);
            
            RequestDispatcher rd = request.getRequestDispatcher("UserRole_ManagePage.jsp?message=" + resultMessage);
            request.setAttribute("searchResult", add_obj);
            rd.forward(request, response);
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            out.close();
        }
        
        }else{
            
            UserRolesService er = new UserRolesService();
            TblUserroles  obj_usr = er.searchUserRoles(id);
            request.setAttribute("searchResult", obj_usr);
            request.setAttribute("errorMessage", "Role has been defined already ");
            RequestDispatcher rd = request.getRequestDispatcher("UserRole_EditPage.jsp");
            rd.forward(request, response);
            
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
