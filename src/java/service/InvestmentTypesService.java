/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.TblInvestmenttypes;
import model.TblInvestments;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
//import com.sun.tools.xjc.reader.xmlschema.bindinfo.BIConversion.User;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;

/**
 *
 * @author boc
 */
public class InvestmentTypesService {

    public String addInvestment(TblInvestmenttypes acc) {
        String message = null;
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            s.save(acc);
            tr.commit();
            message = "Saved Data";
            return message;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            s.close();
        }

    }

    public TblInvestmenttypes searchAccount(int id) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblInvestmenttypes user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblInvestmenttypes where id='" + id + "'");
            user = (TblInvestmenttypes) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }
    
    
        public TblInvestmenttypes searchDesc(String description) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblInvestmenttypes user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblInvestmenttypes where description='" + description + "'");
            user = (TblInvestmenttypes) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }
    
     public TblInvestments search(int id) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblInvestments inves = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblInvestments where id='" + id + "'");
            inves = (TblInvestments) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inves;
    }

    public String updateInvestment(TblInvestmenttypes acc) {
        String message = null;
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            System.out.println(acc.getId());
            s.update(acc);
            tr.commit();
            message = "Saved Data";
            return message;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            s.close();
        }

    }
    
      public String deleteInvestment(TblInvestmenttypes acc) {
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            s.delete(acc);
            tr.commit();
            return "Deleted Investment";
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            s.close();
        }

    }
//by hashini
      
      public List listInvestments() {
          Session s=null;
        List list = null;
        try {
        s =HibernateUtil.getSessionFactory().openSession();
        list= s.createCriteria(TblInvestmenttypes.class).list();   //returns all matching rows. 

        
        } catch (HibernateException e) {
            e.printStackTrace();
        }finally{
            s.close();
        }  
        return list;

}
      
      public List InvestmentDetailsList() {
          Session s=null;
        List listInvest = null;
        try {
       s =HibernateUtil.getSessionFactory().openSession();
        listInvest = s.createCriteria(TblInvestments.class).list();   //returns all matching rows. 

        
        } catch (HibernateException e) {
            e.printStackTrace();
        } 
        return listInvest;

}      
      //openInvestment Controller to save investments
     public String openInvestment(TblInvestments acc) {
        String message = null;
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            s.save(acc);
            tr.commit();
            message = "Saved Investment";
            return message;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            s.close();
        }

    }   
    public String updateInvestment(TblInvestments acc) {
        String message = null;
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            System.out.println(acc.getId());
            s.update(acc);
            tr.commit();
            message = "Saved Data";
            return message;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            s.close();
        }

    }  
      
      
      
      
      
      
      
}
