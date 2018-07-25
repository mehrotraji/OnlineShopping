<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/CSS/bootstrap.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/CSS/floating-labels.css"
	rel="stylesheet">


</head>
<body style="background:#333;color:white;">

	<div style="width: 100%">
		<form:form style="width:400px;" class="form-signin"
			modelAttribute="user" action="reguser" method="post">
			<div class="text-center mb-4">
				<h1 class="h3 mb-3 font-weight-normal">Slipkart</h1>
			</div>
			<div class="form-label-group">
				<form:input type="text" id="inputName" path="name"
					class="form-control" placeholder="Full Name" required="" />
				<label for="inputName">Full Name</label>
			</div>

			<div class="form-label-group">
				<form:input type="email" id="inputEmail" path="mail"
					class="form-control" placeholder="Email Address" required="" />
				<label for="inputEmail">Email Address</label>
			</div>

			<div class="form-label-group">
				<form:input type="text" id="inputNumber" path="number"
					class="form-control" placeholder="Mobile Number" required="" />
				<label for="inputNumber">Mobile Number</label>
			</div>

			<div class="form-label-group">
				<form:input type="text" id="inputAddress" path="address"
					class="form-control" placeholder="Address" required="" />
				<label for="inputAddress">Address</label>
			</div>
			
			<div class="form-label-group">
				<form:input type="password" id="inputPassword" path="password"
					class="form-control" placeholder="Password" required="" />
				<label for="inputPassword">Password</label>
			</div>


			<button class="btn btn-lg btn-dark btn-block" type="submit">Sign
				in</button>
			<hr />
			<p>
				Already have an account? <a  style="font-weight:italics;color:white;" href="${pageContext.request.contextPath}/login"><i>Log In</i></a>
			</p>


		</form:form>
</body>
</html>
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script
	src="${pageContext.request.contextPath}/resources/JS/jquery-3.3.1.js"
	crossorigin="anonymous"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="${pageContext.request.contextPath}/resources/JS/jquery-3.3.1.js"><\/script>')
</script>
<script src="${pageContext.request.contextPath}/resources/JS/popper.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/JS/bootstrap.js"></script>


</body>
</html>