/**
 * 
 */
package com.mrd.yourwebproject.model.repository.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mrd.framework.data.BaseHibernateJpaRepository;
import com.mrd.yourwebproject.model.entity.GroupMemberCategory;
import com.mrd.yourwebproject.model.repository.GroupMemberCategoryRepository;

/**
 * @author mevan.d.souza
 *
 */
@Repository
public class GroupMemberCategoryRespositoryImpl extends
		BaseHibernateJpaRepository<GroupMemberCategory, Long> implements GroupMemberCategoryRepository {

	public List<GroupMemberCategory> findByGroupCode(String groupCode) {
		return(List<GroupMemberCategory>)sessionFactory.getCurrentSession().createQuery("from GroupMemberCategory gmc where gmc.groupCode = ? and (gmc.startDate is null or gmc.startDate<=CURDATE()) and (gmc.expiryDate is null or gmc.expiryDate>=CURDATE())").setString(0,
				groupCode).list();
	}

	public GroupMemberCategory findByMemberCategoryCode(
			String memberCategoryCode) {
		return (GroupMemberCategory)sessionFactory.getCurrentSession().createQuery("from GroupMemberCategory gmc where gmc.memberCategoryCode = ?").setString(0,
				memberCategoryCode).uniqueResult();
	}

}
