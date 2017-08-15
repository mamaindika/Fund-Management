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
import model.TblFunduserassign;
import model.TblRoleassign;
import model.TblUser;
import model.TblUsercredentials;
import service.DesignationService;
import service.UserService;
import service.userCredentialsService;

/**
 *
 * @author boc
 */
@WebServlet(name = "userDeleteController", urlPatterns = {"/userDeleteController"})
public class userDeleteController extends HttpServlet {

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

        
        PrintWriter out = response.getWriter();
        try {
               /* TODO output your page here. You may use following sample code. */

            int pfNo = Integer.parseInt(request.getParameter("pfNo"));
            String userName = request.getParameter("userName");
            String salutations = request.getParameter("salutations");
            String firstName = request.getParameter("firstName");
            String lastName= request.getParameter("lastName");
        
            String status ="Deleted";
            String gender = request.getParameter("gender");

            String officeNo = request.getParameter("officeNo");
            String mobileNo = request.getParameter("mobileNo");
            String email = request.getParameter("email");        
       
            System.out.println("inside cont desig:- "+request.getParameter("designation"));
            int designationId = Integer.parseInt(request.getParameter("designation"));
  
            TblDesignations D_id = new TblDesignations();
            D_id.setId(designationId);
            System.out.println("test1");
            
            TblRoleassign tblRoleassign = null;
            TblFunduserassign tblFunduserassign=null;
            TblUsercredentials tblUsercredentials=null;
            
            TblUser ac = new TblUser(pfNo, D_id, salutations, firstName, lastName, userName, status, gender, officeNo, mobileNo, email,(Set<TblUsercredentials>)  tblUsercredentials,(Set<TblFunduserassign>) tblFunduserassign,(Set<TblRoleassign>) tblRoleassign);

            ac.setUserName(userName);
            ac.setTblDesignations(D_id);
            UserService acs = new UserService();
            DesignationService des= new DesignationService();
            String resultMessage = acs.updateUser(ac);
      
            TblUser add_obj= acs.searchUserAccount(userName+"");
        
            TblDesignations des_obj= des.searchDesignations(D_id+"");
            
            System.out.println(resultMessage);
            
 
        } catch(Exception e){
            e.printStackTrace();
            
        } finally {
            
            response.sendRedirect("User_ManagePage.jsp");
            
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
