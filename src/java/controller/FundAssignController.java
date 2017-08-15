/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TblFunduserassign;
import model.TblFundtypes;
import model.TblUser;
import service.FundTypesService;
/**
 *
 * @author boc
 */
@WebServlet(name = "FundAssignController", urlPatterns = {"/FundAssignController"})
public class FundAssignController extends HttpServlet {
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
 
  
            /* TODO output your page here. You may use following sample code. */


            int fundId = Integer.parseInt(request.getParameter("fund")); 
            int pfNo = Integer.parseInt(request.getParameter("pfno"));
            
            
           FundTypesService validate = new FundTypesService();
           TblFunduserassign result = validate.getFundById(pfNo, fundId);
            
            if(result == null){
                
                try {
                
                    System.out.println("inside cont role:- "+request.getParameter("fund"));
                    System.out.println("inside cont pfno:- "+request.getParameter("pfno"));
  

                    TblFundtypes  tempd = new TblFundtypes();
                    tempd.setId(fundId);
                    System.out.println(fundId);

  
                    TblUser  temppfNo = new TblUser();
                    temppfNo.setPfNo(pfNo);
                    System.out.println(pfNo);

                    TblFunduserassign fundAss  = new TblFunduserassign(tempd, temppfNo, 1);

                    FundTypesService  fundSer = new FundTypesService();
                    String resultMessage = fundSer.assignFund(fundAss);
                    System.out.println("1"+temppfNo);
                    System.out.println("2"+tempd);
                    RequestDispatcher rd = request.getRequestDispatcher("FundAssign_ManagePage.jsp?message=" + resultMessage);
                    request.setAttribute("searchResult", null);
                    rd.forward(request, response);
                 }finally {
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
