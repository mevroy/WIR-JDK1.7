<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="1">
	<div class="jumbotron">

		<div>


			<form:form commandName="groupClient" action="groupClient"
				method="post" id="groupClient">
				<h2>Client</h2>
				<div class="row">
					<div class="col-lg-5">
						<div class="form-group" id="clientNameCtl">
							<label class="control-label" for="clientName">Client
								Business Name</label>

							<div class="controls">
								<form:input path="clientName" cssClass="form-control"
									id="firstName" placeholder="Enter Client Name" />
							</div>
						</div>
						<div class="form-group" id="clientABNCtl">
							<label class="control-label" for="clientABN">Client ABN</label>

							<div class="controls">
								<form:input path="clientABN" cssClass="form-control"
									id="lastName" placeholder="Enter Client ABN" />
							</div>
						</div>
						<div class="form-group" id="emailCtl">
							<label class="control-label" for="email">Email</label>

							<div class="controls">
								<div class="input-group">
									<form:input path="email" cssClass="form-control"
										id="primaryEmail" placeholder="Enter Email" />
									<div class="input-group-addon">
										<span><i class="glyphicon glyphicon-envelope"></i></span>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col-lg-offset-2 col-lg-5">
						<div class="form-group" id="phoneCtl">
							<label class="control-label" for="phone">Phone No.</label>

							<div class="controls">
								<div class="input-group">
									<form:input path="phone" cssClass="form-control" id="phone"
										placeholder="Enter Phone Number" />
									<div class="input-group-addon">
										<span><i class='glyphicon glyphicon-phone'></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group" id="faxCtl">
							<label class="control-label" for="otherPhone">Fax</label>

							<div class="controls">
								<div class="input-group">
									<form:input path="fax" cssClass="form-control" id="fax"
										placeholder="Enter Fax Number" />
									<div class="input-group-addon">
										<span><i class='glyphicon glyphicon-phone-alt'></i></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<h3>Address <span><a id="address-plus-sign"  href="#" onclick="replaceHTML('newAddress',$('#addressForm').html()); hideById('address-plus-sign'); showById('address-minus-sign'); $('#groupClient').validate(); $('input#streetAddress').rules('add', 'required'); $('select#addressType').rules('add', 'required');"><i
											class="glyphicon glyphicon-plus-sign"></i></a><a style="display: none;" id="address-minus-sign"  href="#" onclick="replaceHTML('newAddress',''); hideById('address-minus-sign'); showById('address-plus-sign');"><i
											class="glyphicon glyphicon-minus-sign"></i></a></span></h3>

				<div class="row" id="newAddress">


				</div>
				<h3>Contact <span><a id="contact-plus-sign" href="#" onclick="replaceHTML('newContact',$('#contactForm').html()); hideById('contact-plus-sign'); showById('contact-minus-sign'); $('#groupClient').validate(); $('input#contactFirstName').rules('add', 'required');"><i
											class="glyphicon glyphicon-plus-sign"></i></a><a style="display: none	;" href="#" id="contact-minus-sign" onclick="replaceHTML('newContact',''); hideById('contact-minus-sign'); showById('contact-plus-sign')"><i
											class="glyphicon glyphicon-minus-sign"></i></a></span></h3>
				<div class="row" id="newContact">


				</div>
				<form:hidden path="clientId" id="clientId" />
				
				<div class="row">

					<div class="col-lg-12">
						<div class="form-group">
							<input type="hidden" name="goTo" value="createWIR"/>
							<button class="btn btn-primary btn-lg btn-block has-spinner"
								type="submit" onclick="return $('#groupClient').valid();"
								data-loading-text="<span class='spinner'><i class='icon-spin glyphicon glyphicon-repeat'></i></span> Loading..">SAVE
								AND CREATE WIR</button>
						</div>
					</div>

				</div>
				<div class="row">

					<div class="col-lg-12">
						<div class="form-group">
							<button class="btn btn-primary btn-lg btn-block has-spinner"
								type="submit" onclick="return $('#groupClient').valid();"
								data-loading-text="<span class='spinner'><i class='icon-spin glyphicon glyphicon-repeat'></i></span> Loading..">SAVE
								</button>
						</div>
					</div>

				</div>


			</form:form>
		</div>
	</div>
</div>

<div  style="display: none;">
			<form:form commandName="groupClient" action="groupClient"
				method="post" id="addressForm">
					<div class="col-lg-5">
						<div class="form-group" id="addressTypeCtl">
							<label class="control-label" for="addressType">AddressType</label>

							<div class="controls">
								<form:select path="groupAddress[0].addressType"
									cssClass="form-control" id="addressType"
									placeholder="Enter Address Type">
									<form:option value="">Select One</form:option>
									<form:option value="RESIDENCE">RESIDENCE</form:option>
									<form:option value="OFFICE" selected="true">OFFICE</form:option>
									<form:option value="MAILING">MAILING</form:option>
									<form:option value="SITE">SITE</form:option>
									<form:option value="OTHER">OTHER</form:option>
								</form:select>
							</div>
						</div>
						<div class="form-group" id="poBoxCtl">
							<label class="control-label" for="poBox">PO BOX</label>

							<div class="controls">
								<form:input path="groupAddress[0].poBox" cssClass="form-control"
									id="poBox" placeholder="Enter PO Box" />
							</div>
						</div>
						<div class="form-group" id="streetAddressCtl">
							<label class="control-label" for="streetAddress">StreetAddress</label>

							<div class="controls">
								<form:input path="groupAddress[0].streetAddress"
									cssClass="form-control" id="streetAddress"
									placeholder="Enter Street Address" />
							</div>
						</div>
					</div>
					<div class="col-lg-offset-2 col-lg-5">

						<div class="form-group" id="suburbCtl">
							<label class="control-label" for="suburb">Suburb</label>

							<div class="controls">
								<form:input path="groupAddress[0].suburb"
									cssClass="form-control" id="suburb" placeholder="Enter Suburb" />

							</div>
						</div>

						<div class="form-group" id="stateCtl">
							<label class="control-label" for="state">State</label>

							<div class="controls">
								<form:input path="groupAddress[0].state" cssClass="form-control"
									id="state" placeholder="Enter State" />
							</div>
						</div>

						<div class="form-group" id="zipCodeCtl">
							<label class="control-label" for="zipCode">ZIP</label>

							<div class="controls">
								<form:input path="groupAddress[0].zipCode"
									cssClass="form-control" id="zipCode"
									placeholder="Enter ZIP code" />
							</div>
						</div>
					</div>
					</form:form>
</div>
<div style="display: none;">
			<form:form commandName="groupClient" action="groupClient"
				method="post" id="contactForm">
					<div class="col-lg-5">
						<div class="form-group" id="firstNameCtl">
							<label class="control-label" for="firstName">Contact
								First Name</label>

							<div class="controls">
								<form:input path="groupClientContact[0].firstName"
									cssClass="form-control" id="contactFirstName"
									placeholder="Enter First Name" />
							</div>
						</div>
						<div class="form-group" id="lastNameCtl">
							<label class="control-label" for="lastName">Contact Last
								Name</label>

							<div class="controls">
								<form:input path="groupClientContact[0].lastName"
									cssClass="form-control" id="lastName"
									placeholder="Enter Last Name" />
							</div>
						</div>


					</div>
					<div class="col-lg-offset-2 col-lg-5">

						<div class="form-group" id="mobilephoneCtl">
							<label class="control-label" for="mobilephone">Mobile No.</label>

							<div class="controls">
								<div class="input-group">
									<form:input path="groupClientContact[0].mobilephone"
										cssClass="form-control" id="mobilephone"
										placeholder="Enter Mobile Phone Number" />
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
									<form:input path="groupClientContact[0].email"
										cssClass="form-control" id="email" placeholder="Enter Email" />
									<div class="input-group-addon">
										<span><i class="glyphicon glyphicon-envelope"></i></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					</form:form>
</div>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('.input-group.date').datepicker({
					format : "dd/mm/yyyy"
				});

				$("#groupClient").validate(
						{
							rules : {
								clientName : {
									required : true
								},
								email : {
									required: false,
									email : true
								},
								firstName : {
									required: true
								},
								addressType : {
									required: true
								},
								streetAddress : {
									required: true
								}
								
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

	$("#dependentx").validate(
			{
				rules : {
					firstName : {
						required : true
					},
					lastName : {
						required : false
					},
					primaryEmail : {
						required : false,
						email : true
					},
					mobilephone : {
						required : false
					},
					relationship : {
						required : true
					}
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

	$("#dependent0").validate(
			{
				rules : {
					firstName : {
						required : true
					},
					lastName : {
						required : false
					},
					primaryEmail : {
						required : false,
						email : true
					},
					mobilephone : {
						required : false
					},
					relationship : {
						required : true
					}
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
	
	function replaceHTML(divId, html){
		$('#'+divId).html(html);
	}
</script>
