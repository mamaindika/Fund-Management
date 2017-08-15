/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TblInvestments;
import model.TblInvestmenttypes;
import model.TblMasterjournals;
import service.InvestmentTypesService;
import service.MasterJournalsService;

/**
 *
 * @author boc
 */

@WebServlet(name = "InvestmentViewController", urlPatterns = {"/InvestmentViewController"})
public class InvestmentViewController extends HttpServlet {

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
       // PrintWriter out = response.getWriter();
           String action = request.getParameter("action");
            if ((action.equals("View"))){
            int id = Integer.parseInt(request.getParameter("searchValue"));
            int Investid = Integer.parseInt(request.getParameter("searchValue1"));
            int jid = Integer.parseInt(request.getParameter("searchValue2"));
            
            
            System.out.println("inside edit investment conntroler");
            InvestmentTypesService acs=new InvestmentTypesService();
            MasterJournalsService mjs=new MasterJournalsService();
            TblInvestments add_obj= acs.search(id);
            TblInvestmenttypes acc_obj=acs.searchAccount(Investid);
            
            TblMasterjournals journals_obj=mjs.searchAccount(jid);
            
            RequestDispatcher rd =request.getRequestDispatcher("viewInvestment.jsp"); 
            request.setAttribute("searchResult", add_obj);
            request.setAttribute("searchResult1", acc_obj);
            request.setAttribute("searchResult2", journals_obj);
            System.out.println(add_obj.toString());
            rd.forward(request, response);
            }
    else if((action.equals("Close"))){
            int id = Integer.parseInt(request.getParameter("searchValue"));
            int Investid = Integer.parseInt(request.getParameter("searchValue1"));
            int jid = Integer.parseInt(request.getParameter("searchValue2"));
            
            
            System.out.println("inside edit investment conntroler");
            InvestmentTypesService acs=new InvestmentTypesService();
            MasterJournalsService mjs=new MasterJournalsService();
            TblInvestments add_obj= acs.search(id);
            TblInvestmenttypes acc_obj=acs.searchAccount(Investid);
            
            TblMasterjournals journals_obj=mjs.searchAccount(jid);
            
            RequestDispatcher rd =request.getRequestDispatcher("closeInvestment.jsp"); 
            request.setAttribute("searchResult", add_obj);
            request.setAttribute("searchResult1", acc_obj);
            request.setAttribute("searchResult2", journals_obj);
            System.out.println(add_obj.toString());
            rd.forward(request, response);
    }else{
        response.sendRedirect("index.jsp");
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
