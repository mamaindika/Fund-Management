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
import model.TblMasterjournals;
import model.TblAccountJournalmapping;
import model.TblFundtypes;
import service.MasterJournalsService;
import model.TblTransactionsdetails;
import model.TblInvestments;



/**
 *
 * @author boc
 */
@WebServlet(name = "MasterJournalsAddController", urlPatterns = {"/MasterJournalsAddController"})
public class MasterJournalsAddController extends HttpServlet {
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
        
        
            int journalNo=Integer.parseInt(request.getParameter("journalNo"));
            String journalName =request.getParameter("journalName");
            String journalDescription =request.getParameter("journalDescription");
            String typeOfJournal =request.getParameter("typeOfJournal");
            String status =request.getParameter("status");
            
            int fundtype= (Integer)request.getSession().getAttribute("loggedFundType");
        
            MasterJournalsService acs = new MasterJournalsService();
            TblMasterjournals result = acs.searchAccount(journalNo);
        
        if(result == null){
        
        
        try {
            /* TODO output your page here. You may use following sample code. */


            TblFundtypes fund = new TblFundtypes();
            fund.setId(fundtype);
            TblAccountJournalmapping tblAccountJournalmappings=null;
            //TblTransactionsdetails tblTransactionsdetails=null;
            //TblInvestments tblInvestments=null;
            
          //fund,journalNo, journalName, journalDescription, typeOfJournal, status, (Set<TblAccountJournalmapping>) tblAccountJournalmappings, (Set<TblTransactionsdetails>)tblTransactionsdetails,(Set<TblInvestments>)tblInvestments
           // TblMasterjournals ac = new TblMasterjournals(fund,journalNo, journalName, journalDescription, typeOfJournal, status, (Set<TblAccountJournalmapping>) tblAccountJournalmappings, (Set<TblTransactionsdetails>)tblTransactionsdetails,(Set<TblInvestments>)tblInvestments);
             TblMasterjournals ac = new TblMasterjournals(journalNo, fund, journalName, journalDescription, typeOfJournal, status, (Set<TblAccountJournalmapping>)tblAccountJournalmappings);
            
            
            String resultMessage = acs.addMasterjournals(ac);

            RequestDispatcher rd = request.getRequestDispatcher("MasterJournals_ManagePage.jsp?message=" + resultMessage);
            request.setAttribute("searchResult", null);
            rd.forward(request, response);
        
        } finally {
            out.close();
        }
        
        }else{
            out.println("<script type=\"text/javascript\">");
                out.println("alert('Journal has been assigned already');");
                out.println("location='MasterJournals_ManagePage.jsp';");
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
