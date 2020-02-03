<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="jumbotron">
           <h2>Sign Up as a user!</h2>
	<br />
	<div class="span12">
		<div class="row">
    <form:form commandName="registerUserForm" id="registerUserForm" action="registerUser" method="post" >
				<div class="col-lg-5">
					<div class="form-group" id="usernameCtl">
						<label class="control-label" for="username">User Name</label>

						<div class="controls">
							<form:input path="username" cssClass="form-control"
								id="username" placeholder="Enter User Name" />
						</div>
					</div>
					<div class="form-group" id="passwordCtl">
						<label class="control-label" for="password">Password</label>

						<div class="controls">
							<form:password path="password" cssClass="form-control" id="password"
								placeholder="Enter Password" />
						</div>
					</div>
					<div class="form-group" id="confirmCtl">
						<label class="control-label" for="confirm">Confirm Password </label>

						<div class="controls">
							<form:input path="confirm" cssClass="form-control"
								id="confirm" placeholder="Confirm Password" />
						</div>
					</div>
					</div>
					<div class="col-lg-offset-2 col-lg-5">
					<div class="form-group" id="emailCtl">
						<label class="control-label" for="email">Email</label>

						<div class="controls">
							<div class="input-group">
								<form:input path="email" cssClass="form-control"
									id="email" placeholder="Enter Email" />
								<div class="input-group-addon">
									<span><i class="glyphicon glyphicon-envelope"></i></span>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group" id="mobileCtl">
						<label class="control-label" for="mobile">Mobile No.</label>

						<div class="controls">
							<div class="input-group">
								<form:input path="mobile" cssClass="form-control"
									id="mobile" placeholder="Enter Mobile Phone Number" />
								<div class="input-group-addon">
									<span><i class='glyphicon glyphicon-phone'></i></span>
								</div>
							</div>
						</div>
					</div>


				</div>

				

				<div class="col-lg-12">
					<form:hidden path="serialNumber" id="serialNumber"/>
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
							$("#registerUserForm").validate({
					            rules:{
					                username:{
					                    required:true,
					                    minlength:6,
					                    maxlength:15
					                },
					                password:{
					                    required:true,
					                    minlength:6
					                },
					                confirm:{
					                    equalTo:'#password'
					                },
					                email:{
					                    required:true,
					                    email:true,
					                    maxlength:35
					                },
					                mobile:{
					                    required:false,
					                    digits:true,
					                    maxlength:10
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

</script>
