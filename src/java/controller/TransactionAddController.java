/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
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
import model.TblTransactiontype;
import service.TransactionService;


/**
 *
 * @author boc
 */
@WebServlet(name = "TransactionAddController", urlPatterns = {"/TransactionAddController"})
public class TransactionAddController extends HttpServlet {


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
       
           
            int journal_No = Integer.parseInt(request.getParameter("JournalEntry"));   
                TblAccountJournalmapping  jId = new TblAccountJournalmapping();
                jId.setId(journal_No);
            System.out.println(journal_No); 
                  
            int TransactionId = Integer.parseInt(request.getParameter("Transaction"));   
                TblTransactiontype  temptr = new TblTransactiontype();
                temptr. setTransactionTypeId(TransactionId);
                System.out.println(TransactionId);
            TransactionService ts = new TransactionService();
            TblMasterjournals tm = ts.getJournalNameByJournalNo(journal_No);
            
            
            String journal_description = tm.getJournalDescription();
            String journal_name = tm.getJournalName();
            
            System.out.println(journal_description+"555"+journal_name );
        
            String createdDate =new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss").format(Calendar.getInstance().getTime());
            //Date createdDate =null;
            
            //String user= request.getSession().getAttribute("loggedUserId").toString();        
            //String createdUser = user;
            
         
            String TransactionDate =request.getParameter("TransactionDate");
            
            //double TransactionAmount =Double.parseDouble(request.getParameter("TransactionAmount"));
            
            String TransactionDescription  =request.getParameter("Detail");  
            
            request.setAttribute("journalNo", journal_No);
            request.setAttribute("journalDescription", journal_description);
            request.setAttribute("journalName", journal_name);
            
            String status ="Pending";
            
            String authorizedUser =null;
            
            String authorizedDate = null;
            
            String comments = null;
          
            
            int fundtype= (Integer)request.getSession().getAttribute("loggedFundType");
            TblFundtypes fund = new TblFundtypes();
            fund.setId(fundtype);
            TblAccountJournalmapping tblAccountJournalmapping=null;
            
             //TblTransactionsdetails ac = new TblTransactionsdetails(jId, fund, temptr, createdDate, createdUser, TransactionDate, TransactionDescription, status, authorizedUser, authorizedDate, comments);
             TransactionService tranSer =new TransactionService();
             //String resultMessage = tranSer.AddTransactionsdetail(ac);
            // request.setAttribute("searchResult", null);
             RequestDispatcher rd = request.getRequestDispatcher("TransactionJournalManage.jsp");
             
             rd.forward(request, response);
         
      
                
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
