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
import model.TblMasteraccounts;
import service.masterAccountsService;
import model.TblAccountJournalmapping;
import model.TblFundtypes;


/**
 *
 * @author Boc
 */
@WebServlet(name = "addMasterAccountsController", urlPatterns = {"/addMasterAccountsController"})
public class addMasterAccountsController extends HttpServlet {

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
        
        
            int accountNo = Integer.parseInt(request.getParameter("accountNo"));
            String accountName = request.getParameter("accountName");
            String currentLedger = request.getParameter("currentLedger");
            String typeOfAccount = request.getParameter("typeOfAccount");
            String status = request.getParameter("status");
            int fundtype= (Integer)request.getSession().getAttribute("loggedFundType");
        
        
        
        masterAccountsService AccountsSer = new masterAccountsService();
        TblMasteraccounts result = AccountsSer.searchAccount(accountNo);
        
        
        if(result == null){
        
        
        
        
        try {
            /* TODO output your page here. You may use following sample code. */


            TblFundtypes fund = new TblFundtypes();
            fund.setId(fundtype);
            System.out.println("ttttttt"+accountNo);
            TblAccountJournalmapping   tblAccountJournalmappingsForAccountName=null;
            TblAccountJournalmapping        tblAccountJournalmappingsForAccountNo=null;

            TblMasteraccounts ac = new TblMasteraccounts(accountNo, fund, accountName, currentLedger, typeOfAccount, status, (Set<TblAccountJournalmapping>)tblAccountJournalmappingsForAccountNo);

            
            String resultMessage = AccountsSer.addMasterAccounts(ac);

            RequestDispatcher rd = request.getRequestDispatcher("MasterAccounts_ManagePage.jsp?message=" + resultMessage);
            request.setAttribute("searchResult", null);
            rd.forward(request, response);
        
        } finally {
            out.close();
        }
        
        
        
        }else{
            out.println("<script type=\"text/javascript\">");
                out.println("alert('Account has been assigned already');");
                out.println("location='MasterAccounts_ManagePage.jsp';");
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
