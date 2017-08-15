/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TblDesignations;
import model.TblFunduserassign;
import service.UserService;
import model.TblUser;
import model.TblRoleassign;
import model.TblUsercredentials;


/**
 *
 * @author boc
 */

@WebServlet(name = "userAddController", urlPatterns = {"/userAddController"})
public class userAddController extends HttpServlet {

   
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
            /* TODO output your page here. You may use following sample code. */

            int pfNo = Integer.parseInt(request.getParameter("pfNo"));
            String userName = request.getParameter("userName");
            String salutations = request.getParameter("salutations");
            String firstName = request.getParameter("firstName");
            String lastName= request.getParameter("lastName");
            
            String status = request.getParameter("status");
         
            String gender=   request.getParameter("gender");

            String officeNo = request.getParameter("officeNo");
            String mobileNo = request.getParameter("mobileNo");
            String email = request.getParameter("email");        

            System.out.println("inside cont desig:- "+request.getParameter("designation"));
            int designationId = Integer.parseInt(request.getParameter("designation"));
        
            String userId = request.getParameter("userName");
            String password = request.getParameter("userName");
            
            userId=userId.toUpperCase();

            TblDesignations tempdesig = new TblDesignations();
            tempdesig.setId(designationId);
           
            System.out.println("test1");

            TblUsercredentials tblUsercredentials=null;
            
            TblRoleassign tblRoleassign = null;
            TblFunduserassign tblFunduserassign=null;

            TblUser ac = new TblUser(pfNo, tempdesig, salutations, firstName, lastName, userName, status, gender, officeNo, mobileNo, email,(Set<TblUsercredentials>)  tblUsercredentials,(Set<TblFunduserassign>) tblFunduserassign,(Set<TblRoleassign>) tblRoleassign);

            UserService acs = new UserService();
           
            String resultMessage = acs.addUser(ac);
            
            TblUsercredentials a=new TblUsercredentials(userId, ac, encryptPassword(password),1,1);
            UserService abs=new UserService();
            String resultMessage1 = abs.AddUserCredentials(a);
            
            resultMessage=resultMessage1;
            RequestDispatcher rd = request.getRequestDispatcher("User_ManagePage.jsp?message=" + resultMessage1+resultMessage);
            request.setAttribute("searchResult", null);
            rd.forward(request, response);
            System.out.println(resultMessage1);
            
            
        } finally {
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


    private static String encryptPassword(String password)
{
    String sha1 = "";
    try
    {
        MessageDigest crypt = MessageDigest.getInstance("SHA-1");
        crypt.reset();
        crypt.update(password.getBytes("UTF-8"));
        sha1 = byteToHex(crypt.digest());
    }
    catch(NoSuchAlgorithmException e)
    {
        e.printStackTrace();
    }
    catch(UnsupportedEncodingException e)
    {
        e.printStackTrace();
    }
    return sha1;
}
    
  private static String byteToHex(final byte[] hash)
{
    Formatter formatter = new Formatter();
    for (byte b : hash)
    {
        formatter.format("%02x", b);
    }
    String result = formatter.toString();
    formatter.close();
    return result;
} 
}



