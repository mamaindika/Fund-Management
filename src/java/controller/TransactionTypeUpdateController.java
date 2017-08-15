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
import model.TblAccountJournalmapping;
import model.TblFundtypes;
import model.TblFunduserassign;
import model.TblInvestments;
import model.TblMasteraccounts;
import model.TblMasterjournals;
import model.TblTransactionsdetails;
import model.TblTransactiontype;
import model.TblUser;
import service.DesignationService;
import service.FundTypesService;
import service.TransactionService;

/**
 *
 * @author boc
 */
@WebServlet(name = "TransactionTypeUpdateController", urlPatterns = {"/TransactionTypeUpdateController"})
public class TransactionTypeUpdateController extends HttpServlet {

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
        TransactionService acs = new TransactionService();
        TblTransactiontype result = acs.searchTransactionType(description);
        
        if(result == null){
        
            try {
                 /* TODO output your page here. You may use following sample code. */

                 TblTransactionsdetails tblTransactionsdetails = null;
                 TblTransactiontype ac = new TblTransactiontype(description, "Active", (Set<TblTransactionsdetails>)tblTransactionsdetails);



                 ac.setTransactionTypeId(id);
                 String resultMessage = acs.updateTransactionTypes(ac);
                 TblTransactiontype add_obj= acs.getTransactionById(id);

                 RequestDispatcher rd = request.getRequestDispatcher("Transaction_Type_ManagePage.jsp?message=" + resultMessage);
                 request.setAttribute("searchResult", add_obj);
                 rd.forward(request, response);

             } catch(Exception e){
                 e.printStackTrace();
             } finally {
                 out.close();
             }
       
       
        }else{
            
            TransactionService er = new TransactionService();
            TblTransactiontype obj_usr = er.getTransactionById(id);
            request.setAttribute("searchResult", obj_usr);
            request.setAttribute("errorMessage", "Designation has been defined already ");
            RequestDispatcher rd = request.getRequestDispatcher("TransactionType_EditPage.jsp");
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
