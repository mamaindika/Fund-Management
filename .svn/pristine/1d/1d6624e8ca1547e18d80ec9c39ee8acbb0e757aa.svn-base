/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TblAccountJournalmapping;
import model.TblFundtypes;
import model.TblInvestments;
import model.TblInvestmenttypes;
import model.TblMasterjournals;
import service.InvestmentTypesService;
import service.MasterJournalsService;

/**
 *
 * @author boc
 */

@WebServlet(name = "InvestmentCloseController", urlPatterns = {"/InvestmentCloseController"})
public class InvestmentCloseController extends HttpServlet {
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

            int id = Integer.parseInt(request.getParameter("id").trim());  
            int InvestmentId = Integer.parseInt(request.getParameter("InvestmentType"));   
                        TblInvestmenttypes  tempd = new TblInvestmenttypes();
                        tempd.setId(InvestmentId);
                        System.out.println(InvestmentId);

            int referenceNo =Integer.parseInt(request.getParameter("referenceNo"));   
            int ReceiptNo =Integer.parseInt(request.getParameter("ReceiptNo"));   
            String  InvestDate =request.getParameter("InvestDate");   
            String MatureDate =request.getParameter("MatureDate");   
            int NoOfDays =Integer.parseInt(request.getParameter("NoOfDays")); 
            double Amount =Double.parseDouble(request.getParameter("Amount"));   
            int TaxRate;
                       if(request.getParameter("TaxRate").equals("W"))
                           TaxRate = 1;
                       else
                           TaxRate = 2;

            String TaxValue  =request.getParameter("TaxValue");   

            System.out.println(TaxValue);

            int InterestRate;
                       if(request.getParameter("InterestRate").equals("Fixed"))
                           InterestRate = 1;
                       else
                           InterestRate = 2;


            double InterestValue=Double.parseDouble(request.getParameter("InterestValue"));
            
            int InterestAt;
                       if(request.getParameter("InterestAt").equals("M"))
                           InterestAt = 1;
                       else
                           InterestAt = 0;     


            int fundtype= (Integer)request.getSession().getAttribute("loggedFundType");
            TblFundtypes fund = new TblFundtypes();
            fund.setId(fundtype);
            int journalId = Integer.parseInt(request.getParameter("JournalEntry"));   
                TblAccountJournalmapping  jId = new TblAccountJournalmapping();
                jId.setId(journalId);
                
            System.out.println(journalId);      
            String status  ="Close"; 

            double x;
            double interest=0;
            int year=NoOfDays/365;
            int i=0;
                System.out.println("year"+year); 

               if((NoOfDays>365)&&(InterestRate==1)&&(InterestAt==1)) {
                while (i <= year) {  
                    x =((Amount* NoOfDays*InterestValue)/(356*100));
                System.out.println("x"+x); 
                      interest  =x; 
               Amount=Amount+x;
                 System.out.println("Amount"+Amount);
               i++;
                }} else{
                    interest  =4; 
               }
              System.out.println("interest"+BigDecimal.valueOf(interest));   
              System.out.println("Amount"+BigDecimal.valueOf(Amount));  
              
            TblInvestments investment= new TblInvestments(jId, fund, tempd, referenceNo, ReceiptNo, InvestDate, MatureDate, NoOfDays, BigDecimal.valueOf(Amount), TaxRate, TaxValue, InterestRate, BigDecimal.valueOf(InterestValue), InterestAt, BigDecimal.valueOf(interest),status);
            investment.setId(id);
            investment.setTblAccountJournalmapping(jId);
            investment.setTblInvestmenttypes(tempd);
                  
            InvestmentTypesService investmentSer = new InvestmentTypesService();
           
            MasterJournalsService mjs=new MasterJournalsService();
            TblInvestments add_obj= investmentSer.search(id);
            TblInvestmenttypes acc_obj=investmentSer.searchAccount(InvestmentId);
            
            TblMasterjournals journals_obj=mjs.searchAccount(journalId);
            
            String resultMessage = investmentSer.updateInvestment(investment);
             
            RequestDispatcher rd = request.getRequestDispatcher("closeInvestment.jsp?message=" + resultMessage);
            request.setAttribute("searchResult", add_obj);
            request.setAttribute("searchResult1", acc_obj);
            request.setAttribute("searchResult2", journals_obj);
            rd.forward(request, response);

            }
            finally {
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

