/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.TblUser;
import model.TblUsercredentials;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
//import com.sun.tools.xjc.reader.xmlschema.bindinfo.BIConversion.User;
import java.util.Iterator;
import java.util.List;
import model.TblUserroles;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author boc
 */
public class UserService {
//  public String addUser(TblUser acc) {
//        String message = null;
//        Session s = null;
//        try {
//            
//            if(isUserExists(acc)){
//                message = "Already Exist";
//            }else{
//                
//            s = HibernateUtil.getSessionFactory().openSession();
//            Transaction tr = s.getTransaction();
//            tr.begin();
//            s.save(acc);
//            tr.commit();
//            
//            message = "Saved Data";
//            
//            }
//        } catch (Exception e) {
//            return (e.getMessage());
//        } finally {
//            s.close();
//        }
//        System.out.println(message);
//        return message;
//    }
  public String addUser(TblUser acc) {
        String message = null;
        Session s = null;
        if(isUserExists(acc))
             s.close();
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
//  public boolean isUserExists(TblUser user){
//     Session session = HibernateUtil.getSessionFactory().openSession();
//     boolean result = false;
//     Transaction tx = null;
//     try{
//         tx = session.getTransaction();
//         tx.begin();
//         Query query = session.createQuery("from TblUser where userId='"+user.getUserName()+"'");
//         User u = (User)query.uniqueResult();
//         tx.commit();
//         if(u!=null) result = true;
//     }catch(Exception ex){
//         if(tx!=null){
//             tx.rollback();
//         }
//     }finally{
//         session.close();
//     }
//     return result;
//}



    public TblUser searchUserAccount(String userName) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblUser user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblUser where userName='" + userName + "'");
            user = (TblUser) query.uniqueResult();
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
        public TblUser searchuser(int pfNo) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblUser user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblUser where pfNo='" + pfNo + "'");
            user = (TblUser) query.uniqueResult();
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

    public String updateUser(TblUser acc) {
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
    
      public String deleteUser(TblUser acc) {
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            s.delete(acc);
            tr.commit();
            return "Deleted User";
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            s.close();
        }

    }
      public TblUser getUserByPFNO(int pfNo) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblUser loggedUser = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblUser where pfNo='"+pfNo+"'");
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
      
      public TblUser getUserByuserUsername(String pfNo) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblUser loggedUser = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblUser where userName='"+pfNo+"'");
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
 
 public TblUser getUserByuserId(int userId) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblUser loggedUser = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblUser where pfNo='"+userId+"'");
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
 
    public List listUsers() {
        List users = null;
        try {
            
            
        Session session =HibernateUtil.getSessionFactory().openSession();
        
        
        Criteria crit = session.createCriteria(TblUser.class);
        crit.add(Restrictions.ne("status", "Deleted"));
        users = crit.list();
        
        } catch (HibernateException e) {
            e.printStackTrace();
        } 
        return users;
    }
    
        public List listUser() {
        List users = null;
        try {
            
            
        Session session =HibernateUtil.getSessionFactory().openSession();
        
        
        Criteria crit = session.createCriteria(TblUser.class);
        crit.add(Restrictions.ne("status", "Deleted"));
        crit.add(Restrictions.ne("status", "Deceased"));
        users = crit.list();
        
        } catch (HibernateException e) {
            e.printStackTrace();
        } 
        return users;
    }
    
    
    
        public List RelistUsers() {
        List users = null;
        try {
            
            
        Session session =HibernateUtil.getSessionFactory().openSession();
        
        
        Criteria crit = session.createCriteria(TblUser.class);
        crit.add(Restrictions.ne("status", "Deleted"));
        users = crit.list();
        
        } catch (HibernateException e) {
            e.printStackTrace();
        } 
        return users;
    }
    
    
    
       public List ActivelistUsers() {
           
        Session s=null;
        List logUser=null;
        try {
        s=HibernateUtil.getSessionFactory().openSession();
        logUser = s.createCriteria(TblUser.class).add( Restrictions.eq("status",new String("Active") ) ).list();       
        } catch (HibernateException e) {
            e.printStackTrace();
        } 
        return logUser;
    }
 
    
       public String AddUserCredentials(TblUsercredentials cre) {
        String message = null;
        Session s = null;
        try {
            s = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s.getTransaction();
            tr.begin();
            s.save(cre);
            tr.commit();
            message = "Saved Data";
            return message;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            s.close();
        }

    }
       
    public boolean isUserExists(TblUser user){
     
    boolean result = false;
    Transaction tx = null;
    Session s = null;
    try{
         s = HibernateUtil.getSessionFactory().openSession();
         tx = s.getTransaction();
         tx.begin();
         Query query = s.createQuery("from TblUser where pfNo='" +user.getPfNo()+ "'");
         TblUser u = (TblUser)query.uniqueResult();
         tx.commit();
         if(u!=null) result = true;
    }catch(Exception ex){
         if(tx!=null){
             tx.rollback();
         }
    }
     return result;
}
//public List getjoinList() {
//    List joinList;
//        Session s = null;
//    try{
//        
//    s = HibernateUtil.getSessionFactory().openSession();
//    Query query = s.createQuery("SELECT u.userName, u.lastName, r.description FROM test.tbl_user u, test.tbl_userroles r, test.tbl_roleassign ra WHERE (u.pfNo == ra.pfNo) AND (r.id == ra.roleId)");
//    //query.setParameter("id", id);
//    joinList = query.list();
//    
//    }finally{
//         s.close();
//    }
//    return joinList;
//}
}
