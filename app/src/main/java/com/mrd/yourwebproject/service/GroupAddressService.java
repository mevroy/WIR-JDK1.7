/**
 * 
 */
package com.mrd.yourwebproject.service;

import java.util.List;

import com.mrd.framework.data.BaseService;
import com.mrd.yourwebproject.model.entity.GroupAddress;
import com.mrd.yourwebproject.model.entity.enums.AddressType;

/**
 * @author mevan.d.souza
 *
 */
public interface GroupAddressService extends BaseService<GroupAddress, String> {

	public List<GroupAddress> findByGroupClient(String clientId);
	public List<GroupAddress> findByGroupClientAndType(String clientId, AddressType type);
}
