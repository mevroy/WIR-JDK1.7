/**
 * 
 */
package com.mrd.yourwebproject.model.repository;

import java.util.List;

import com.mrd.framework.data.BaseJpaRepository;
import com.mrd.yourwebproject.model.entity.GroupAddress;
import com.mrd.yourwebproject.model.entity.enums.AddressType;

/**
 * @author mevan.d.souza
 *
 */
public interface GroupAddressRepository extends BaseJpaRepository<GroupAddress, String> {


	public List<GroupAddress> findByGroupClient(String clientId);
	public List<GroupAddress> findByGroupClientAndType(String clientId, AddressType type);
	
}
