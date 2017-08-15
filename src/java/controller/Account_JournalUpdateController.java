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
import model.TblInvestments;
import model.TblMasteraccounts;
import model.TblMasterjournals;
import model.TblTransactionsdetails;
import service.MasterJournalsService;
import service.masterAccountsService;

/**
 *
 * @author boc
 */
@WebServlet(name = "Account_JournalUpdateController", urlPatterns = {"/Account_JournalUpdateController"})
public class Account_JournalUpdateController extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("id"));  
            int journalId = Integer.parseInt(request.getParameter("JournalName"));   
            TblMasterjournals  tempd = new TblMasterjournals();
            tempd.setJournalNo(journalId);
            
            int AccountNo = Integer.parseInt(request.getParameter("AccountNo"));  
            TblMasteraccounts tempac = new TblMasteraccounts();
            tempac.setAccountNo(AccountNo);
               int fundtype= (Integer)request.getSession().getAttribute("loggedFundType");
            TblFundtypes fund = new TblFundtypes();
            fund.setId(fundtype);   
            String process =request.getParameter("Process");
            String status =request.getParameter("status");

            
            TblInvestments tblInvestments=null;
            TblTransactionsdetails tblTransactionsdetails=null;
            TblAccountJournalmapping ac = new TblAccountJournalmapping(fund, tempac, tempd, process, status,(Set<TblTransactionsdetails>)tblTransactionsdetails,(Set<TblInvestments>) tblInvestments);

            ac.setId(id);
            ac.setTblMasteraccounts(tempac);
            ac.setTblMasterjournals(tempd);
            masterAccountsService acs = new masterAccountsService();
            MasterJournalsService des = new MasterJournalsService();
            
            String resultMessage = des.updateAccountJournalmapping(ac);
                               
            TblAccountJournalmapping add_obj= des.searchAccountJournalmapping(id);
            TblMasteraccounts  ma= acs.searchAccount(AccountNo);
            TblMasterjournals mj=des.searchAccount(journalId);
             
            RequestDispatcher rd =request.getRequestDispatcher("Account_Journal_ManagePage.jsp?message=" + resultMessage);
            
            request.setAttribute("searchResult", add_obj);
            request.setAttribute("searchResult1", ma);
            request.setAttribute("searchResult2", mj);
            
            rd.forward(request, response);
        } catch(Exception e){
            e.printStackTrace();
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

}