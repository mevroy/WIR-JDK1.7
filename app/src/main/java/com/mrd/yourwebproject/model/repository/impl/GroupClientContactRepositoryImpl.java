/**
 * 
 */
package com.mrd.yourwebproject.model.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.mrd.framework.data.BaseHibernateJpaRepository;
import com.mrd.yourwebproject.model.entity.GroupClientContact;
import com.mrd.yourwebproject.model.entity.enums.ContactType;
import com.mrd.yourwebproject.model.repository.GroupClientContactRepository;

/**
 * @author mevan.d.souza
 *
 */
@Repository
public class GroupClientContactRepositoryImpl extends BaseHibernateJpaRepository<GroupClientContact, String>
		implements GroupClientContactRepository {

	public List<GroupClientContact> findByGroupClient(String clientId) {
		Query q = sessionFactory.getCurrentSession()
				.createQuery("from GroupClientContact g where g.clientId = :clientId")
				.setParameter("clientId", clientId);
		List<GroupClientContact> groupClientContact = q.list();
		return groupClientContact;
	}

	public List<GroupClientContact> findByGroupClientAndType(String clientId, ContactType type) {
		Query q = sessionFactory.getCurrentSession()
				.createQuery("from GroupClientContact g where g.clientId = :clientId and g.contactType = :contactType order by g.createdAt desc")
				.setParameter("clientId", clientId).setParameter("contactType", type);
		List<GroupClientContact> groupClientContact = q.list();
		return groupClientContact;
	}

}
