<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="jumbotron">
	<h2>Add Employees</h2>
	<br />
	<div class="span12">
		<div class="row">
			<form:form commandName="groupMember" action="saveGroupMemberGIES"
				method="post" id="groupMember">
				<div class="col-lg-5">
					<div class="form-group" id="firstNameCtl">
						<label class="control-label" for="firstName">First Name</label>

						<div class="controls">
							<form:input path="firstName" cssClass="form-control"
								id="firstName" placeholder="Enter First Name" />
						</div>
					</div>
					<div class="form-group" id="lastNameCtl">
						<label class="control-label" for="lastName">Last Name</label>

						<div class="controls">
							<form:input path="lastName" cssClass="form-control" id="lastName"
								placeholder="Enter Last Name" />
						</div>
					</div>
					<div class="form-group" id="primaryEmailCtl">
						<label class="control-label" for="primaryEmail">Email</label>

						<div class="controls">
							<div class="input-group">
								<form:input path="primaryEmail" cssClass="form-control"
									id="primaryEmail" placeholder="Enter Email" />
								<div class="input-group-addon">
									<span><i class="glyphicon glyphicon-envelope"></i></span>
								</div>
							</div>
						</div>
					</div>
					
						<div class="form-group" id="membershipStartDateCtl">
							<label class="control-label" for="membershipDates">Employment
								Dates</label>
							<div class="controls">
								<div class="input-daterange input-group">

									<div class="input-group-addon">
										<span><i class='glyphicon glyphicon-calendar'></i></span>
									</div>
									<form:input path="membershipStartDate" cssClass="form-control"
										id="membershipStartDate" placeholder="Start Date" />
									<div class="input-group-addon">
										<span>TO</span>
									</div>

									<form:input path="membershipEndDate" cssClass="form-control"
										id="membershipEndDate" placeholder="End Date" />
									<div class="input-group-addon">
										<span><i class='glyphicon glyphicon-calendar'></i></span>
									</div>

								</div>
							</div>
						</div>

				</div>

				<div class="col-lg-offset-2 col-lg-5">

					<div class="form-group" id="mobilephoneCtl">
						<label class="control-label" for="mobilephone">Mobile No.</label>

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
					<div class="form-group" id="otherPhoneCtl">
						<label class="control-label" for="otherPhone">Other Contact No.
							No</label>

						<div class="controls">
							<div class="input-group">

								<form:input path="otherPhone" cssClass="form-control"
									id="otherPhone" placeholder="Enter Home Phone Number" />
								<div class="input-group-addon">
									<span><i class='glyphicon glyphicon-phone-alt'></i></span>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group" id="memberCategoryCodeCtl">
						<label class="control-label" for="memberCategoryCode">Member
							Category Code</label>

						<div class="controls">

							<form:select path="memberCategoryCode" cssClass="form-control"
								id="memberCategoryCode">
								<option value="">Select One</option>
							</form:select>
						</div>
					</div>



				</div>

				<div class="col-lg-12">
					<form:hidden path="groupCode" id="groupCode"
						placeholder="Enter Group Code" readonly="true" />
					<input class="btn btn-primary btn-block btn-lg" type="submit"
						value="SUBMIT" /> <a
						href="${pageContext.request.contextPath}/${sessionScope.groupCode}/"
						class="btn btn-default btn-block btn-lg">CANCEL</a>
				</div>
			</form:form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#groupMember").validate(
						{
							rules : {
								firstName : {
									required : true
								},
								lastName : {
									required : false
								},
								primaryEmail : {
									email : true
								},
								mobilephone : {
									maxlength : 13
								},
								otherPhone : {
									maxlength : 13
								},
     							memberCategoryCode : {
									required : true
								}
							},
							messages : {

							},
							errorPlacement : function(error, element) {
								error.appendTo(element.parent("div").parent(
										"div"));
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
						})

			});

	$(function() {

		$('.input-group.date, .input-daterange').datepicker({
			format : "dd/mm/yyyy",
			autoclose : true,
			todayHighlight : true
		});
		buildGroupMemberCategoriesOptions('memberCategoryCode');
	});
</script>
