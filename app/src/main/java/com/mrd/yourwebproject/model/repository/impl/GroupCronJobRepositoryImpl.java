/**
 * 
 */
package com.mrd.yourwebproject.model.repository.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mrd.framework.data.BaseHibernateJpaRepository;
import com.mrd.yourwebproject.model.entity.GroupCronJob;
import com.mrd.yourwebproject.model.repository.GroupCronJobRepository;

/**
 * @author mevan.d.souza
 *
 */
@Repository
public class GroupCronJobRepositoryImpl extends
		BaseHibernateJpaRepository<GroupCronJob, Long> implements GroupCronJobRepository {

	public List<GroupCronJob> findGroupCronJobsByGroupCode(String groupCode) {
		return (List<GroupCronJob>)sessionFactory.getCurrentSession().createQuery("from GroupCronJob g where g.groupCode = ? and (g.expiryDate is null or g.expiryDate>=now()) ").setString(0,
                groupCode).list();
	}

	public List<GroupCronJob> findGroupCronJobs() {
		return (List<GroupCronJob>)sessionFactory.getCurrentSession().createQuery("from GroupCronJob g where (g.expiryDate is null or g.expiryDate>=now()) ").list();
	}

	public GroupCronJob findByJobCode(String jobCode) {
		
		return (GroupCronJob)sessionFactory.getCurrentSession().createQuery("from GroupCronJob g where g.jobCode = ?").setString(0, jobCode).uniqueResult();
	}

}
