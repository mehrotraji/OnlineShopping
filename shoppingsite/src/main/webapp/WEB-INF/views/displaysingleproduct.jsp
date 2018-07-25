<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/CSS/bootstrap.css"
	rel="stylesheet">
</head>


<body style="color: white; background: #333">

	<%@include file="header.jsp"%>
	<div  class="container-fluid" style="background: red; margin-top: 100px; margin-left: 100px;">
		<div style="margin-top: 57px; width: 30%; float: left;"
			id="myCarousel" class="carousel slide" data-ride="carousel"
			data-interval="2000">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100 img-responsive" style="height: 580px;"
						src="${pageContext.request.contextPath}/resources/IMAGES/${prolist.code}/1.jpg">
				</div>

				<div class="carousel-item">
					<img class="d-block w-100" style="height: 580px;"
						src="${pageContext.request.contextPath}/resources/IMAGES/${prolist.code}/2.jpg">
				</div>

				<div class="carousel-item ">
					<img class="d-block w-100" style="height: 580px;"
						src="${pageContext.request.contextPath}/resources/IMAGES/${prolist.code}/3.jpg">
				</div>
			</div>
		</div>
		<div style="background: blue; float: left; width: 50%">
			<span style="font-weight: bold">${prolist.productbrandname}</span> <span
				style="font-weight: bold">${prolist.productname}</span>
		</div>
		<div style="background: green; width: 50%">
			<span style="font-weight: bold">$${prolist.price }</span>
		</div>
		<div style="background: yellow; width: 50%">
			<a
				href="${pageContext.request.contextPath }/addcart/${prolist.productID}?qty=1"
				class="btn btn-lg btn-dark ">Add to cart</a>
		</div>
	</div>
	







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