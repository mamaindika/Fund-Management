/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.TblUserroles;
import model.TblRoleassign;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
//import com.sun.tools.xjc.reader.xmlschema.bindinfo.BIConversion.User;
import java.util.Iterator;
import java.util.List;
import model.TblAccountJournalmapping;
import model.TblRoleassign;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author boc
 */
public class UserRolesService {

    public String addUserRoles(TblUserroles acc) {
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

    public TblUserroles searchUserRoles(int id) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblUserroles user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblUserroles where id='" + id + "'");
            user = (TblUserroles) query.uniqueResult();
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
    
    
        public TblUserroles searchUserRolesDesc(String description) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblUserroles user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblUserroles where description='" + description + "'");
            user = (TblUserroles) query.uniqueResult();
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
    
    
    

      public String updateUserRoles(TblUserroles acc) {
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
    public String updateUserRolesAssign(TblRoleassign acc) {
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
    
      public String deleteUserRoles(TblUserroles acc) {
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
//by hashini
      
      public List listUserRoles() {
          Session s=null;
        List users = null;
        try {
        Session session =HibernateUtil.getSessionFactory().openSession();
        
        Criteria crit = session.createCriteria(TblUserroles.class);
        crit.add(Restrictions.ne("description", "Super Admin"));
        users = crit.list();
        
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return users;

}
      
      
      public List listassignRoles() {
        Session s=null;
        List users = null;
        try {
        s = HibernateUtil.getSessionFactory().openSession();
     
        

        Criteria crit = s.createCriteria(TblRoleassign.class);
        crit.createCriteria("tblUserroles", "a");
        crit.createCriteria("tblUser", "b");
        crit.add(Restrictions.ne("a.description","Super Admin"));
        crit.add(Restrictions.ne("b.status", "Deceased"));
        users = crit.list();  //returns all matching rows.
        
        


        
        } catch (HibernateException e) {
            e.printStackTrace();
        } 
        return users;

}      
          
        public String assignRoles(TblRoleassign acc) {
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
   public TblRoleassign getUserByUserId(int pfno) {
         Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblRoleassign user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblRoleassign where pfNo='"+pfno+"'");
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
     public TblRoleassign searchAssignRole(int id) {
        String message = null;
        Session session = null;
        Transaction tx = null;
        TblRoleassign user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblRoleassign where id='" + id + "'");
            user = (TblRoleassign) query.uniqueResult();
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

     public TblRoleassign getRoleById(int pfNo, int roleId) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblRoleassign assignRole = null;
        try {
            tx = session.getTransaction();
            tx.begin();
             Query query = session.createQuery("from TblRoleassign where roleId='"+roleId+"' AND pfNo='"+pfNo+"'");
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
     
       public TblUserroles getRolebyId(int roleId) {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblUserroles assignRole = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from TblUserroles where id='"+roleId+"'");
            assignRole = (TblUserroles)query.uniqueResult();
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
     
       public TblRoleassign getAdminById(int pfNo, int roleId){
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblRoleassign assignRole = null;
        try {
            tx = session.getTransaction();
            tx.begin();
             Query query = session.createQuery("FROM TblUserroles INNER JOIN TblRoleassign Where TblUserroles.id=TblRoleassign.roleId AND  description=Admin");
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
       
}
