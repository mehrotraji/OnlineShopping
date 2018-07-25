<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<header> <nav
		class="navbar navbar-expand-md navbar-dark fixed-top bg-dark"> <a
		class="navbar-brand" href="${pageContext.request.contextPath}/">Slipkart</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarCollapse" aria-controls="navbarCollapse"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.request.contextPath}/displayproduct"> All
					Product<span class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" style="color: white;"
				href="${pageContext.request.contextPath}/aboutus">About us</a></li>
			<li class="nav-item"><a class="nav-link" style="color: white;"
				href="${pageContext.request.contextPath}/contactus">Contact us</a></li>
			<li class="nav-item dropdown"><a style="color: white;"
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Categories </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					
					 <c:forEach items="${catlist}" var="catlist">
						<a href="${pageContext.request.contextPath}/catproduct/${catlist.categoryID}" class="dropdown-item" style="color:white;">${catlist.categoryname}</a>
					</c:forEach>
				</div></li>
			<li class="nav-item"><a class="nav-link" style="color: white;"
				href="${pageContext.request.contextPath}/cart">Cart</a></li>


		</ul>
		<form class="form-inline mt-2 mt-md-0">
			<c:choose>
				<c:when test="${loggedIn==true}">
					<i style="font-size: 15px;color:white;">Welcome ${user.name}</i>
					<a class="nav-link" style="color: white;" href="logout">Log out</a>
				</c:when>
				<c:otherwise>
					<a class="nav-link" style="color: white;"
						href="${pageContext.request.contextPath}/login">Log In/Sign Up</a>
				</c:otherwise>
			</c:choose>
			<input class="form-control mr-sm-2" type="text" placeholder="Search"
				aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
	</nav> </header>
	<script>
		// When the user scrolls the page, execute myFunction
		window.onscroll = function() {
			myFunction()
		};

		// Get the navbar
		var navbar = document.getElementById("navbar");

		// Get the offset position of the navbar
		var sticky = navbar.offsetTop;

		// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
		function myFunction() {
			if (window.pageYOffset >= sticky) {
				navbar.classList.add("sticky")
			} else {
				navbar.classList.remove("sticky");
			}
		}
	</script>



</body>
</html>