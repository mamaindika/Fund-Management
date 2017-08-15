/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.TblMasteraccounts;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
//import com.sun.tools.xjc.reader.xmlschema.bindinfo.BIConversion.User;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;


/**
 *
 * @author Boc
 */
public class masterAccountsService {
    
   public String addMasterAccounts(TblMasteraccounts acc) {
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

    public TblMasteraccounts searchAccount(int accountNo) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblMasteraccounts user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblMasteraccounts where accountNo='" + accountNo + "'");
            user = (TblMasteraccounts) query.uniqueResult();
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

    public String updateMasterAccounts(TblMasteraccounts acc) {
        String message = null;
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
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
    
      public String deleteMasterAccounts(TblMasteraccounts acc) {
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            s.delete(acc);
            tr.commit();
            return "Deleted Master Accounts";
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            s.close();
        }

    }

      public List listMasterAccounts() {
          Session s=null;
        List users = null;
        try {
        s =HibernateUtil.getSessionFactory().openSession();
        users = s.createCriteria(TblMasteraccounts.class).list();   //returns all matching rows.         
        } catch (HibernateException e) {
            e.printStackTrace();
        } 
        return users;

}
      


      public List listMasterAccountsByFund(int fundId) {
        Session s=null;
        List users = null;
        
        try {
            
        s = HibernateUtil.getSessionFactory().openSession();
        Criteria c  = s.createCriteria(TblMasteraccounts.class); //returns all matching rows.
        c.createCriteria("tblFundtypes", "a");
        c.add(Restrictions.eq("a.id", fundId));
        users = c.list();
        } catch (HibernateException e) {
            e.printStackTrace();
        } 
        return users;

}      
      
      
}
