/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;
import model.TblTransactionsdetails;
import model.TblTransactiontype;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
//import com.sun.tools.xjc.reader.xmlschema.bindinfo.BIConversion.User;
import java.util.Iterator;
import java.util.List;
import model.TblDesignations;
import model.TblFundtypes;
import model.TblMasterjournals;
import model.TblUsercredentials;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

public class TransactionService {

   
/**
 *
 * @author boc
 */

      public List listTransaction() {
          Session s=null;
        List listDesig = null;
        try {
        s=HibernateUtil.getSessionFactory().openSession();
        listDesig = s.createCriteria(TblTransactiontype.class).list();   //returns all matching rows. 

        
        } catch (HibernateException e) {
            e.printStackTrace();
        }  
        return listDesig;

}
      
      
      public String AddTransactionsdetail(TblTransactionsdetails acc) {
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
      public List TransactionsdetailsList() {
        List listTrance = null;
        Session s=null;
        try {
       s=HibernateUtil.getSessionFactory().openSession();
        listTrance = s.createCriteria(TblTransactionsdetails.class).list();   //returns all matching rows. 

        
        } catch (HibernateException e) {
            e.printStackTrace();
        } 
        return listTrance;

}
      public List PendingTransactionsList() {
          Session s=null;
        List pendingTrnce = null;
        try {
        s =HibernateUtil.getSessionFactory().openSession();
       
        pendingTrnce = s.createCriteria(TblTransactionsdetails.class).add( Restrictions.eq("status",new String("Pending") ) ).list();        

        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return pendingTrnce;

}         

public TblTransactionsdetails searchTransactionsdetails(int id) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblTransactionsdetails user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblTransactionsdetails where id='" + id + "'");
            user = (TblTransactionsdetails) query.uniqueResult();
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


public TblTransactiontype searchTransactionstype(int id) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblTransactiontype user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblTransactiontype where id='" + id + "'");
            user = (TblTransactiontype) query.uniqueResult();
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


   public String updateTransactions(TblTransactionsdetails acc) {
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

      public List listTransactionTypes() {
             Session s = null;
        List fund = null;
        try {
       s =HibernateUtil.getSessionFactory().openSession();
        fund = s.createCriteria(TblTransactiontype.class).list();   //returns all matching rows.        
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return fund;
}

   
   
   
      public String addTransactionTypes(TblTransactiontype acc) {
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
      
     
    public TblTransactiontype searchAccount(int id) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblTransactiontype Id = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblTransactiontype where id='" + id + "'");
            Id = (TblTransactiontype) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return Id;
    }
    public String deleteTransactiontypes(TblTransactiontype acc) {
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            s.delete(acc);
            tr.commit();
            return "Deleted Designation";
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            s.close();
        }

    }
    
     public TblFundtypes searchUserTransactionTypeDesc(String description) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblFundtypes user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblTransactiontype where description='" + description + "'");
            user = (TblFundtypes) query.uniqueResult();
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
    
    public String updateTransactionTypes(TblTransactiontype acc) {
        String message = null;
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            System.out.println(acc.getTransactionTypeId());
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
    
    
    
        public TblTransactiontype searchTransactionType(String description) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblTransactiontype user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblTransactiontype where TransactionDescription='" + description + "'");
            user = (TblTransactiontype) query.uniqueResult();
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
    
    
    
    
    public TblTransactiontype getTransactionById(int Id) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblTransactiontype tr = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblTransactiontype where id='"+Id+"'");
            tr = (TblTransactiontype)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tr;
    }
    
    public TblMasterjournals getJournalNameByJournalNo(int journal_No) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblMasterjournals tmj = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblMasterjournals where journalNo='"+journal_No+"'");
            tmj = (TblMasterjournals)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tmj;
    }
    

}
