<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var myData = [];
	var lastsel;
</script>
	<div class="span12">

	<ul class="nav nav-tabs">
		<li class="active"><a href="#optionALL" data-toggle="tab">WIRs
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
		loadGrid('gridALL', 'ALL', 'All WIRs');
		var lastsel = "";
	});

	function loadGrid(gridId, groupMemCatCode, captionVal) {
		jQuery("#" + gridId)
				.jqGrid(
						{
							url : 'json/viewGroupWorkInstructionRecords<c:if test="${!editable}">Self</c:if>',
							datatype : "json",
							colModel : [
//									{
// 										label : 'Action',
// 										name : 'myac',
// 										width : 35,
// 										fixed : true,
// 										sortable : false,
// 										resize : false,
// 										formatter : 'actions',
// 										formatoptions : {
// 											keys : true,
// 											editbutton: ${editable},
// 											delbutton : false,
// 										editformbutton: ${editable},
// //  											delOptions : {
// // 												ajaxDelOptions : {
// // 													// url: "deleteGroupMember",
// // 													contentType : 'application/json;charset=utf-8',
// // 													type : 'POST',
// // 													datatype : 'json'
// // 												}
// // 											},
// 											editOptions : {
// 												url : 'json/updateGroupWorkInstructionRecord',
// 												height : 580,
// 												width : 540,
// 												top : 44,
// 												left : 470,
// 												dataheight : 490,
// 												closeAfterEdit: true,
// 												//modal : true,
// 												reloadAfterSubmit : true,
// 												afterSubmit : function(
// 														response, postdata) {
// 													var status = false;
// 													if (response.responseText === "success")
// 														status = true
// 													return [ status,
// 													         response.responseText ];
// 												}}
// 										}
// 									},
									{
										label : ' ',
										name : 'id',
										index : 'id',
										width : 80,
										search : false,
										sorttype : "string",
										editable : false,
										formatter: function(cellValue, options, rowObject) {
											
										    var id = rowObject.id;
										    var url = "groupInstructionRecord?girId="+id ;
										    return "<a href='"+url+"'  class='btn btn-warning btn-xs' >EDIT</a>"
										    }
									},
									{
										label : 'Job No',
										name : 'jobNumber',
										index : 'jobNumber',
										sorttype : "string",
										width : 120,
										sorttype : "string",
										searchoptions : {
											sopt : [ 'bw', 'eq', 'bn', 'cn',
													'nc', 'ew', 'en' ]
										},
										hidden : false,
										editable : false,
										formatter: function(cellValue, options, rowObject) {
											
										    var id = rowObject.id;
										    var url = "generateWIRPDF?id="+id ;
										    return "<a href='#' onclick='window.open(\""+url+"\",\"printwindow\",\"toolbar=no , location=no , width=200, height=200, id=printer, top=100, left=400\");'  class='btn btn-warning btn-xs' >"+rowObject.jobNumber+"</a>"
										    }
									},
									
									{
										label : 'Client',
										name : 'groupClient.clientName',
										index : 'groupClient.clientName',
										sorttype : "string",
										//frozen : true,
										width : 200,
										editable : false,
										searchoptions : {
											sopt : [ 'bw', 'eq', 'bn', 'cn',
													'nc', 'ew', 'en' ]
										}

									},
									{
										label : 'Quote Number',
										name : 'quoteNumber',
										index : 'quoteNumber',
										width : 80,
										hidden : true,
										editable : false,
										search : true,
										sorttype : "string",

									},									
									{
										label : 'Material',
										name : 'material',
										index : 'material',
										sorttype : "string",
										width : 80,
										hidden : true,
										editable : true,

									},
									{
										label : 'Access',
										name : 'suitableAccess',
										index : 'suitableAccess',
										width : 50,
										hidden : true,
										sortable : true,
										editable : true,
										edittype : "checkbox",
										formatter : formatBoolean,
										editoptions : {
											value : "Yes:No"
										}
									},
									{
										label : 'NATA Endorsed',
										name : 'nataEndorsed',
										index : 'nataEndorsed',
										width : 70,
										sortable : true,
										editable : true,
										edittype : "checkbox",
										formatter : formatBoolean,
										editoptions : {
											value : "Yes:No"
										}
									},
									{
										label : 'Power',
										name : 'power',
										index : 'power',
										width : 50,
										sortable : true,
										editable : true,
										hidden : true,
										edittype : "checkbox",
										formatter : formatBoolean,
										editoptions : {
											value : "Yes:No"
										}
									},
									{
										label : 'Access Equipment',
										name : 'ewpAccessEquipment',
										index : 'ewpAccessEquipment',
										sorttype : "string",
										width : 100,
										hidden : true,
										editable : true,
										edittype : "checkbox",
										formatter : formatBoolean,
										editoptions : {
											value : "Yes:No"
										}
									},
									{
										label : 'Assigned To',
										name : 'groupMember.serialNumber',
										index : 'groupMember.serialNumber',
										search : false,

											sorttype : "string",
											hidden : false,
											width : 150,
											formatter: function(cellValue, options, rowObject) {
												return rowObject.groupMember!= null ? rowObject.groupMember.firstName + ' '+ rowObject.groupMember.lastName : ""
											},
											editable : true,
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
										label : 'Mobile Phone',
										name : 'mobilePhone',
										index : 'mobilePhone',
										width : 80,
										hidden : true,										
										sortable : false,
										sorttype : "string",
										editable : true
									},
									{
										label : 'Job Start Time',
										name : 'jobStart',
										search : false,
										index : 'jobStart',
										hidden : false,
										editable : true,
										formatter : formatDateTime,
										editoptions : {
											dataInit : datetimePick
										},
										width: 180
									},
									{
										label : 'Job End Time',
										name : 'jobEnd',
										index : 'jobEnd',
										hidden : true,
										editable : true,
										formatter : formatDateTime,
										width : 100,
										editoptions : {
											dataInit : datetimePick
										}
									},
									
									{
										label : 'Created At',
										name : 'createdAt',
										index : 'createdAt',
										formatter : formatDateTime,
										//sorttype : "date",
										hidden : false,
										search : false,
										editable : false,
										width: 180

 									},
									{
										label : 'Logged By',
										name : 'createdBy',
										index : 'createdBy',
										width : 120,
										editable : false,
										search : true,
										sorttype : "string",

									},
// 									{
// 										label : 'Created By',
// 										name : 'createdBy',
// 										index : 'createdBy',
// 										sorttype : "string",
// 										hidden : true,
// 										editable : false
// 									},
									{
										label : 'ID',
										name : 'id',
										index : 'id',
										sorttype : "string",
										hidden : true,
										editable : true
									},
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
							loadonce : true,
							//grouping : true,
							subGrid : true,
							groupingView : {
								groupField : [ 'memberCategoryCode' ],
								groupColumnShow : [ false ],
								groupText : [ '<b>{0} - {1} Members(s)</b>' ]
							},
							subGridOptions : {
								"plusicon" : "ui-icon-triangle-1-e",
								"minusicon" : "ui-icon-triangle-1-s",
								"openicon" : "ui-icon-arrowreturn-1-e",
								// load the subgrid data only once
								// and the just show/hide
								"reloadOnExpand" : true,
								// select the row when the expand column is clicked
								"selectOnExpand" : true
							},
							subGridRowExpanded : function(subgrid_id, row_id) {
								var subgrid_table_id, pager_id;
								subgrid_table_id = subgrid_id + "_t";
								var data = jQuery('#' + gridId).jqGrid(
										'getRowData', row_id);
								var parentId = data.id;
								//var dependetData = data.groupDependents;
								//var dependentObjects = JSON.parse(dependetData);
								pager_id = "p_" + subgrid_table_id;
								$("#" + subgrid_id)
										.html(
												"<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
								jQuery("#" + subgrid_table_id)
										.jqGrid(
												{
													url:"json/viewGroupWorkItems?parentId="+parentId,
													datatype : "json",													
													colNames : [ 'Action',
															'Test Method',
															'ITR Document',
															'Test Standard',
															'Acceptance Criteria',
															'Item Procedure',
															'Nata Class Test',
															'ID' ],
													colModel : [
															{
																name : 'myac',
																width : 80,
																fixed : true,
																sortable : false,
																resize : false,
																hidden: true,
																formatter : 'actions',
																formatoptions : {
																	keys : true,
																	editbutton: ${editable},
																	delbutton : false,
																editformbutton: ${editable},
																	editOptions : {
																		url : 'json/updateGroupWorkItem',
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
																name : "testMethod",
																index : "testMethod",
																width : 180,
																editable : true,
																editrules : {
																	required : true
																},
																edittype : 'select',
																editoptions : {
																	dataUrl : '${pageContext.request.contextPath}/loadEmailTemplate/TestMethods',
																	buildSelect : function(response) {
																		var options = '<select >';
																		var j = $.parseJSON(response);
																		for (var i = 0; i < j.length; i++) {
																			options += '<option value="' + j[i].TestMethod + '">'
																					+ j[i].TestMethodLabel
																					+ '</option>';
																		}
																		options += '</select>';
																		return options;
																	}
																}
															},
															{
																name : "itrDocument",
																index : "itrDocument",
																width : 200,
																editable : true,
																edittype : 'select',
																editoptions : {
																	dataUrl : '${pageContext.request.contextPath}/loadEmailTemplate/TestMethods',
																	buildSelect : function(response) {
																		var options = '<select >';
																		var j = $.parseJSON(response);
																		for (var i = 0; i < j.length; i++) {
																			//if(j[i].TestMethod === testMethod) {
																			for(var a = 0; a < j[i].ITRDocument.length; a++) {
																			options += '<option value="' + j[i].ITRDocument[a].ITRDocumentValue + '">'
																					+ j[i].ITRDocument[a].ITRDocumentLabel + '</option>';
																			}
																	//	}
																		}
																		options += '</select>';
																		return options;
																	}
																}
															},
															{
																name : "testStandard",
																index : "testStandard",
																width : 250,
																editable : true,
																edittype : 'select',
																formatter: splitStringToLinesByCommas,
																editoptions : {
																	multiple : true,
																	dataUrl : '${pageContext.request.contextPath}/loadEmailTemplate/TestMethodStandards',
																	buildSelect : function(response) {
																		var options = '<select >';
																		var j = $.parseJSON(response);
																		for (var i = 0; i < j.length; i++) {
																			options += '<option value="' + j[i].TestMethodStandardValue + '">'
																					+ j[i].TestMethodStandardLabel
																					+ '</option>';
																		}
																		options += '</select>';
																		return options;
																	}
																}
															},
															{
																name : "acceptanceCriteria",
																index : "acceptanceCriteria",
																width : 170,
																editable : true,
																edittype : 'select',
																formatter: splitStringToLinesByCommas,																
																editoptions : {
																	multiple : true,
																	dataUrl : '${pageContext.request.contextPath}/loadEmailTemplate/AcceptanceCriteria',
																	buildSelect : function(response) {
																		var options = '<select >';
																		var j = $.parseJSON(response);
																		for (var i = 0; i < j.length; i++) {
																			options += '<option value="' + j[i].AcceptanceCriteria + '">'
																					+ j[i].AcceptanceCriteriaValue
																					+ '</option>';
																		}
																		options += '</select>';
																		return options;
																	}
																}
															},
															{
																name : "itemProcedure",
																index : "itemProcedure",
																width : 120,
																editable : true,																edittype : 'select',
																editoptions : {
																	multiple : true,
																	dataUrl : '${pageContext.request.contextPath}/loadEmailTemplate/Procedures',
																	buildSelect : function(response) {
																		var options = '<select >';
																		var j = $.parseJSON(response);
																		for (var i = 0; i < j.length; i++) {
																			options += '<option value="' + j[i].ProcedureValue + '">'
																					+ j[i].ProcedureLabel
																					+ '</option>';
																		}
																		options += '</select>';
																		return options;
																	}
																}
															},
															{
																name : "nataClassTest",
																index : "nataClassTest",
																width : 150,
																editable : true
															},
															{
																name : "id",
																index : "id",
																width : 100,
																editable : true,
																hidden : true
															}

													],
													rowNum : 20,
													pager : pager_id,
													//	sortname: 'num',
													sortorder : "asc",
													rownumbers : true,
													rownumWidth : 25,
													height : '100%',
													editurl : "json/updateGroupWorkItem",
													caption : "Work Items  <a href='generateWIRPDF?id="
														+ parentId
														+ "' target='_new' class='btn btn-danger btn-xs' >PRINT WIR</a>"
												});
								// 								jQuery("#" + subgrid_table_id).jqGrid(
								// 										'navGrid', "#" + pager_id, {
								// 											edit : false,
								// 											add : true,
								// 											del : false
								// 										})
								jQuery("#" + subgrid_table_id)
										.jqGrid(
												'navGrid',
												"#" + pager_id,
												{del:false, 
												add:false, 
												edit:false}, //add , or edit or delete option flags
												{
													height : 400,
													width : 420,
													top : 100,
													left : 400,
													dataheight : 300,
													reloadAfterSubmit : true,
													afterSubmit : function(
															response, postdata) {
														var status = false;
														if (response.responseText === "success")
															status = true
														return [ status,
														         response.responseText ];
													}
												}, // edit options
												{
													height : 400,
													width : 420,
													top : 100,
													left : 200,
													dataheight : 300,
													reloadAfterSubmit : true,
													afterSubmit : function(
															response, postdata) {
														var status = false;
														if (response.responseText === "success")
															status = true
														return [ status,
														         response.responseText ];
													}
												}, // add options
												{}, // del options
												{													height : 200,
													width : 720,
													top : 100,
													left : 400,
													dataheight : 100} // search options
										);
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
