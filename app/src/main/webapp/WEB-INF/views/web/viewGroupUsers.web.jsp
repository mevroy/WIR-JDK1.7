<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var myData = [];
	var lastsel;
</script>
	<div class="span12">

	<ul class="nav nav-tabs">
		<li class="active"><a href="#optionALL" data-toggle="tab">Users
				</a></li>

	</ul>
	<div class="tab-content">
		<div role="presentation" class="active" id="optionALL">
					<!-- div class="hero-unit">  -->
					<table id="gridALL"></table>
					<div id="pgridALL"></div>
					<!-- /div>  -->
		</div>
	</div>

</div>

<script type="text/javascript">
	$(document).ready(function() {
		loadGrid('gridALL', 'ALL', 'All Users');
		var lastsel = "";
	});

	function loadGrid(gridId, groupMemCatCode, captionVal) {
		jQuery("#" + gridId)
				.jqGrid(
						{
							url : 'json/viewGroupUsers',
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
											url : 'json/updateGroupUsers',
											height : 580,
											width : 540,
											top : 44,
											left : 470,
											dataheight : 490,
											closeAfterEdit: true,
											//modal : true,
											reloadAfterSubmit : true,
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
										label : 'User Name',
										name : 'userName',
										index : 'userName',
										width : 150,
										search : false,
										sorttype : "string",
										editable : false

									},
									{
										label : 'Employee Record',
										name : 'serialNumber',
										index : 'serialNumber',
										search : false,
											sorttype : "string",
											hidden : false,
											width : 250,
											editable : false,
											edittype : 'select',
											editoptions : {
												dataUrl : 'json/viewAllActiveGroupMembers',
												buildSelect : function(response) {
													var options = '<select>';
													options += '<option value="0">Select One</option>';
													var j = $.parseJSON(response);
													for (var i = 0; i < j.length; i++) {
														options += '<option value="' + j[i].serialNumber+'">'
																+ j[i].firstName +' '+ j[i].lastName
																+ '</option>';
													}
													options += '</select>';
													return options;
												}
											}
									},
									
									{
										label : 'Created At',
										name : 'createdAt',
										index : 'createdAt',
										hidden : false,
										search : false,
										formatter : formatDateTime,
										editable : false,
										width: 250

 									},
									{
										label : 'Roles',
										name : 'groupUserRoles[0].role',
										index : 'groupUserRoles[0].role',
										hidden : false,
										editable : true,
										formatter : function(cellValue, options, rowObject) {
											return rowObject.groupUserRoles[0].role;
										},
										edittype : 'select',
										editoptions : {
											dataUrl : 'viewApplicationRoles',
											buildSelect : function(response) {
												var options = '<select>';
												var j = $.parseJSON(response);
												for (var i = 0; i < j.length; i++) {
													if(j[i]!== "SUPER_ADMIN") {
													options += '<option value="' + j[i] + '">'
															+ j[i]
															+ '</option>';
												}
												}
												options += '</select>';
												return options;
											},
											 editrules:{required:true}
										}
									},
									{
										label : 'Start Date',
										name : 'groupUserRoles[0].startDate',
										index : 'groupUserRoles[0].startDate',
										hidden : false,
										editable : true,
										editoptions : {
											dataInit : datetimePick
										},
										formatter : function(cellValue, options, rowObject) {
											return formatDateTime(rowObject.groupUserRoles[0].startDate);
										}
									},
									{
										label : 'Expiry date',
										name : 'groupUserRoles[0].expiryDate',
										index : 'groupUserRoles[0].expiryDate',
										hidden : false,
										editable : true,
										editoptions : {
											dataInit : datetimePick
										},
										formatter : function(cellValue, options, rowObject) {
											return formatDateTime(rowObject.groupUserRoles[0].expiryDate)
										}
									},
									{
										label : 'ID',
										name : 'groupUserRoles[0].id',
										index : 'groupUserRoles[0].id',
										sorttype : "string",
										hidden : true,
										editable : true,
										formatter : function(cellValue, options, rowObject) {
											return rowObject.groupUserRoles[0].id;
										}
									},
									{
										label : 'ID',
										name : 'id',
										index : 'id',
										sorttype : "string",
										hidden : true,
										editable : true
									}
									],
							height : 'auto',
							rowNum : 500,
							rownumbers : true,
							rownumWidth : 25,
							width : '100%',
							rowList : [ 250, 500, 1000, 2000 ],
							pager : '#pgrid' + groupMemCatCode,
							//sortname : 'firstName',
							autoencode : true,
							shrinkToFit : false,
							viewrecords : true,
							loadonce : false,
							//grouping : true,
							subGrid : false,
							groupingView : {
								groupField : [ 'memberCategoryCode' ],
								groupColumnShow : [ false ],
								groupText : [ '<b>{0} - {1} Members(s)</b>' ]
							},
							editurl : "json/updateGroupWorkInstructionRecord",
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
