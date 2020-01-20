/**
 * 
 */
package com.mrd.yourwebproject.model.repository.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mrd.framework.data.BaseHibernateJpaRepository;
import com.mrd.yourwebproject.model.entity.GroupInboundSMS;
import com.mrd.yourwebproject.model.repository.GroupInboundSMSRepository;

/**
 * @author mevan.d.souza
 *
 */
@Repository
public class GroupInboundSMSRepositoryImpl extends BaseHibernateJpaRepository<GroupInboundSMS, String> implements GroupInboundSMSRepository{


	public List<GroupInboundSMS> findByGroupCode(String groupCode) {
		return (List<GroupInboundSMS>)sessionFactory.getCurrentSession().createQuery("from GroupInboundSMS gsms where gsms.groupCode = ? group by gsms.providerMessageId").setString(0,
                groupCode).list();
	}

	public List<GroupInboundSMS> findByMessageId(String messageId) {
		return (List<GroupInboundSMS>)sessionFactory.getCurrentSession().createQuery("from GroupInboundSMS gsms where gsms.providerMessageId = ? ").setString(0,
				messageId).list();
	}

	

}
