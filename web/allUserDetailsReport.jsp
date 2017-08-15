
<%@page contentType="application/pdf"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>












<%

    Connection conn = null ;
    
    try{
        
      Class.forName("com.mysql.jdbc.Driver");
//      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fund_manager");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fund_manager?user=root&password=123");
        
        String JSP_FILE = session.getServletContext().getRealPath("report/allUserDetails.jrxml");
        
        InputStream input = new FileInputStream(new File(JSP_FILE));
        
        JasperReport jasperReport = JasperCompileManager.compileReport(input);
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, conn);
        
        JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
        
        response.getOutputStream().flush();
        response.getOutputStream().close();
        
    }catch(Exception e){
        e.printStackTrace();
        
    }finally{
        if(conn == null){
            conn.close();
        }
    }


























%>



