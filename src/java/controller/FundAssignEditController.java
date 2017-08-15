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
import model.TblDesignations;
import model.TblFunduserassign;
import model.TblUser;
import service.FundTypesService;
import service.UserService;
import model.TblFundtypes;
import model.TblRoleassign;
import model.TblUserroles;
import service.DesignationService;
import service.UserRolesService;

/**
 *
 * @author boc
 */

@WebServlet(name = "FundAssignEditController", urlPatterns = {"/FundAssignEditController"})
public class FundAssignEditController extends HttpServlet {

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
            int fundId=Integer.parseInt(request.getParameter("searchValue1"));
            
            System.out.println("id()"+id);
            System.out.println("pfno()"+pfno);
            System.out.println("fundId()"+fundId);
            System.out.println("inside edit conntroler1");
            
            UserService acs=new UserService(); 
            FundTypesService des= new FundTypesService();
            
            TblUser user_obj= acs.searchuser(pfno);
            TblFunduserassign assignFund_obj= des.searchAssignFund(id);
            TblFundtypes role_obj= des.searchUserFundType(fundId);
           
            System.out.println("inside edit conntroler");
            
            RequestDispatcher rd =request.getRequestDispatcher("FundAssign_EditPage.jsp"); 
               
            request.setAttribute("searchResult", user_obj);
            request.setAttribute("searchResult2", assignFund_obj);
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
