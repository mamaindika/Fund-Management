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
import model.TblDesignations;
import model.TblFunduserassign;
import model.TblFundtypes;
import service.FundTypesService;
import model.TblMasterjournals;
import model.TblMasteraccounts;
import model.TblInvestments;
import model.TblTransactionsdetails;
import service.DesignationService;

/**
 *
 * @author boc
 */
@WebServlet(name = "fundTypeUpdateController", urlPatterns = {"/fundTypeUpdateController"})
public class fundTypeUpdateController extends HttpServlet {

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
        FundTypesService acs = new FundTypesService();
        TblFundtypes result = acs.searchUserFundTypeDesc(description);
        
        if(result == null){
        
        
       try {
            /* TODO output your page here. You may use following sample code. */
            
            
            TblFunduserassign tblFundassign=null;
            TblMasterjournals masterjournals=null;
            TblMasteraccounts tblMasteraccounts=null;
            TblInvestments tblInvestments=null;
            TblTransactionsdetails tblTransactionsdetails=null;
            TblAccountJournalmapping tblAccountJournalmapping=null;

            TblFundtypes ac = new TblFundtypes(description,"Active" ,(Set<TblAccountJournalmapping>)tblAccountJournalmapping, (Set<TblFunduserassign>) tblFundassign, (Set<TblMasteraccounts>)tblMasteraccounts,(Set<TblTransactionsdetails>)tblTransactionsdetails, (Set<TblMasterjournals>)masterjournals,(Set<TblInvestments>) tblInvestments);
           // TblFundtypes ac = new TblFundtypes(description,(Set<TblAccountJournalmapping>)tblAccountJournalmapping, (Set<TblFunduserassign>) tblFundassign, (Set<TblMasteraccounts>)tblMasteraccounts, (Set<TblMasterjournals>)masterjournals);
           
              System.out.println("test0="+id);
              System.out.println("test1="+description);
              
           
            
              System.out.println("test2="+id);
              System.out.println("test3="+description);
              ac.setId(id);
            String resultMessage = acs.updateFundTypes(ac);
            
              System.out.println("test4="+id);
              System.out.println("test5="+description);
              
            TblFundtypes add_obj= acs.searchAccount(id);
                
              System.out.println("test6="+id);
              System.out.println("test7="+description);
            
            RequestDispatcher rd = request.getRequestDispatcher("FundType_ManagePage.jsp?message=" + resultMessage);
            request.setAttribute("searchResult", add_obj);
            rd.forward(request, response);
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            out.close();
        }
       
        }else{
            FundTypesService er = new FundTypesService();
            TblFundtypes obj_usr = er.getFundByfundId(id);
            request.setAttribute("searchResult", obj_usr);
            request.setAttribute("errorMessage", "Fund type has been defined already ");
            RequestDispatcher rd = request.getRequestDispatcher("FundType_EditPage.jsp");
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
