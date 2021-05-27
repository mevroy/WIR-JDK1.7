package com.mrd.yourwebproject.model.repository.impl;

import com.mrd.framework.data.BaseHibernateJpaRepository;
import com.mrd.yourwebproject.model.entity.User;
import com.mrd.yourwebproject.model.repository.UserRepository;

import java.util.List;

import org.hibernate.Filter;
import org.springframework.stereotype.Repository;

/**
 * User Repository implementation
 *
 * @author: Y Kamesh Rao
 * @created: 3/26/12 8:30 AM
 * @company: &copy; 2012, Kaleidosoft Labs
 */
@Repository
public class UserRepositoryImpl extends BaseHibernateJpaRepository<User, Long> implements UserRepository {

     public User findByEmail(String email) {
        return (User) sessionFactory.getCurrentSession().createQuery("from User u where u.email = ?").setString(0,
                email).uniqueResult();
    }


     public User findByUsername(String username) {
        return (User) sessionFactory.getCurrentSession().createQuery("from User u where u.userName = ?").setString(0,
                username).uniqueResult();
    }
     
     public User findByUsernameAndGroupCode(String username, String groupCode, boolean enableFilter) {
 
    	 if(enableFilter)
    	 {
    		 Filter filter = sessionFactory.getCurrentSession().enableFilter("filterUserRoles");
    		 filter.setParameter("groupCode", groupCode);
    	 }
         return (User) sessionFactory.getCurrentSession().createQuery("select u from User u left join u.groupUserRoles gur where u.userName = ? and gur.group.groupCode = ? and (gur.expiryDate is null or date(gur.expiryDate) >= NOW()) and (gur.startDate is null or date(gur.startDate) <= NOW())").setString(0,
                 username).setString(1, groupCode).uniqueResult();
     }


	public User findByGroupMember(String serialNumber) {
        return (User) sessionFactory.getCurrentSession().createQuery("from User u where u.serialNumber = ?").setString(0,
        		serialNumber).uniqueResult();	}


	public List<User> findUsersByGroupCode(String groupCode, boolean enableFilter) {
   	 if(enableFilter)
   	 {
   		 Filter filter = sessionFactory.getCurrentSession().enableFilter("filterUserRoles");
   		 filter.setParameter("groupCode", groupCode);
   	 }
        return (List<User>)sessionFactory.getCurrentSession().createQuery("select distinct(u) from User u left join u.groupUserRoles gur where gur.group.groupCode = ?").setString(0,
        		groupCode).list();
	}
}
