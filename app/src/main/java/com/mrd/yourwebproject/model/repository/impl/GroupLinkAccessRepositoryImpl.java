/**
 * 
 */
package com.mrd.yourwebproject.model.repository.impl;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.mrd.framework.data.BaseHibernateJpaRepository;
import com.mrd.yourwebproject.model.entity.GroupLinkAccess;
import com.mrd.yourwebproject.model.entity.GroupMainLink;
import com.mrd.yourwebproject.model.entity.GroupSubLink;
import com.mrd.yourwebproject.model.entity.Groups;
import com.mrd.yourwebproject.model.entity.enums.Role;
import com.mrd.yourwebproject.model.repository.GroupLinkAccessRepository;

/**
 * @author mevan.d.souza
 *
 */
@Repository
public class GroupLinkAccessRepositoryImpl extends BaseHibernateJpaRepository<GroupLinkAccess, Long> implements GroupLinkAccessRepository{


	public List<GroupLinkAccess> findByGroupSubLinkAndGroupAndRole(
			GroupSubLink groupSubLink, Groups group, boolean includeExpired,
			 Role role) {

		if(role != null)
		{
			sessionFactory.getCurrentSession().enableFilter("filterLinkAccessRoles").setParameter("roleType", role.toString());
			
		}
		return (List<GroupLinkAccess>)sessionFactory.getCurrentSession().createQuery("select gla from GroupLinkAccess gla , GroupLinkAccessRole glar where glar.groupLinkAccess = gla and gla.groupSubLinkId = ? and  gla.group = ? and glar.role= ? "+(includeExpired?"":" and ((gla.expiryDate is null or (gla.expiryDate) >= NOW()) and (gla.startDate is null or (gla.startDate) <= NOW())) and ((glar.expiryDate is null or (glar.expiryDate) >= NOW()) and (glar.startDate is null or (glar.startDate) <= NOW()))")).setParameter(0, groupSubLink.getId()).setParameter(1, group).setParameter(2, role).list();
	}

	public List<GroupLinkAccess> findByGroupMainLinkAndGroupAndRole(
			GroupMainLink groupMainLink, Groups group, boolean includeExpired,
			 Role role) {
		if(role != null)
		{

			sessionFactory.getCurrentSession().enableFilter("filterLinkAccessRoles").setParameter("roleType", role);
			
		}
		return (List<GroupLinkAccess>)sessionFactory.getCurrentSession().createQuery("select gla from GroupLinkAccess gla , GroupLinkAccessRole glar where glar.groupLinkAccess = gla and gla.groupSubLink.groupMainLink = ? and  gla.group = ? and glar.role= ? "+(includeExpired?"":"and ((gla.expiryDate is null or (gla.expiryDate) >= NOW()) and (gla.startDate is null or (gla.startDate) <= NOW()))  and ((glar.expiryDate is null or (glar.expiryDate) >= NOW()) and (glar.startDate is null or (glar.startDate) <= NOW()))")).setParameter(0, groupMainLink).setParameter(1, group).setParameter(2, role).list();
	}

	public List<GroupLinkAccess> findByGroupSubLinkAndGroup(
			GroupSubLink groupSubLink, Groups group, boolean includeExpired) {
		return (List<GroupLinkAccess>)sessionFactory.getCurrentSession().createQuery("select gla from GroupLinkAccess gla where gla.groupSubLinkId = ? and  gla.group = ? "+(includeExpired?"":" and ((gla.expiryDate is null or (gla.expiryDate) >= NOW()) and (gla.startDate is null or (gla.startDate) <= NOW()))")).setParameter(0, groupSubLink.getId()).setParameter(1, group).list();
	}

	public List<GroupLinkAccess> findByLinkURLAndGroupAndRole(String url,
			Groups group, boolean includeExpired, Role role) {

		if(role != null)
		{
			sessionFactory.getCurrentSession().enableFilter("filterLinkAccessRoles").setParameter("roleType", role.toString());
			
		}
		return (List<GroupLinkAccess>)sessionFactory.getCurrentSession().createQuery("select gla from GroupLinkAccess gla , GroupLinkAccessRole glar where glar.groupLinkAccess = gla and gla.linkHref = ?1 and  gla.group = ?2 and glar.role= ?3 "+(includeExpired?"":" and ((gla.expiryDate is null or (gla.expiryDate) >= NOW()) and (gla.startDate is null or (gla.startDate) <= NOW())) and ((glar.expiryDate is null or (glar.expiryDate) >= NOW()) and (glar.startDate is null or (glar.startDate) <= NOW()))")).setParameter(1, url).setParameter(2, group).setParameter(3, role).list();
	}




}
