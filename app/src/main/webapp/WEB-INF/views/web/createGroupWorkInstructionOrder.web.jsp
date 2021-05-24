<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/js/css/bootstrap-select.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/bootstrap/js/bootstrap-select.js"></script>

<div class="jumbotron">
	<h2>Create Work Instruction Order</h2>
	<br />
	<div class="span12">

		<form:form commandName="groupWorkInstructionRecord"
			action="saveGroupWorkInstructionRecord" method="post"
			id="groupWorkInstructionRecord">
			<div class="row">
				<div class="col-lg-5">
					<div class="form-group" id="clientIdCtl">
						<label class="control-label" for="clientId">Client </label>

						<div class="controls">
							<div class="input-group">
								<form:select path="groupClient.clientId" data-live-search="true"
									cssClass="form-control selectpicker" id="clientId"
									onchange="buildAddress(this.value, 'addressId'); buildContact(this.value, 'clientContactId');"
									placeholder="Select Client">
									<option
										value="${groupWorkInstructionRecord.groupClient.clientId}">Select</option>
								</form:select>
								<div class="input-group-addon">
									<span><a href="addClientData"><i
											class="glyphicon glyphicon-plus"></i></a></span>
								</div>
							</div>
						</div>

					</div>

					<div class="form-group" id="groupAddressCtl">
						<label class="control-label" for="groupAddress.addressId">Site
							Address </label>

						<div class="controls">
							<div class="input-group">
								<form:select path="groupAddress.addressId"
									data-live-search="true" cssClass="form-control selectpicker"
									id="addressId" placeholder="Site Address">
									<!-- <option value="">Select One</option>  -->
									<option
										value="${groupWorkInstructionRecord.groupAddress.addressId}">Select</option>

								</form:select>
								<div class="input-group-addon">
									<span><a href="#"
										onclick="loadmodalMessageAddress('modalMessageAddress'); addClientId(this);"><i
											class="glyphicon glyphicon-plus"></i></a></span>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group" id="clientContactIdCtl">
						<label class="control-label"
							for="groupClientContact.clientContactId">Contact </label>

						<div class="controls">
							<div class="input-group">
								<form:select path="groupClientContact.clientContactId"
									data-live-search="true" cssClass="form-control selectpicker"
									id="clientContactId" placeholder="Contact">
									<option
										value="${groupWorkInstructionRecord.groupClientContact.clientContactId}">Select</option>

								</form:select>
								<div class="input-group-addon">
									<span><a href="#"
										onclick="loadmodalMessageContact('modalMessageContact'); addClientId(this);"><i
											class="glyphicon glyphicon-plus"></i></a></span>
								</div>
							</div>
						</div>
					</div>
					<!-- 		<div class="form-group" id="jobNumberCtl">
						<label class="control-label" for="jobNumber">Job Number</label>

						<div class="controls">
							<form:input path="jobNumber" cssClass="form-control"
								id="jobNumber" placeholder="Enter Job Number" />
						</div>
					</div>
					 -->

					<div class="form-group" id="orderNumberCtl">
						<label class="control-label" for="orderNumber">Client PO</label>

						<div class="controls">
							<form:input path="orderNumber" cssClass="form-control"
								id="orderNumber" placeholder="Enter Order Number" />
						</div>
					</div>
					<div class="form-group" id="quoteNumberCtl">
						<label class="control-label" for="quoteNumber">Quote
							Reference Number</label>

						<div class="controls">
							<form:input path="quoteNumber" cssClass="form-control"
								id="quoteNumber" placeholder="Enter Quote Number" />
						</div>
					</div>
					<div class="form-group" id="jobstartEndDateCtl">
						<label class="control-label" for="jobstartEndDate">Job
							Start/End Time </label>
						<div class="controls">
							<div class="input-daterange input-group">

								<div class="input-group-addon">
									<span><i class='glyphicon glyphicon-calendar'></i></span>
								</div>
								<form:input path="jobStart"
									cssClass="form-control form_datetime" id="jobStart"
									placeholder="Start Date Time" />
								<div class="input-group-addon">
									<span>TO</span>
								</div>

								<form:input path="jobEnd" cssClass="form-control form_datetime"
									id="jobEnd" placeholder="End Date Time" />
								<div class="input-group-addon">
									<span><i class='glyphicon glyphicon-calendar'></i></span>
								</div>

							</div>
						</div>
					</div>


					<div class="form-group" id="surfacePrepartionCtl">
						<label class="control-label" for="surfacePrepartion">Surface
							Preparation </label>

						<div class="controls">
							<form:textarea path="surfacePrepartion" cssClass="form-control"
								id="surfacePrepartion" placeholder="Surface Preparation"
								rows="3" />
						</div>
					</div>

					<div class="form-group" id="nataEndorsedCtl">
						<label class="control-label" for="nataEndorsed">NATA Endorsed
							</label>
						<div>
							<div class="radio">
								<label class="radio-inline"> <form:radiobutton
										path="nataEndorsed" id="nataEndorsed" value="true" /> Yes
								</label> <label class="radio-inline"> <form:radiobutton
										path="nataEndorsed" id="nataEndorsed" value="false" /> NO
								</label>
							</div>
						</div>

					</div>
				</div>
				<div class="col-lg-offset-2 col-lg-5">
					<div class="form-group" id="travelstartEndDateCtl">
						<label class="control-label" for="travelstartEndDate">Travel
							Start/End Time </label>
						<div class="controls">
							<div class="input-daterange input-group">

								<div class="input-group-addon">
									<span><i class='glyphicon glyphicon-calendar'></i></span>
								</div>
								<form:input path="travelStart"
									cssClass="form-control form_datetime" id="travelStart"
									placeholder="Start Date Time" />
								<div class="input-group-addon">
									<span>TO</span>
								</div>

								<form:input path="travelEnd"
									cssClass="form-control form_datetime" id="travelEnd"
									placeholder="End Date Time" />
								<div class="input-group-addon">
									<span><i class='glyphicon glyphicon-calendar'></i></span>
								</div>

							</div>
						</div>
					</div>
					<div class="form-group" id="materialCtl">
						<label class="control-label" for="material">Material</label>

						<div class="controls">
							<form:input path="material" cssClass="form-control" id="material"
								placeholder="Enter Material" />
						</div>
					</div>



					<div class="form-group" id="suitableAccessCtl">
						<label class="control-label" for="suitableAccess">Suitable
							Access</label>
						<div>
							<div class="radio">
								<label class="radio-inline"> <form:radiobutton
										path="suitableAccess" id="suitableAccess" value="true" /> Yes
								</label> <label class="radio-inline"> <form:radiobutton
										path="suitableAccess" id="suitableAccess" value="false" /> NO
								</label>
							</div>
						</div>

					</div>
					<div class="form-group" id="powerCtl">
						<label class="control-label" for="power">Power?</label>
						<div>
							<div class="radio">
								<label class="radio-inline"> <form:radiobutton
										path="power" id="power" value="true" /> Yes
								</label> <label class="radio-inline"> <form:radiobutton
										path="power" id="power" value="false" /> NO
								</label>
							</div>
						</div>

					</div>

					<div class="form-group" id="lightingCtl">
						<label class="control-label" for="lighting">Lighting</label>
						<div>
							<div class="radio">
								<label class="radio-inline"> <form:radiobutton
										path="lighting" id="lighting" value="true" /> Yes
								</label> <label class="radio-inline"> <form:radiobutton
										path="lighting" id="lighting" value="false" /> NO
								</label>
							</div>
						</div>

					</div>
					<div class="form-group" id="ewpAccessEquipmentCtl">
						<label class="control-label" for="ewpAccessEquipment">EWP
							Access Equipment</label>
						<div>
							<div class="radio">
								<label class="radio-inline"> <form:radiobutton
										path="ewpAccessEquipment" id="ewpAccessEquipment" value="true" />
									Yes
								</label> <label class="radio-inline"> <form:radiobutton
										path="ewpAccessEquipment" id="ewpAccessEquipment"
										value="false" /> NO
								</label>
							</div>
						</div>
					</div>
					<div class="form-group" id="additionalRequirementsCtl">
						<label class="control-label" for="additionalRequirements">Additional
							Requirements</label>

						<div class="controls">
							<form:textarea path="additionalRequirements"
								cssClass="form-control" id="additionalRequirements"
								placeholder="Additional Requirements" rows="3" />
						</div>
					</div>
					<div class="form-group" id="serialNumberCtl">
						<label class="control-label" for="groupMember.serialNumber">Assigned
							To </label>

						<div class="controls">
							<div class="input-group">
								<form:select path="groupMember.serialNumber"
									data-live-search="true" cssClass="form-control selectpicker"
									id="serialNumber" placeholder="User">
									<option
										value="${groupWorkInstructionRecord.groupMember.serialNumber}">Select
										one</option>

								</form:select>
								<div class="input-group-addon">
									<span><a href="addGroupMemberGIES"><i
											class="glyphicon glyphicon-plus"></i></a></span>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<hr
				style="height: 10px; border: 0; box-shadow: 0 10px 10px -10px #337ab7 inset">

			<!-- 			<div class="row">

				<div class="col-lg-12">
					<input type="button" name="addMore" id="addMore"
						class="btn btn-danger btn-block btn-lg" value="ADD WORK ITEMS"
						onclick="$('#moreDetails').show();" />
				</div>
			</div>  -->
			<h2>Add Work Items</h2>
			<br />
			<div class="row">
				<div id="moreDetails">
					<div class="col-md-4">
						<div class="form-group" id="groupWorkItems[0].testMethodCtl">
							<label class="control-label" for="testMethod">Test Method</label>

							<div class="controls">
								<form:select path="groupWorkItems[0].testMethod"
									data-live-search="true" cssClass="form-control selectpicker"
									id="testMethod0"
									onchange="buildWIRDropDownsByIndex(this.value, 'itrDocument' ,'itemProcedure', 'testStandard', 'acceptanceCriteria','0', false);"
									placeholder="Test Method" >
									<option
										value="${groupWorkInstructionRecord.groupWorkItems[0].testMethod}">Select
										one</option>
									</form:select>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group" id="groupWorkItems[0].itrDocumentCtl">
							<label class="control-label" for="itrDocument">ITR
								Document</label>

							<div class="controls">
								<form:select path="groupWorkItems[0].itrDocument"
									cssClass="form-control selectpicker" id="itrDocument0"
									placeholder="ITR Document">
									<option value="">Select One</option>
								</form:select>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group" id="groupWorkItems[0].itemProcedureCtl">
							<label class="control-label" for="itemProcedure">Test
								Procedure</label>

							<div class="controls">
								<form:select path="groupWorkItems[0].itemProcedure"
									cssClass="form-control selectpicker" id="itemProcedure0"
									placeholder="Item Procedure">
									<option value="">Select One</option>
								</form:select>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group" id="groupWorkItems[0].testStandardCtl">
							<label class="control-label" for="testStandard">Test
								Standard</label>

							<div class="controls">
								<form:select multiple="true" data-live-search="true"
									path="groupWorkItems[0].testStandard"
									cssClass="form-control selectpicker" id="testStandard0"
									placeholder="Enter Test Standard" size="5" >
									<option
										value="${groupWorkInstructionRecord.groupWorkItems[0].testStandard}" selected>Select
										one</option>									
									</form:select>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group"
							id="groupWorkItems[0].acceptanceCriteriaCtl">
							<label class="control-label" for="acceptanceCriteria">Acceptance
								Criteria</label>

							<div class="controls">
								<form:select multiple="true" data-live-search="true"
									path="groupWorkItems[0].acceptanceCriteria"
									cssClass="form-control selectpicker" id="acceptanceCriteria0"
									placeholder="Enter Acceptane Criteria" size="5" >
									<option
										value="${groupWorkInstructionRecord.groupWorkItems[0].acceptanceCriteria}" selected>Select
										one</option>										
									</form:select>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group" id="groupWorkItems[0].nataClassTestCtl">
							<label class="control-label" for="nataClassTest">NATA
								Class Method</label>

							<div class="controls">
								<form:input path="groupWorkItems[0].nataClassTest"
									cssClass="form-control" id="groupWorkItems[0].nataClassTest"
									placeholder="NATA Class Test" />
							</div>
						</div>
					</div>
					<form:hidden path="groupWorkItems[0].id" id="id0" readonly="true" />
					
				</div>


			</div>

			<c:forEach begin="1" end="4" step="1" var="i">
				<div class="row">
					<form:hidden path="groupWorkItems[${i}].id" id="id${i}" readonly="true" />				
				<c:choose>
  					<c:when test="${not empty groupWorkInstructionRecord.groupWorkItems[i].testMethod}">
						<c:set var="status" value="show"/>
  					</c:when>
  					<c:otherwise>
						<c:set var="status" value=""/>
  				</c:otherwise>
				</c:choose>
					<div id="moreDetails${i}" class="moreDetails${status}">
						<hr
							style="height: 10px; border: 0; box-shadow: 0 10px 10px -10px #337ab7 inset">

						<div class="col-md-4">
							<div class="form-group" id="groupWorkItems[${i}].testMethodCtl">
								<label class="control-label" for="testMethod">Test
									Method</label>
								<div class="controls">
									<form:select path="groupWorkItems[${i}].testMethod"
										data-live-search="true"
										onchange="buildWIRDropDownsByIndex(this.value,  'itrDocument' , 'itemProcedure', 'testStandard', 'acceptanceCriteria', ${i}, false);"
										cssClass="form-control" id="testMethod${i}"
										placeholder="Test Method">
									<option
										value="${groupWorkInstructionRecord.groupWorkItems[i].testMethod}">Select
										one</option>										
										</form:select>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group" id="groupWorkItems[${i}].itrDocumentCtl">
								<label class="control-label" for="itrDocument">ITR
									Document</label>
								<div class="controls">
									<form:select path="groupWorkItems[${i}].itrDocument"
										cssClass="form-control selectpicker" id="itrDocument${i}"
										placeholder="ITR Document">
										<option value="">Select One</option>
									</form:select>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group"
								id="groupWorkItems[${i}].itemProcedureCtl">
								<label class="control-label" for="itemProcedure">Test
									Procedure</label>
								<div class="controls">
									<form:select path="groupWorkItems[${i}].itemProcedure"
										cssClass="form-control selectpicker" id="itemProcedure${i}"
										placeholder="Item Procedure">
										<option value="">Select One</option>
									</form:select>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="form-group" id="groupWorkItems[${i}].testStandardCtl">
								<label class="control-label" for="testStandard">Test
									Standard</label>
								<div class="controls">
									<form:select multiple="true"
										path="groupWorkItems[${i}].testStandard"
										data-live-search="true" cssClass="form-control selectpicker"
										id="testStandard${i}" placeholder="Enter Test Standard"
										size="5">
									<option
										value="${groupWorkInstructionRecord.groupWorkItems[i].testStandard}" selected>Select
										one</option>											
										</form:select>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group"
								id="groupWorkItems[${i}].acceptanceCriteriaCtl">
								<label class="control-label" for="acceptanceCriteria">Acceptance
									Criteria</label>
								<div class="controls">
									<form:select multiple="true"
										path="groupWorkItems[${i}].acceptanceCriteria"
										data-live-search="true" cssClass="form-control selectpicker"
										id="acceptanceCriteria${i}"
										placeholder="Enter Acceptane Criteria" size="5">
									<option
										value="${groupWorkInstructionRecord.groupWorkItems[i].acceptanceCriteria}" selected>Select
										one</option>										
										</form:select>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group"
								id="groupWorkItems[${i}].nataClassTestCtl">
								<label class="control-label" for="nataClassTest">NATA
									Class Method</label>
								<div class="controls">
									<form:input path="groupWorkItems[${i}].nataClassTest"
										cssClass="form-control"
										id="groupWorkItems[${i}].nataClassTest"
										placeholder="NATA Class Test" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="row">
				<div class="col-md-6">
					<input type="button" name="addMore" id="addMore"
						class="btn btn-danger btn-block btn-lg" value="ADD WORK ITEMS"
						onclick="displayWorkItem();" />
				</div>
				<div class="col-md-6">
					<input type="button" name="remove" id="remove"
						class="btn btn-default btn-block btn-lg" value="REMOVE WORK ITEMS"
						onclick="removeWorkItem();" />
				</div>
			</div>
			<div class="row">
				<br />
			</div>
			<div class="row">
				<div class="col-lg-12">
					<form:hidden path="id" id="id" readonly="true" />
					<form:hidden path="group.id" id="group.id" readonly="true" />

					<input class="btn btn-primary btn-block btn-lg" type="submit"
						onclick="return $('#groupWorkInstructionRecord').valid();"
						value="SUBMIT" /> <a
						href="${pageContext.request.contextPath}/${sessionScope.groupCode}/"
						class="btn btn-default btn-block btn-lg">CANCEL</a>
				</div>
			</div>

		</form:form>


	</div>

</div>

<!-- Modal Window Start -->
<div id="modalAlert" class="modal fade" data-backdrop="static"
	tabindex="-1" role="dialog" aria-labelledby="modalMessageLabel1"
	aria-hidden="true" align="left">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn btn-primary pull-right"
					data-dismiss="modal">
					CLOSE</button>
				<h3 class="modal-title" id="modalMessageTitle">Error</h3>
			</div>
			<div class="modal-body">
				<div id="modalalertBlock">
					<div class="alert alert-danger">
						<div id="modalalertMessage">Please select a client before proceeding!</div>
					</div>				
				</div>

				<div id="modalMessageContent">


				</div>

			</div>
			<div class="modal-footer" style="border: none;"></div>
		</div>
	</div>
</div>
<!-- Modal Window End-->



<!-- Modal Window Start -->
<div id="modalMessageAddress" class="modal fade" data-backdrop="static"
	tabindex="-1" role="dialog" aria-labelledby="modalMessageLabel1"
	aria-hidden="true" align="left">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn btn-primary pull-right"
					data-dismiss="modal"
					onclick="$('#addressx').get(0).reset(); $('#addressx').data('validator').resetForm(); clearModal($('#modalMessageAddress').find('#modalalertBlock'));">
					CLOSE</button>
				<h3 class="modal-title" id="modalMessageTitle">Add Address</h3>
			</div>
			<div class="modal-body">
				<div id="modalalertBlock" style="display: none;">
					<div class="alert alert-danger">
						<div id="modalalertMessage"></div>
					</div>
					<div class="alert alert-success">
						<div id="modalalertInfoMessage"></div>
					</div>					
				</div>

				<div id="modalMessageContent">

					<form:form commandName="groupAddress" action="json/groupAddress"
						method="post" id="addressx"
						onsubmit="event.preventDefault(); mapClientId('addressClientId'); postAndBuildAddress('addressx','json/groupAddress','','',$('select#clientId').val(), 'addressId'); ">
						<div class="col-md-12">
							<div class="form-group" id="addressTypeCtl">
								<label class="control-label" for="addressType">AddressType</label>

								<div class="controls">
									<form:select path="addressType" cssClass="form-control"
										id="addressType" placeholder="Enter Address Type">
										<form:option value="">Select One</form:option>
										<form:option value="RESIDENCE">RESIDENCE</form:option>
										<form:option value="OFFICE">OFFICE</form:option>
										<form:option value="MAILING">MAILING</form:option>
										<form:option value="SITE">SITE</form:option>
										<form:option value="OTHER">OTHER</form:option>
									</form:select>
								</div>
							</div>
							<div class="form-group" id="poBoxCtl">
								<label class="control-label" for="poBox">PO BOX</label>

								<div class="controls">
									<form:input path="poBox" cssClass="form-control" id="poBox"
										placeholder="Enter PO Box" />
								</div>
							</div>
							<div class="form-group" id="streetAddressCtl">
								<label class="control-label" for="streetAddress">StreetAddress</label>

								<div class="controls">
									<form:input path="streetAddress" cssClass="form-control"
										id="streetAddress" placeholder="Enter Street Address" />
								</div>
							</div>
						</div>
						<div class="col-md-12">

							<div class="form-group" id="suburbCtl">
								<label class="control-label" for="suburb">Suburb</label>

								<div class="controls">
									<form:input path="suburb" cssClass="form-control" id="suburb"
										placeholder="Enter Suburb" />

								</div>
							</div>

							<div class="form-group" id="stateCtl">
								<label class="control-label" for="state">State</label>

								<div class="controls">
									<form:input path="state" cssClass="form-control" id="state"
										placeholder="Enter State" />
								</div>
							</div>

							<div class="form-group" id="zipCodeCtl">
								<label class="control-label" for="zipCode">ZIP</label>

								<div class="controls">
									<form:input path="zipCode" cssClass="form-control" id="zipCode"
										placeholder="Enter ZIP code" />
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="form-group">
								<button class="btn btn-primary btn-lg btn-block has-spinner"
									type="submit" onclick="return $('#addressx').valid();"
									data-loading-text="<span class='spinner'><i class='icon-spin glyphicon glyphicon-repeat'></i></span> Loading..">SAVE
									AND CONTINUE</button>
							</div>
						</div>
						<form:hidden path="clientId" id="addressClientId" />

					</form:form>



				</div>

			</div>
			<div class="modal-footer" style="border: none;"></div>
		</div>
	</div>
</div>
<!-- Modal Window End-->


<!-- Modal Window Start -->
<div id="modalMessageContact" class="modal fade" data-backdrop="static"
	tabindex="-1" role="dialog" aria-labelledby="modalMessageLabel1"
	aria-hidden="true" align="left">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn btn-primary pull-right"
					data-dismiss="modal"
					onclick="$('#contactx').get(0).reset(); $('#contactx').data('validator').resetForm(); clearModal($('#modalMessageContact').find('#modalalertBlock'));">
					CLOSE</button>
				<h3 class="modal-title" id="modalMessageTitle">Add Contact</h3>
			</div>
			<div class="modal-body">
				<div id="modalalertBlock" style="display: none;">
					<div class="alert alert-danger">
						<div id="modalalertMessage"></div>
					</div>
					<div class="alert alert-success">
						<div id="modalalertInfoMessage"></div>
					</div>
				</div>

				<div id="modalMessageContent">
					<form:form commandName="groupClientContact" id="contactx"
						action="json/groupClientContact" method="post"
						onsubmit="event.preventDefault(); mapClientId('contactClientId'); postAndBuildContact('contactx','json/groupClientContact','','',$('select#clientId').val(), 'clientContactId'); ">
						<div class="col-md-12">
						<div class="form-group" id="contactTypeCtl">
							<label class="control-label" for="contactType">Contact Type</label>

							<div class="controls">
								<form:select path="contactType"
									cssClass="form-control" id="contactType"
									placeholder="Enter Contact Type">
									<form:option value="">Select One</form:option>
									<form:option value="CLIENT">CLIENT</form:option>
									<form:option value="SITE" selected="true">SITE</form:option>
									<form:option value="OTHER">OTHER</form:option>
								</form:select>
							</div>
						</div>							
							<div class="form-group" id="firstNameCtl">
								<label class="control-label" for="firstName">Contact
									First Name</label>

								<div class="controls">
									<form:input path="firstName" cssClass="form-control"
										id="firstName" placeholder="Enter First Name" />
								</div>
							</div>
							<div class="form-group" id="lastNameCtl">
								<label class="control-label" for="lastName">Contact Last
									Name</label>

								<div class="controls">
									<form:input path="lastName" cssClass="form-control"
										id="lastName" placeholder="Enter Last Name" />
								</div>
							</div>


						</div>
						<div class="col-md-12">

							<div class="form-group" id="mobilephoneCtl">
								<label class="control-label" for="mobilephone">Mobile
									No.</label>

								<div class="controls">
									<div class="input-group">
										<form:input path="mobilephone" cssClass="form-control"
											id="mobilephone" placeholder="Enter Mobile Phone Number" />
										<div class="input-group-addon">
											<span><i class='glyphicon glyphicon-phone'></i></span>

										</div>
									</div>
								</div>
							</div>
							<div class="form-group" id="emailCtl">
								<label class="control-label" for="email">Email</label>

								<div class="controls">
									<div class="input-group">
										<form:input path="email" cssClass="form-control" id="email"
											placeholder="Enter Email" />
										<div class="input-group-addon">
											<span><i class="glyphicon glyphicon-envelope"></i></span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="form-group">
								<button class="btn btn-primary btn-lg btn-block has-spinner"
									type="submit" onclick="return $('#contactx').valid();"
									data-loading-text="<span class='spinner'><i class='icon-spin glyphicon glyphicon-repeat'></i></span> Loading..">SAVE
									AND CONTINUE</button>
							</div>
						</div>
						<form:hidden path="clientId" id="contactClientId" />
					</form:form>
				</div>

			</div>
			<div class="modal-footer" style="border: none;"></div>
		</div>
	</div>
</div>
<!-- Modal Window End-->

<div id="newContact" style="display: none;"></div>



<div id="newAddress" style="display: none;"></div>



<script type="text/javascript">
	$(document).ready(
			function() {
				$("#groupWorkInstructionRecord").validate(
						{
							rules : {
							
								clientContactId : {
									requiredCheck : true
								},
								primaryEmail : {
									required : true,
									email : true
								},

								adultCount : {
									number : true
								},
								kidCount : {
									number : true
								},
								mobilephone : {
									maxlength : 13
								},
								otherPhone : {
									maxlength : 13
								},
								paidMembershipAmount : {
									number : true
								},
								orderNumber : {
									required : false
								}
							},
							messages : {

							},
							errorPlacement : function(error, element) {
								error.appendTo(element.parent("div").parent("div"));
							},
							errorClass : "control-group has-error text-danger",
							validClass : "control-group has-success",
							errorElement : "span",
							highlight : function(element, errorClass,
									validClass) {
								if (element.type === 'radio') {
									this.findByName(element.name).parent("div")
											.parent("div").removeClass(
													validClass).addClass(
													errorClass);
								} else {
									$(element).parent("div").parent("div")
											.removeClass(validClass).addClass(
													errorClass);
								}
							},
							unhighlight : function(element, errorClass,
									validClass) {
								if (element.type === 'radio') {
									this.findByName(element.name).parent("div")
											.parent("div").removeClass(
													errorClass).addClass(
													validClass);
								} else {
									$(element).parent("div").parent("div")
											.removeClass(errorClass).addClass(
													validClass);
								}
							}
						});


				$("#contactx").validate(
						{   
							rules : {
								firstName : {
									required : true,
								},
								lastName : {
									required : false
								},
								email : {
									email : true
								},
								mobilephone : {
									required : false
								},
								contactType : {
									required: true
								}
							},
							messages : {
								firstName: "FirstName is required!"
							},
							errorPlacement : function(error, element) {
								error.appendTo(element.parent("div").parent(
										"div"));
							},
							errorClass : "control-group has-error text-danger",
							validClass : "control-group has-success",
							errorElement : "span",
							highlight : function(element, errorClass, validClass) {
								if (element.type === 'radio') {
									this.findByName(element.name).parent("div").parent(
											"div").removeClass(validClass).addClass(
											errorClass);
								} else {
									$(element).parent("div").parent("div").removeClass(
											validClass).addClass(errorClass);
								}
							},
							unhighlight : function(element, errorClass, validClass) {
								if (element.type === 'radio') {
									this.findByName(element.name).parent("div").parent(
											"div").removeClass(errorClass).addClass(
											validClass);
								} else {
									$(element).parent("div").parent("div").removeClass(
											errorClass).addClass(validClass);
								}
							}
						});
				
				$("#addressx").validate(
						{
							rules : {
								streetAddress : {
									required : true
								},
								suburb : {
									required : false
								},
								state : {
									required : false,
								},
								addressType : {
									required : true
								}
							},
							errorPlacement : function(error, element) {
								error.appendTo(element.parent("div").parent(
										"div"));
							},
							errorClass : "control-group has-error text-danger",
							validClass : "control-group has-success",
							errorElement : "span",
							highlight : function(element, errorClass, validClass) {
								if (element.type === 'radio') {
									this.findByName(element.name).parent("div").parent(
											"div").removeClass(validClass).addClass(
											errorClass);
								} else {
									$(element).parent("div").parent("div").removeClass(
											validClass).addClass(errorClass);
								}
							},
							unhighlight : function(element, errorClass, validClass) {
								if (element.type === 'radio') {
									this.findByName(element.name).parent("div").parent(
											"div").removeClass(errorClass).addClass(
											validClass);
								} else {
									$(element).parent("div").parent("div").removeClass(
											errorClass).addClass(validClass);
								}
							}
						});
				
				
			});

	
	$(function() {
		buildClients('clientId');
		for(var a=0; a<5; a++) {
			buildTestMethods('testMethod', a, false);
		}	
		buildUsers('serialNumber');
		if(typeof $("select#clientId").val() !== 'undefined') {
			var clientId = $("select#clientId").val();
			buildContact(clientId, 'clientContactId');
			buildAddress(clientId, 'addressId');
		}
		//buildAcceptanceCriteria('acceptanceCriteria');
		//buildTestMethodStandards('testStandard');
		
		$('.moreDetails').hide();
	});
	var division = 1;
	function displayWorkItem() {
		showById('moreDetails' + division);
		division++;
	}

	function removeWorkItem() {
		division = division - 1;
		buildTestMethods('testMethod', division, true);
		hideById('moreDetails' + division);
	}
	
	function showAlert(formId){
		alert($('select#clientId').val());
	}

	function loadmodalMessageAddress(modalId) {
    	if($('select#clientId').val() === "0" || $('select#clientId').val() === "") {
    		showErrorModal('modalAlert') ;   	
    		}
    	else {
		$modal = $("#"+modalId);
		$modal.modal('show');
    	}
	}
	
	function loadmodalMessageContact(modalId) {
    	if($('select#clientId').val() === "0" || $('select#clientId').val() === "") {
    		showErrorModal('modalAlert') ;   	
    	}
    	else {
		$modal = $("#"+modalId);
		$modal.modal('show');
    	}
	}
	
	function showErrorModal(modalId){
		$modal = $("#"+modalId);
		$modal.modal('show');
	}
	function postAndBuildContact(formid,url,hideId,showId,selectedVal, buildId) {
		postFormToggleErrorModalResetForm(formid,url,hideId,showId,"modalMessageContact"); 
		buildContact(selectedVal, buildId);
		//$('#contactx').get(0).reset(); 
		//$('#contactx').data('validator').resetForm();
	}
	function postAndBuildAddress(formid,url,hideId,showId,selectedVal, buildId) {
		postFormToggleErrorModalResetForm(formid,url,hideId,showId,"modalMessageAddress"); 
		buildAddress(selectedVal, buildId);
		//$('#addressx').get(0).reset(); 
		//$('#addressx').data('validator').resetForm();
	}
	
	function clearModal(modalRef){
		hideByRef(modalRef);
	}
	function addClientId(element){
	    $(element).attr('href', function() {
	    	if($('select#clientId').val() === "0") {
	    		return this.href="addClientData"
	    	}
	        return this.href + $('select#clientId').val();
	    });
	}
	
	function mapClientId(htmlId){
	    $('input#'+htmlId).val($('select#clientId').val());
	    
	}
	$.validator.addMethod("requiredCheck", function(value, element) {
		var success = false;
		var val = $('#clientContactId').val();		
		if(typeof val!== 'undefined' && val !=='')
		{success = true;}
		return success;
	},  jQuery.validator.format("This is required")); 
	
</script>

