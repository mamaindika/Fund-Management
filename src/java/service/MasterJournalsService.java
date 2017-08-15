/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
//import com.sun.tools.xjc.reader.xmlschema.bindinfo.BIConversion.User;
import java.util.Iterator;
import java.util.List;
import model.TblMasterjournals;
import model.TblAccountJournalmapping;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
/**
 *
 * @author boc
 */
public class MasterJournalsService {
   public String addMasterjournals(TblMasterjournals acc) {
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
   
    public String mapAccountsjournals(TblAccountJournalmapping acc) {
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
      public TblAccountJournalmapping searchAccountJournalmapping(int id) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblAccountJournalmapping user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblAccountJournalmapping where id='" + id + "'");
            user = (TblAccountJournalmapping) query.uniqueResult();
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
 
      
public List listMappedAccountJournalmapping(){
    
        Session s =null;
        List users = null;
        
        try {
            
        s = HibernateUtil.getSessionFactory().openSession();
        
        Criteria crit = s.createCriteria(TblAccountJournalmapping.class);
//        crit.createCriteria("tblMasterjournals", "a");
//        crit.add(Restrictions.eq("a.journalName","Journal 2"));
        users = crit.list();  //returns all matching rows.
        
        
        
        } catch (HibernateException e) {
            
            e.printStackTrace();
            
        }
        return users;

}

           
           
           
      public String updateAccountJournalmapping(TblAccountJournalmapping acc) {
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
        public List listMasterjournals(){
        Session s=null;
        List users = null;
        
        try {
            
        s = HibernateUtil.getSessionFactory().openSession();
        users = s.createCriteria(TblMasterjournals.class).list(); 
        //returns all matching rows.         
        } catch (HibernateException e) {
            
            e.printStackTrace();
        }  
        return users;

}
        
        public TblMasterjournals searchAccount(int journalNo) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblMasterjournals user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblMasterjournals where journalNo='" + journalNo + "'");
            user = (TblMasterjournals) query.uniqueResult();
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
        public String updateJournals(TblMasterjournals acc) {
        String message = null;
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            System.out.println(acc.getJournalNo());
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
     public String deleteMasterJournals(TblMasterjournals acc) {
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            s.delete(acc);
            tr.commit();
            return "Deleted Master Journals";
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            s.close();
        }

    }
}
