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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import model.TblFunduserassign;
import model.TblUser;
import model.TblUsercredentials;
import model.TblRoleassign;
import org.hibernate.HibernateException;
import org.hibernate.Query;

/**
 *
 * @author boc
 */
public class loginService {

    public boolean authenticateUser(String userId, String password,int fundId){
        
        TblUsercredentials user = getUserByUserId(userId);
        TblFunduserassign fund  =  getfundTypeByuser(user.getTblUser().getPfNo(),fundId);
        
        if((user!=null && user.getUserId().equals(userId) && user.getPassword()
                .equals(password))&&( fund!=null && ((fund.getTblUser()
                        .getPfNo())==(user.getTblUser().getPfNo()))&&
                fund.getTblFundtypes().getId().equals(fundId) )){    
        System.out.println("user pf"+user.getTblUser().getPfNo()); 

        return true;
        }else{ 
            return false;
        }
    }
    //&&user.getTblUser().getStatus().equals "Active"
   public String authenticateAdminUser(String userId, String password) {
        TblUsercredentials user = getUserByUserId(userId);
        TblUser userSts = getUserByStatus(userId);
        
if((user!=null && userSts.getStatus().equals("Active"))){
        
        if((user.getUserId().equals(userId) && user.getPassword().equals(password))){
            
            TblRoleassign role=getRoleByUser(user.getTblUser().getPfNo());

            if((role!=null)&&(role.getTblUserroles().getId() == 2)){
              return "AdminLogin";   
            }else{
                return "UserLogin";
            }
            
        
        }else{
            
            return "WrrrongPassword";
            
        }
        
        
        
        
}else{
    return "Unauthorized";
        
}
        
        
        
    }
   
   
   
   
   
   
       public TblUser getUserByStatus(String userId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblUser user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblUser where userName='"+userId+"'");
            user = (TblUser)query.uniqueResult();
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
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    public TblUsercredentials getUserByUserId(String userId) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblUsercredentials user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblUsercredentials where userId='"+userId+"'");
            user = (TblUsercredentials)query.uniqueResult();
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
             System.out.println("pfNo"+pfNo); 

          
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
    public TblFunduserassign getfundTypeByuser(int pfNo, int fundId) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblFunduserassign User = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblFunduserassign where fundId='"+fundId+"' AND pfNo='"+pfNo+"'");
            
            User = (TblFunduserassign)query.uniqueResult();
            tx.commit();
             System.out.println("fundId"+fundId); 

          
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
    
   public TblRoleassign getRoleByuser(int pfNo, int roleId) {
    Session session =HibernateUtil.getSessionFactory().openSession();
    Transaction tx = null;
    TblRoleassign role = null;
    try {
        tx = session.getTransaction();
        tx.begin();
  System.out.println("roleId from service"+roleId); 
    System.out.println("pfNo from service"+pfNo); 
        Query query = session.createQuery("from TblRoleassign where roleId='"+roleId+"' AND pfNo='"+pfNo+"'");
        role = (TblRoleassign)query.uniqueResult();
        tx.commit();
         System.out.println("roleId from service"+roleId); 
    System.out.println("pfNo from service"+pfNo); 
    } catch (Exception e) {
        if (tx != null) {
            tx.rollback();
        }
        e.printStackTrace();
    } finally {
        session.close();
    }
    return role;
} 

    public TblRoleassign getRoleByUser(int pfNo) {
         Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblRoleassign user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblRoleassign where pfNo='"+pfNo+"'");
            user = (TblRoleassign)query.uniqueResult();
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

       //SELECT * FROM TblUserroles INNER JOIN TblRoleassign Where TblUserroles.id=TblRoleassign.roleId AND pfNo ='11111';

         public TblRoleassign getAdminById(int pfNo){
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblRoleassign assignRole = null;
        try {
            tx = session.getTransaction();
            tx.begin();
             Query query = session.createQuery("FROM TblUserroles Where pfNo='"+pfNo+"'");
            assignRole = (TblRoleassign)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return assignRole;
    }
         
         
        public String updateUserCreDetails(TblUsercredentials user) {
        String message = null;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = session.getTransaction();
            tr.begin();
            session.update(user);
            tr.commit();
            message = "Data Updated";
            return message;
        } catch (Exception e){
            return (e.getMessage());
        } finally {
            session.close();
        }

    }
       
       
}


