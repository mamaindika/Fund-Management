/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TblAccountJournalmapping;
import service.MasterJournalsService;
import service.masterAccountsService;
import model.TblMasterjournals;
import model.TblMasteraccounts;
        

/**
 *
 * @author boc
 */
@WebServlet(name = "Account_JournalEditController ", urlPatterns = {"/Account_JournalEditController "})
public class Account_JournalEditController extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("searchValue"));
            int A_id = Integer.parseInt(request.getParameter("searchValue1"));
            int J_id = Integer.parseInt(request.getParameter("searchValue2"));
            System.out.println("inside edit conntroler");
            MasterJournalsService js=new MasterJournalsService();
            masterAccountsService as=new masterAccountsService();
            TblAccountJournalmapping add_obj= js.searchAccountJournalmapping(id);
            TblMasteraccounts ma=as.searchAccount(A_id);
            TblMasterjournals mj=js.searchAccount(J_id);
            
            
            RequestDispatcher rd =request.getRequestDispatcher("Account_Journal_EditPage.jsp"); 
            request.setAttribute("searchResult", add_obj);
            request.setAttribute("searchResult1", ma);
            request.setAttribute("searchResult2", mj);
            System.out.println(add_obj.toString());
            rd.forward(request, response);
        } catch(Exception e){
            e.printStackTrace();
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
