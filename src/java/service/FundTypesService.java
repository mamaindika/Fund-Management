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
import model.TblDesignations;
import model.TblFundtypes;
import model.TblFunduserassign;
import model.TblRoleassign;
import model.TblUser;
import model.TblUserroles;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author boc
 */
public class FundTypesService {

    public String addFundTypes(TblFundtypes acc) {
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
    
    
    
    
    
        public TblFundtypes searchUserFundType(int id) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblFundtypes user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblFundtypes where id='" + id + "'");
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
    
    
        
        public TblFundtypes searchUserFundTypeDesc(String description) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblFundtypes user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblFundtypes where description='" + description + "'");
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
    
    
    
    
    
    
       public TblFunduserassign checkUserDetails( int fundId,int pfNo){
        
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblFunduserassign Detail = null;
        
        try{
            
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.getTransaction();
	tx.begin();
	org.hibernate.Query query = session.createQuery("from TblFunduserassign  where fundId='"+fundId+"' and pfNo='"+pfNo+"'");
	Detail = (TblFunduserassign)query.uniqueResult();
	tx.commit();
            
            
            
        }catch (Exception e){
           if (tx != null) {
        	 tx.rollback();
	 }
	 e.printStackTrace();
            
        }finally {
	 session.close();
	 }
        
        return Detail;
        
    }
    


    public TblFundtypes searchAccount(int id) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblFundtypes user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblFundtypes where id='" + id + "'");
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

    public String updateFundTypes(TblFundtypes acc) {
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
    
      public String updateFundAssign(TblFunduserassign acc) {
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
    
      public String deleteFundtypes(TblFundtypes acc) {
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

      
      public List listFundTypes() {
             Session s = null;
        List fund = null;
        try {
       s =HibernateUtil.getSessionFactory().openSession();
        fund = s.createCriteria(TblFundtypes.class).list();   //returns all matching rows.        
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return fund;
}
      
        public String assignFund(TblFunduserassign acc) {
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
        public List listassignFunds() {
            Session s=null;
        List users = null;
        try {
        s =HibernateUtil.getSessionFactory().openSession();
        
        
        Criteria crit = s.createCriteria(TblFunduserassign.class);
        crit.createCriteria("tblUser", "a");
        crit.add(Restrictions.ne("a.status","Deceased"));
        users = crit.list();  //returns all matching rows.

        
        } catch (HibernateException e) {
            e.printStackTrace();
        } 
        
        return users;

}
        
        public TblFunduserassign searchAssignFund(int id) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblFunduserassign user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblFunduserassign where id='" 
                    + id + "'");
            user = (TblFunduserassign) query.uniqueResult();
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
   
 public TblFunduserassign getfundTypeByuserName(int pfNo) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblFunduserassign User = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblFunduserassign where pfNo='"+pfNo+"'");
            User = (TblFunduserassign)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return User;
    }        
  public TblUser getUserByuserName(String userName) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblUser loggedUser = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblUser where userName='"+userName+"'");
            loggedUser = (TblUser)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return loggedUser;
    }       
     public TblFunduserassign getFundById(int pfNo, int fundId) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblFunduserassign loggedfund = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            //Query query = session.createQuery("from TblFunduserassign where fundId='"+fundId+"'");
           Query query = session.createQuery("from TblFunduserassign where fundId='"+fundId+"' AND pfNo='"+pfNo+"'");
            loggedfund = (TblFunduserassign)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return loggedfund;
    }    
        
  public TblFundtypes getFundByfundId(int fundId) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblFundtypes logFund = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblFundtypes where id='"+fundId+"'");
            logFund = (TblFundtypes)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return logFund;
    }
  
  
  
        public String deleteFundAssign(TblFunduserassign acc) {
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            s.delete(acc);
            tr.commit();
            return "Deleted Fund Assigned";
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            s.close();
        }

    }
  
        
}
