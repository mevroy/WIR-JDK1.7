<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>

	<div class="span12">

		<div>
			<ul class="nav nav-tabs">
				<li class="active"><a href="#option1" data-toggle="tab">Home</a></li>
				<li><a href="#option2" data-toggle="tab">My Jobs</a></li>

			</ul>

				<div class="tab-content">
</br>
					<div class="tab-pane active" id="option1">
						<p>
							Welcome back
							<c:out value="${sessionScope.user.name}" />
							!
						</p>
					</div>

					<div class="tab-pane" id="option2">
						<p>Please visit the "View My Jobs" link under the WIR menu to
							view the jobs assigned to you</p>
					</div>
				</div>
		</div>
	</div>
</div>