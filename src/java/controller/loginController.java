/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

//import com.sun.org.apache.xalan.internal.xsltc.util.IntegerArray;
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
import model.TblUsercredentials;
import service.loginService;
import service.UserService;
import model.TblUser;
import model.TblFunduserassign;
import model.TblRoleassign;
import service.FundTypesService;
import service.UserRolesService;
/**
 *
 * @author Hashini Hemanjali
 */
@WebServlet(name = "loginController", urlPatterns = {"/loginController"})
public class loginController extends HttpServlet {

    /**
     * Processes requests for both HTTP loginController<code>GET</code> and <code>POST</code>
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
    //PrintWriter out = response.getWriter();
    
        String userId = request.getParameter("userId");
	String password = request.getParameter("password");
       
        
        loginService loginService = new loginService();
	String result = loginService.authenticateAdminUser(userId, encryptPassword(password));


      
        


      
         
        if(result == "UserLogin"){ 
            
            TblUsercredentials firstLog = loginService.getUserByUserId(userId);
            
            if(firstLog.getFirstLogin()==1){
                UserService nm = new UserService();
                TblUser user = nm.getUserByuserUsername(userId);
                RequestDispatcher rd =request.getRequestDispatcher("firstLog_user.jsp"); 
                request.setAttribute("searchResult", userId);
                request.setAttribute("searchResult1", user);
                rd.forward(request, response);
                
            }else{
                
            
            RequestDispatcher rd =request.getRequestDispatcher("index_user.jsp"); 
            request.setAttribute("searchResult", userId);
            request.setAttribute("searchResult1", password);
            rd.forward(request, response);
            
            
            }
                
                
            
            
            
        }else if(result == "AdminLogin"){ 
            
            TblUsercredentials firstLog = loginService.getUserByUserId(userId);
            
            if(firstLog.getFirstLogin()==1){
                UserService nm = new UserService();
                TblUser user = nm.getUserByuserUsername(userId);
                RequestDispatcher rd =request.getRequestDispatcher("firstLog_user.jsp"); 
                request.setAttribute("searchResult", userId);
                request.setAttribute("searchResult1", user);
                rd.forward(request, response);
                
            }else{
                
            TblUsercredentials user = loginService.getUserByUserId(userId);
            UserService userSer = new UserService();

            TblRoleassign role=loginService.getRoleByUser(user.getTblUser().getPfNo());
            UserRolesService userRoles = new UserRolesService();

            TblUser loggedUser = userSer.getUserByuserName(user.getUserId());

            TblRoleassign loggedRoleId=userRoles.getRoleById(user.getTblUser().getPfNo(),role.getTblUserroles().getId());
            request.getSession().setAttribute("loggedRoleId",loggedRoleId.getTblUserroles().getId());
            request.getSession().setAttribute("loggedUserName",loggedUser.getUserName());
            request.getSession().setAttribute("loggedUserId",loggedUser.getPfNo() );

            response.sendRedirect("dashboardpage.jsp"); 

            
            }


            
            
        }else if(result == "Unauthorized"){
	
                  request.setAttribute("errorMessage", "Invalid user");
                  RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                  rd.forward(request, response);
           
        }else if(result == "WrrrongPassword"){
            
                  request.setAttribute("errorMessage", "Invalid password");
                  RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
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

