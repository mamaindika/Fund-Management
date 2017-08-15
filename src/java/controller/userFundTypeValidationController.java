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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TblFunduserassign;
import model.TblRoleassign;
import model.TblUser;
import model.TblUsercredentials;
import service.FundTypesService;
import service.UserRolesService;
import service.UserService;
import service.loginService;

/**
 *
 * @author boc
 */

@WebServlet(name = "userFundTypeValidationController", urlPatterns = {"/userFundTypeValidationController"})
public class userFundTypeValidationController extends HttpServlet {

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
        
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        int fundId = Integer.parseInt(request.getParameter("fundtypes"));

        loginService loginService = new loginService();
        boolean result = loginService.authenticateUser(userId, encryptPassword(password),fundId);
         
        if(result == true){ 

            TblUsercredentials user = loginService.getUserByUserId(userId);
            UserService userSer = new UserService();

            TblFunduserassign fund = loginService.getfundTypeByuser(user.getTblUser().getPfNo(),fundId);
            FundTypesService fundSer = new FundTypesService();

            TblRoleassign role=loginService.getRoleByUser(user.getTblUser().getPfNo());
            UserRolesService userRoles = new UserRolesService();

            TblUser loggedUser = userSer.getUserByuserName(user.getUserId());
            TblFunduserassign loggedFundType=fundSer.getFundById(user.getTblUser().getPfNo(),fund.getTblFundtypes().getId());

            TblRoleassign loggedRoleId=userRoles.getRoleById(user.getTblUser().getPfNo(),role.getTblUserroles().getId());

            request.getSession().setAttribute("loggedRoleId",loggedRoleId.getTblUserroles().getId());

            request.getSession().setAttribute("loggedUserId",loggedUser.getPfNo() );
            request.getSession().setAttribute("loggedUserName",loggedUser.getUserName());
            request.getSession().setAttribute("loggedFundType",loggedFundType.getTblFundtypes().getId());
            System.out.println("encrypted pass1"+loggedUser.getPfNo());
            System.out.println("encrypted pass2"+loggedUser.getUserName());
            System.out.println("encrypted pass3"+loggedUser.getPfNo());

            response.sendRedirect("dashboardpage.jsp");     
        }
        else{

            
                  request.setAttribute("searchResult", userId);
                  request.setAttribute("searchResult1", password);
                  request.setAttribute("errorMessage", "Invalid fund type");
                  RequestDispatcher rd = request.getRequestDispatcher("/index_user.jsp");
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

    
    
     private static String encryptPassword(String password){
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
