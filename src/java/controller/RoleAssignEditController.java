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
import service.UserService;

/**
 *
 * @author boc
 */
@WebServlet(name = "RoleAssignEditController", urlPatterns = {"/RoleAssignEditController"})
public class RoleAssignEditController extends HttpServlet {
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
        try {
 
            System.out.println("inside edit conntroler");
            int id=Integer.parseInt(request.getParameter("searchValue2"));
            int pfno=Integer.parseInt(request.getParameter("searchValue"));
            int roleId=Integer.parseInt(request.getParameter("searchValue1"));
            
            System.out.println("id()"+id);
            System.out.println("pfno()"+pfno);
            System.out.println("roleId()"+roleId);
            System.out.println("inside edit conntroler1");
            
            UserService acs=new UserService(); 
            UserRolesService des= new UserRolesService();
            
            TblUser user_obj= acs.searchuser(pfno);
            TblRoleassign roleass_obj= des.searchAssignRole(id);
            TblUserroles  role_obj= des.searchUserRoles(roleId);
           
            System.out.println("inside edit conntroler");
            
            RequestDispatcher rd =request.getRequestDispatcher("RoleAssign_UpdatePage.jsp"); 
               
            request.setAttribute("searchResult", user_obj);
            request.setAttribute("searchResult2", roleass_obj);
            request.setAttribute("searchResult1", role_obj);
            System.out.println(user_obj.toString());
            rd.forward(request, response);
              System.out.println("end role edit conntroler");
        } catch(Exception e){
            e.printStackTrace();
        }
        finally {            
            out.close();
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
