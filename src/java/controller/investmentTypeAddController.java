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
import model.TblInvestments;
import model.TblInvestmenttypes;
import service.InvestmentTypesService;

/**
 *
 * @author boc
 */

@WebServlet(name = "investmentTypeAddController", urlPatterns = {"/investmentTypeAddController"})
public class investmentTypeAddController extends HttpServlet {

   
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
        String description = request.getParameter("description");
        InvestmentTypesService acs = new InvestmentTypesService();
        TblInvestmenttypes result = acs.searchDesc(description);
        
        if(result == null){
        
        try {
            /* TODO output your page here. You may use following sample code. */

     
            
            
            
            TblInvestments tblInvestments=null;
            TblInvestmenttypes ac = new TblInvestmenttypes(description,(Set<TblInvestments>) tblInvestments);
          
            
            String resultMessage = acs.addInvestment(ac);

            RequestDispatcher rd = request.getRequestDispatcher("InvestmentTypesManagePage.jsp?message=" + resultMessage);
            request.setAttribute("searchResult", null);
            rd.forward(request, response);
        
        } finally {
            out.close();
        }
        
        }else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('You can not enter same type ');");
                out.println("location='InvestmentTypesManagePage.jsp';");
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