///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package service;
//import model.TblPayments;
//import org.hibernate.Session;
//import org.hibernate.Transaction;
//import util.HibernateUtil;
//import com.sun.tools.xjc.reader.xmlschema.bindinfo.BIConversion.User;
//import java.util.Iterator;
//import java.util.List;
//import org.hibernate.HibernateException;
//import org.hibernate.Query;
///**
///**
// *
// * @author boc
// */
//public class PaymentsService {
// 
//    public String AddPayments(TblPayments acc) {
//        String message = null;
//        Session s = null;
//        try {
//            s = HibernateUtil.getSessionFactory().openSession();
//            Transaction tr = s.getTransaction();
//            tr.begin();
//            s.save(acc);
//            tr.commit();
//            message = "Saved Data";
//            return message;
//        } catch (Exception e) {
//            return (e.getMessage());
//        } finally {
//            s.close();
//        }
//
//    }
//}
