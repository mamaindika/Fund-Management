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
import model.TblUser;
import service.UserService;
import model.TblFunduserassign;
import model.TblFundtypes;
import service.FundTypesService;

/**
 *
 * @author boc
 */

@WebServlet(name = "FundAssignUpdateController", urlPatterns = {"/FundAssignUpdateController"})
public class FundAssignUpdateController extends HttpServlet {

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
        int pfno = Integer.parseInt(request.getParameter("pfno"));
        int fundId = Integer.parseInt(request.getParameter("fund")); 
        
        FundTypesService des= new FundTypesService();
        TblFunduserassign result = des.checkUserDetails(fundId, pfno);
        
        if(result == null){
        
        try {
            /* TODO output your page here. You may use following sample code. */
        
            
            
            TblUser U_id = new TblUser();
            U_id.setPfNo(pfno);
            
            TblFundtypes Fund_id = new TblFundtypes();
            Fund_id.setId(fundId);
            
            int status=2;
            
            TblFunduserassign   ac = new TblFunduserassign(Fund_id, U_id, status);
            ac.setId(id);
            ac.setTblUser(U_id);
            ac.setTblFundtypes(Fund_id);
            System.out.println("inside update conntroler111111");
            
            UserService acs=new UserService(); 
            FundTypesService fundass= new FundTypesService();
            String resultMessage = fundass.updateFundAssign(ac);
            
           
            
            TblUser user_obj= acs.searchuser(pfno);
            TblFundtypes  fund_obj= des.searchAccount(fundId);
            TblFunduserassign fundass_obj= des.searchAssignFund(id);
            
            System.out.println("//");
            
            System.out.println(U_id);
            System.out.println(status);
            System.out.println(fund_obj);
            
            System.out.println("inside update conntroler222222222");
            RequestDispatcher rd =request.getRequestDispatcher("FundAssign_ManagePage.jsp?message=" + resultMessage);
            
            request.setAttribute("searchResult", user_obj);
            request.setAttribute("searchResult2", fundass_obj);
            request.setAttribute("searchResult1", fund_obj);
    
            

            rd.forward(request, response);
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            out.close();
        }
        
        }else{
        
                  
                  out.println("<script type=\"text/javascript\">");
                out.println("alert('Fund type has been assigned already');");
                out.println("location='FundAssign_ManagePage.jsp';");
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
