/**
 * 
 */
package com.mrd.yourwebproject.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mrd.commons.util.CommonUtils;
import com.mrd.framework.data.BaseJpaServiceImpl;
import com.mrd.yourwebproject.actor.SMSSenderUntypedActor;
import com.mrd.yourwebproject.model.entity.GroupEventInvite;
import com.mrd.yourwebproject.model.entity.GroupEvents;
import com.mrd.yourwebproject.model.entity.GroupMember;
import com.mrd.yourwebproject.model.entity.GroupSMS;
import com.mrd.yourwebproject.model.entity.GroupSMSTemplate;
import com.mrd.yourwebproject.model.entity.User;
import com.mrd.yourwebproject.model.repository.GroupSMSRepository;
import com.mrd.yourwebproject.service.GroupSMSService;

/**
 * @author mevan.d.souza
 *
 */
@Service
@Transactional
public class GroupSMSServiceImpl extends BaseJpaServiceImpl<GroupSMS, String>
		implements GroupSMSService {
	private @Autowired GroupSMSRepository groupSMSRepository;
	private @Autowired SMSSenderUntypedActor smsSenderUntypedActor;


	@PostConstruct
	public void setupService() {
		this.baseJpaRepository = groupSMSRepository;
		this.entityClass = GroupSMS.class;
		this.baseJpaRepository.setupEntityClass(GroupSMS.class);
	}

	public List<GroupSMS> findByGroupCode(String groupCode) {
		return groupSMSRepository.findByGroupCode(groupCode);
	}

	public GroupSMS findByMessageId(String messageId) {
		return groupSMSRepository.findByMessageId(messageId);
	}

	public List<GroupSMS> findSMSByGroupEventCode(String groupEventCode) {

		return groupSMSRepository.findSMSByGroupEventCode(groupEventCode);
	}

	public List<GroupSMS> findSMSByMemberCategoryCodeAndGroupEventCode(
			String memberCategoryCode, String groupEventCode) {
		return groupSMSRepository.findSMSByMemberCategoryCodeAndGroupEventCode(memberCategoryCode, groupEventCode);
	}

	public List<GroupSMS> findUnassignedSMSByGroupCode(String groupCode) {
		return groupSMSRepository.findUnassignedSMSByGroupCode(groupCode);
	}

	@Override
	public GroupSMS createSMS(GroupSMS groupSMS, Map<String, Object> modelMap) throws Exception {

		if (modelMap == null || modelMap.isEmpty()) {
			throw new Exception(
					"You have requested to create an SMS but have not passed the model map at all");
		}


		/* Get All Available object from the HashMap */
		GroupMember groupMember = (GroupMember) modelMap.get("groupMember");
		GroupEventInvite groupEventInvite = (GroupEventInvite) modelMap
				.get("groupEventInvite");
		GroupEvents groupEvent = (GroupEvents) modelMap.get("groupEvent");
		User user = (User) modelMap.get("user");
		GroupSMSTemplate gsmsTemplate = (GroupSMSTemplate)modelMap
				.get("groupSMSTemplate");

		if(groupMember == null || gsmsTemplate == null) {
			throw new Exception("Both GroupMember and SMS Template object should be present to send an SMS");
		}
		if(groupSMS == null ) {
		 groupSMS = new GroupSMS();
		}
		
		for (String phoneNumber : CommonUtils.convertStringToList(
				groupMember.getMobilephone(), ",")) {
			if (CommonUtils.isValidPhoneNumber(phoneNumber, "AU")) {


		groupSMS.setCreatedAt(new Date());
		/* set the body to Template name intermittently */
		groupSMS.setBody(gsmsTemplate.getTemplateName());
		groupSMS.setCreatedBy(user!=null ? user.getUserName():"SCHEDULER");
		groupSMS.setMobileNumber(phoneNumber);
		groupSMS.setSmsAccountCode(groupMember.getGroupCode());
		groupSMS.setGroupCode(groupMember.getGroupCode());
		groupSMS.setGroupMember(groupMember);
		if (groupEventInvite != null) {
		Date smsExpdate = groupEvent!=null ? groupEvent.getExpiryDate(): null;
		if (groupEventInvite.getInviteExpiryDate() != null
				&& smsExpdate != null
				&& smsExpdate.after(groupEventInvite
						.getInviteExpiryDate())) {
			smsExpdate = groupEventInvite
					.getInviteExpiryDate();
		}
		groupSMS.setSmsExpirydate(smsExpdate);
		Date smsStartDate = groupEventInvite
				.getInviteStartDate();
		if (smsStartDate != null && smsExpdate != null
				&& smsStartDate.after(smsExpdate)) {
			smsStartDate = new DateTime(
					smsExpdate.getTime()).minusDays(45)
					.toDate();
		}
		groupSMS.setSmsingDate(smsStartDate);	
			groupSMS.setGroupEventInviteId(groupEventInvite
					.getGroupEventInviteId());
		}
		
		

		/*
		 * Intermittently set the hold email to true so that
		 * Other batches dont pick the email when the body
		 * is actually set as the template name
		 */
		groupSMS.setSmsHeld(true);
		GroupSMS newSMS = this.insert(groupSMS);
		modelMap.put("groupSMS", groupSMS);
		newSMS.setBody(smsSenderUntypedActor
				.prepareSMSBody(gsmsTemplate.getTemplateName(), modelMap));
		newSMS.setSmsHeld(false);
		if (groupEventInvite != null) {
			newSMS.setSmsHeld(groupEventInvite.isInviteHeld());
		}
		newSMS.setUpdatedAt(Calendar.getInstance()
				.getTime());
		this.insertOrUpdate(newSMS);
		
		
	} else {

	}
}
	
		return new GroupSMS();
	}


}
