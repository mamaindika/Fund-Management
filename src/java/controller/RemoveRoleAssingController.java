///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.Set;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import model.TblRoleassign;
//import model.TblUser;
//import model.TblUserroles;
//import service.UserRolesService;
//import service.UserService;
//
///**
// *
// * @author boc
// */
//
//@WebServlet(name = "RemoveRoleAssingController", urlPatterns = {"/RemoveRoleAssingController"})
//public class RemoveRoleAssingController extends HttpServlet {
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
////int roleId = Integer.parseInt(request.getParameter("role"));   
////            TblUserroles  tempd = new TblUserroles();
////            tempd.getId();
////            System.out.println("remove 1"+tempd);          
////int pfNo = Integer.parseInt(request.getParameter("pfno"));   
////            TblUser  temppfNo = new TblUser();
////            temppfNo.getPfNo();
////          System.out.println("remove 2"+temppfNo); 
//// int status = Integer.parseInt(request.getParameter("status"));
////        TblRoleassign tempstatus = new TblRoleassign();
////            tempstatus.setStatus(1);
////           System.out.println("test"+tempstatus);
////       TblRoleassign ac = new TblRoleassign();
////       ac.getTblUser();
////       ac.setStatus(2);
////       UserRolesService  acs = new UserRolesService();
////       String resultMessage = acs.updateUserRolesAssign(ac);
////         System.out.println("role remove done");
//
////            int selPfno = Integer.parseInt(request.getParameter("selectedPfno"));
////            System.out.println("selected Pf: "+selPfno);
//            
////            int Pfno = Integer.parseInt((String) request.getAttribute("pfno"));
////            System.out.println("selected Pf: "+Pfno);
//
//            int pfno = 12356;
//            
//            UserService us = new UserService();
//            TblUser user = us.getUserByuserId(pfno);
//            //TblUser  temppfNo = new TblUser();
//            //temppfNo.getPfNo ();
//            System.out.println("user:"+ user.getFirstName()+"-"+user.getUserName());
//            
//            UserRolesService usRoSer = new UserRolesService();
//            
//          //  TblUser tblUser = null;
//          //  TblUserroles tblUserroles=null;
//         //   int status = Integer.parseInt(request.getParameter("status").trim());
//            TblRoleassign tempstatus = new TblRoleassign();
//            tempstatus.setStatus(0);
//            //TblRoleassign ac = new TblRoleassign((Set<TblUser>)tblUser,(Set<TblUserroles>)tblUserroles,1);
//            TblRoleassign ac = new TblRoleassign(user, tblUserroles, pfno);
//            System.out.println("role remove done");
//            ac.setTblUser(temppfNo);
//            UserRolesService acs = new UserRolesService();
//            String resultMessage = acs.updateUserRolesAssign(ac);          
//   
//            
//       System.out.println(resultMessage); 
//       System.out.println("role remove done");
//       
//       
//        RequestDispatcher rd = request.getRequestDispatcher("roleassignpage_1.jsp?message=" + resultMessage);
//        request.setAttribute("searchResult", null);
//        rd.forward(request, response);
//         
//            
//        } finally {
//            out.close();
//        }
//    }
//
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
//
