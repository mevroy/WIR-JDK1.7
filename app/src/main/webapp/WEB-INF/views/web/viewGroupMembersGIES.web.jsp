<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var myData = [];
	var lastsel;
</script>
<div class="tabbable">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#optionALL" data-toggle="tab">All
				Members </a></li>
		<c:forEach items="${groupMemberCategories}" var="groupMemberCategory">
			<li><a
				href="#option<c:out value="${groupMemberCategory.memberCategoryCode}"/>"
				onclick="loadGrid('grid<c:out value="${groupMemberCategory.memberCategoryCode}"/>','<c:out value="${groupMemberCategory.memberCategoryCode}"/>','<c:out value="${groupMemberCategory.memberCategoryName}"/>');"
				data-toggle="tab"><c:out
						value="${groupMemberCategory.memberCategoryName}" /></a></li>

		</c:forEach>
	</ul>
	<div class="tab-content">

		<div class="tab-pane active" id="optionALL">
			<div class="row">
				<div class="span12">
					<!-- div class="hero-unit">  -->
					<table id="gridALL"></table>
					<div id="pgridALL"></div>
					<!-- /div>  -->
				</div>
			</div>
		</div>

		<c:forEach items="${groupMemberCategories}" var="groupMemberCategory">

			<div class="tab-pane"
				id="option<c:out value="${groupMemberCategory.memberCategoryCode}"/>">

				<div class="row">
					<div class="span12">
						<!-- div class="hero-unit">  -->
						<table
							id="grid<c:out value="${groupMemberCategory.memberCategoryCode}"/>"></table>
						<div
							id="pgrid<c:out value="${groupMemberCategory.memberCategoryCode}"/>"></div>
						<!-- /div>  -->
					</div>
				</div>

			</div>
		</c:forEach>

	</div>
</div>



<script type="text/javascript">
	$(document).ready(function() {
		loadGrid('gridALL', 'ALL', 'All Members');
		var lastsel = "";
	});

	function loadGrid(gridId, groupMemCatCode, captionVal) {
		jQuery("#" + gridId)
				.jqGrid(
						{
							url : 'json/viewAllGroupMember/' + groupMemCatCode,
							datatype : "json",
							colModel : [
									{
										label : 'Action',
										name : 'myac',
										width : 35,
										fixed : true,
										sortable : false,
										resize : false,
										formatter : 'actions',
										formatoptions : {
											keys : true,
											editbutton: true,
											delbutton : false,
										editformbutton: true,
//  											delOptions : {
// 												ajaxDelOptions : {
// 													// url: "deleteGroupMember",
// 													contentType : 'application/json;charset=utf-8',
// 													type : 'POST',
// 													datatype : 'json'
// 												}
// 											},
											editOptions : {
												url : 'updateGroupMember',
												height : 580,
												width : 540,
												top : 44,
												left : 470,
												dataheight : 490,
												closeAfterEdit: true,
												//modal : true,
												//reloadAfterSubmit : true,
												afterSubmit : function(
														response, postdata) {
													var status = false;
													if (response.responseText === "success")
														status = true
													return [ status,
													         response.responseText ];
												}}
										}
									},
									{
										label : 'Serial No',
										name : 'serialNumber',
										index : 'serialNumber',
										sorttype : "string",
										hidden : true,
										editable : true
									},
									{
										label : 'First Name',
										name : 'firstName',
										index : 'firstName',
										width : 100,
										sorttype : "string",
										search : true,
										editable : true,
										//frozen : true,
										searchoptions : {
											sopt : [ 'bw', 'eq', 'bn', 'cn',
													'nc', 'ew', 'en' ]
										}
									},
									{
										label : 'Last Name',
										name : 'lastName',
										index : 'lastName',
										sorttype : "string",
										//frozen : true,
										width : 100,
										editable : true,
										searchoptions : {
											sopt : [ 'bw', 'eq', 'bn', 'cn',
													'nc', 'ew', 'en' ]
										}

									},									
									{
										label : 'Employee ID',
										name : 'membershipIdentifier',
										index : 'membershipIdentifier',
										sorttype : "string",
										width : 80,
										hidden : false,
										editable : false,
									},
									{
										label : 'Active',
										name : 'activeMember',
										index : 'activeMember',
										width : 50,
										sortable : true,
										align: 'center',
										editable : false,
										formatter : formatBoolean
									},
									{
										label : 'Primary Email',
										name : 'primaryEmail',
										index : 'primaryEmail',
										sorttype : "string",
										width : 140,
										editable : true,
										editrules : {
											email : true
										}
									},
									{
										label : 'Mobile No',
										name : 'mobilephone',
										index : 'mobilephone',
										width : 80,
										sortable : false,
										sorttype : "string",
										editable : true
									},
									{
										label : 'Start Dt.',
										name : 'membershipStartDate',
										index : 'membershipStartDate',
										width : 90,
										sortable : true,
										editable : true,
										searchoptions : {
											sopt : [ 'bw', 'eq', 'bn', 'cn',
													'nc', 'ew', 'en' ]
										},
										//sorttype : "date",
										formatter : formatDate,
										editoptions : {
											dataInit : datePick
										}
									//	,
									//			formatoptions: { srcformat: "m/d/Y", newformat: "d/m/Y" }

									},
									{
										label : 'End Dt.',
										name : 'membershipEndDate',
										index : 'membershipEndDate',
										width : 90,
										sortable : true,
										editable : true,
										//sorttype : "date",
										editoptions : {
											dataInit : datePick
										},
										searchoptions : {
											sopt : [ 'bw', 'eq', 'bn', 'cn',
													'nc', 'ew', 'en' ]
										},
										formatter : formatDate
									//	,
									//			formatoptions: { srcformat: "m/d/Y", newformat: "d/m/Y" }

									},
									{
										label : 'Email verified',
										name : 'primaryEmailVerified',
										index : 'primaryEmailVerified',
										//sorttype : "string",
										hidden : false,
										editable : true,
										width : 80,
										edittype : "checkbox",
										formatter : formatBoolean,
										editoptions : {
											value : "Yes:No"
										}
									},
									{
										label : 'Other Phone',
										name : 'otherPhone',
										index : 'otherPhone',
										sorttype : "string",
										hidden : true,
										editable : true
									},
									{
										label : 'Membership Category',
										name : 'memberCategoryCode',
										index : 'memberCategoryCode',
										sorttype : "string",
										hidden : false,
										width : 100,
										editable : true,
										edittype : 'select',
										editoptions : {
											dataUrl : 'json/viewGroupMemberCategories',
											buildSelect : function(response) {
												var options = '<select>';
												var j = $.parseJSON(response);
												for (var i = 0; i < j.length; i++) {
													options += '<option value="' + j[i].memberCategoryCode + '">'
															+ j[i].memberCategoryName
															+ '</option>';
												}
												options += '</select>';
												return options;
											}
										}
									},
									{
										label : 'Security Code',
										name : 'securityCode',
										index : 'securityCode',
										sorttype : "string",
										hidden : true,
										editable : true
									},
									
									{
										label : 'Created At',
										name : 'createdAt',
										index : 'createdAt',
										formatter : formatDateTime,
										//sorttype : "date",
										hidden : false,
										editable : false
									},
									{
										label : 'Created By',
										name : 'createdBy',
										index : 'createdBy',
										sorttype : "string",
										hidden : true,
										editable : true
									},
									],
							height : 'auto',
							rowNum : 500,
							rownumbers : true,
							rownumWidth : 25,
							width : 937,
							rowList : [ 250, 500, 1000, 2000 ],
							pager : '#pgrid' + groupMemCatCode,
							//sortname : 'firstName',
							autoencode : true,
							shrinkToFit : false,
							viewrecords : true,
							//grouping : true,
							//subGrid : true,
							loadonce : true,
							groupingView : {
								groupField : [ 'memberCategoryCode' ],
								groupColumnShow : [ false ],
								groupText : [ '<b>{0} - {1} Members(s)</b>' ]
							},
							
							onSelectRow : function(id) {
								//  								if (id && id !== lastsel) {
								//  									jQuery('#' + gridId).jqGrid('restoreRow',
								//  											lastsel);
								//  									jQuery('#' + gridId).jqGrid('editRow', id,
								//  											true, datePicker);
								//  									lastsel = id;
								// 								}
							},
							editurl : "updateGroupMember",
							caption : captionVal
						});
		jQuery("#" + gridId).jqGrid('navGrid', "#pgrid" + groupMemCatCode, {
			edit : false,
			add : false,
			del : false
		});
		jQuery("#" + gridId).jqGrid('filterToolbar', {
			searchOperators : true
		});
		//jQuery("#" + gridId).jqGrid('setFrozenColumns');
	}
</script>
