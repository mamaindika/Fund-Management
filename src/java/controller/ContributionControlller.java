///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import model.TblContributions;
//import model.TblAccountJournalmapping;
//import service.ContributionService;
//import model.TblTransactiontype;
//import model.TblTransactionsdetail;
//import model.TblMasterjournals;
///**
// *
// * @author boc
// */
//@WebServlet(name = "ContributionControlller", urlPatterns = {"/ContributionControlller"})
//public class ContributionControlller extends HttpServlet {
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        try {
//            /* TODO output your page here. You may use following sample code. */
//            
//    int TransactionType = Integer.parseInt(request.getParameter("Transaction"));   
//            TblTransactiontype  temptr = new TblTransactiontype();
//            temptr. setTransactionId(TransactionType);
//            System.out.println(TransactionType);
//            
//
//    int journal_No = Integer.parseInt(request.getParameter("id"));   
//            TblAccountJournalmapping  jId = new TblAccountJournalmapping();
//            jId.setId(journal_No);
//            System.out.println(journal_No);       
//            
//    int journalId = Integer.parseInt(request.getParameter("JournalEntry"));   
//            TblMasterjournals  tempd = new TblMasterjournals();
//            tempd.setId(journalId);
//            System.out.println(journalId);
//             
//    String description =request.getParameter("Detail");
//    String transactionDate =request.getParameter("TransactionDate");
//       
//    String Transaction_amount =request.getParameter("TransactionAmount");
//        
//    TblTransactionsdetail ac = new TblTransactionsdetail(tempd, temptr, createdDate, description, journalId, transactionDate, TransactionType, transactionDate, description, transactionDate, authorizedDate);
//            ContributionService acs = new ContributionService();
//            String resultMessage = acs.AddContributions(ac);
//
//            RequestDispatcher rd = request.getRequestDispatcher("InwardRemittance.jsp?message=" + resultMessage);
//            request.setAttribute("searchResult", null);
//            rd.forward(request, response);
//        
//        } finally {
//            out.close();
//        }
//    }
//        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
