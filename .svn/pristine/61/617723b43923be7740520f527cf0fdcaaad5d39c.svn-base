/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TblAccountJournalmapping;
import model.TblFundtypes;
import model.TblMasterjournals;
import model.TblTransactionsdetails;
import model.TblTransactiontype;
import service.MasterJournalsService;
import service.TransactionService;

/**
 *
 * @author boc
 */
@WebServlet(name = "TransactionUpdateController", urlPatterns = {"/TransactionUpdateController"})
public class TransactionUpdateController extends HttpServlet {

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
    String action = request.getParameter("action");
//"Authorize".equals(action)
    if ((action.equals("Authorize"))) {
        int id = Integer.parseInt(request.getParameter("id").trim());   
        int journalId = Integer.parseInt(request.getParameter("JournalEntry"));   
               TblAccountJournalmapping  jId = new TblAccountJournalmapping();
                jId.setId(journalId);
            System.out.println(journalId);       
        int Tid = Integer.parseInt(request.getParameter("Transaction"));   
            TblTransactiontype  temptr = new TblTransactiontype();
            temptr. setTransactionTypeId(Tid);
            System.out.println(Tid);
        String createdDate=request.getParameter("createdDate");
        String createdUser=request.getParameter("createdUser"); 
        String TransactionDate =request.getParameter("TransactionDate");
        double TransactionAmount =Double.parseDouble(request.getParameter("TransactionAmount"));
        String TransactionDescription  =request.getParameter("Detail");   
        String status ="Authorize";
        String authorizedUser =request.getSession().getAttribute("loggedUserId")
                .toString();               
        String authorizedDate =new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss")
                .format(Calendar.getInstance().getTime());
        String comments = request.getParameter("Comments");

        int fundtype= (Integer)request.getSession().getAttribute("loggedFundType");
            TblFundtypes fund = new TblFundtypes();
            fund.setId(fundtype);
          
            
//        TblTransactionsdetails ac = new TblTransactionsdetails(fund, jId, temptr, createdDate, createdUser, TransactionDate, BigDecimal.valueOf(TransactionAmount), TransactionDescription, status, authorizedUser, authorizedDate, comments);
//          
TblTransactionsdetails ac = new TblTransactionsdetails(jId, fund, temptr, createdDate, createdUser, TransactionDate, BigDecimal.valueOf(TransactionAmount), TransactionDescription, status, authorizedUser, authorizedDate, comments);
           
         TransactionService tranSer =new TransactionService();
         ac.setId(id);
         ac.setTblAccountJournalmapping(jId);
         ac.setTblTransactiontype(temptr);

         String resultMessage = tranSer.updateTransactions(ac);

        TransactionService acs=new TransactionService(); 
        TblTransactionsdetails user_obj= acs.searchTransactionsdetails(id);
        MasterJournalsService des= new MasterJournalsService();
        TblMasterjournals jur_obj= des.searchAccount(journalId);
        TblTransactiontype Transactiontype= acs.searchTransactionstype(Tid);


        RequestDispatcher rd =request.getRequestDispatcher("TransactionManagePage.jsp?message=" + resultMessage);
        System.out.println("inside out conntroler"); 
        request.setAttribute("searchResult", user_obj);
        request.setAttribute("searchResult1", jur_obj);
        request.setAttribute("searchResult2", Transactiontype);  

        rd.forward(request, response);

    }
    
    else if ((action.equals("Modify"))) {
        int id = Integer.parseInt(request.getParameter("id").trim());   
        int journalId = Integer.parseInt(request.getParameter("JournalEntry"));   
                  TblAccountJournalmapping  jId = new TblAccountJournalmapping();
                jId.setId(journalId);
                   
            System.out.println(journalId);       
        int Tid = Integer.parseInt(request.getParameter("Transaction"));   
            TblTransactiontype  temptr = new TblTransactiontype();
            temptr. setTransactionTypeId(Tid);
            System.out.println(Tid);
        String createdDate=request.getParameter("createdDate");
        String createdUser=request.getParameter("createdUser"); 
        String TransactionDate =request.getParameter("TransactionDate");
         double TransactionAmount =Double.parseDouble(request.getParameter("TransactionAmount"));
        String TransactionDescription  =request.getParameter("Detail");   
        String status ="Pending";
        String authorizedUser =request.getSession().getAttribute("loggedUserId")
                .toString();               
        String authorizedDate =new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss")
                .format(Calendar.getInstance().getTime());
        String comments = request.getParameter("Comments");

        int fundtype= (Integer)request.getSession().getAttribute("loggedFundType");
            TblFundtypes fund = new TblFundtypes();
            fund.setId(fundtype);
          
            
//        TblTransactionsdetails ac = new TblTransactionsdetails(fund, jId, temptr, createdDate, createdUser, TransactionDate, BigDecimal.valueOf(TransactionAmount), TransactionDescription, status, authorizedUser, authorizedDate, comments);
//       
TblTransactionsdetails ac = new TblTransactionsdetails(jId, fund, temptr, createdDate, createdUser, TransactionDate, BigDecimal.valueOf(TransactionAmount), TransactionDescription, status, authorizedUser, authorizedDate, comments);
           
         TransactionService tranSer =new TransactionService();
         ac.setId(id);
         ac.setTblAccountJournalmapping(jId);
         ac.setTblTransactiontype(temptr);

         String resultMessage = tranSer.updateTransactions(ac);

        TransactionService acs=new TransactionService(); 
        TblTransactionsdetails user_obj= acs.searchTransactionsdetails(id);
        MasterJournalsService des= new MasterJournalsService();
        TblMasterjournals jur_obj= des.searchAccount(journalId);
        TblTransactiontype Transactiontype= acs.searchTransactionstype(Tid);


        RequestDispatcher rd =request.getRequestDispatcher("TransactionManagePage.jsp?message=" + resultMessage);
        System.out.println("inside out conntroler"); 
        request.setAttribute("searchResult", user_obj);
        request.setAttribute("searchResult1", jur_obj);
        request.setAttribute("searchResult2", Transactiontype);  

        rd.forward(request, response);   
     }
     
    else if ((action.equals("Reject"))) {
        int id = Integer.parseInt(request.getParameter("id").trim());   
      int journalId = Integer.parseInt(request.getParameter("JournalEntry"));   
              TblAccountJournalmapping  jId = new TblAccountJournalmapping();
                jId.setId(journalId);
            System.out.println(journalId);              
        int Tid = Integer.parseInt(request.getParameter("Transaction"));   
            TblTransactiontype  temptr = new TblTransactiontype();
            temptr. setTransactionTypeId(Tid);
            System.out.println(Tid);
        String createdDate=request.getParameter("createdDate");
        String createdUser=request.getParameter("createdUser"); 
        String TransactionDate =request.getParameter("TransactionDate");
         double TransactionAmount =Double.parseDouble(request.getParameter("TransactionAmount"));
        String TransactionDescription  =request.getParameter("Detail");   
        String status ="Reject";
        String authorizedUser =request.getSession().getAttribute("loggedUserId")
                .toString();               
        String authorizedDate =new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss")
                .format(Calendar.getInstance().getTime());
        String comments = request.getParameter("Comments");

        int fundtype= (Integer)request.getSession().getAttribute("loggedFundType");
            TblFundtypes fund = new TblFundtypes();
            fund.setId(fundtype);
          
            
        //TblTransactionsdetails ac = new TblTransactionsdetails(fund, jId, temptr, createdDate, createdUser, TransactionDate, BigDecimal.valueOf(TransactionAmount), TransactionDescription, status, authorizedUser, authorizedDate, comments);
       
        TblTransactionsdetails ac = new TblTransactionsdetails(jId, fund, temptr, createdDate, createdUser, TransactionDate, BigDecimal.valueOf(TransactionAmount), TransactionDescription, status, authorizedUser, authorizedDate, comments);
           
         TransactionService tranSer =new TransactionService();
         ac.setId(id);
         ac.setTblAccountJournalmapping(jId);
         ac.setTblTransactiontype(temptr);

         String resultMessage = tranSer.updateTransactions(ac);

        TransactionService acs=new TransactionService(); 
        TblTransactionsdetails user_obj= acs.searchTransactionsdetails(id);
        MasterJournalsService des= new MasterJournalsService();
        TblMasterjournals jur_obj= des.searchAccount(journalId);
        TblTransactiontype Transactiontype= acs.searchTransactionstype(Tid);


        RequestDispatcher rd =request.getRequestDispatcher("TransactionManagePage.jsp?message=" + resultMessage);
        System.out.println("inside out conntroler"); 
        request.setAttribute("searchResult", user_obj);
        request.setAttribute("searchResult1", jur_obj);
        request.setAttribute("searchResult2", Transactiontype);  

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
