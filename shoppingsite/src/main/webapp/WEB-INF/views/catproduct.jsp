<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="${pageContext.request.contextPath}/resources/CSS/bootstrap.css"
	rel="stylesheet">
</head>
<body style="background:#333;color:white;">
	<%@include file="header.jsp"%>
	<div style="margin-top: 50px; margin-left: 200px; width: 100%">

		<div style="width: 90%;">
			<c:forEach items="${prolist}" var="product">
				<div class="hoverproduct shadow" style="margin-top:50px;border:1px solid #343a40;width: 280px;border-radius:15px;height: 410px;margin-right: 80px;float:left;">
				<a  style="text-decoration:none;"href="${pageContext.request.contextPath }/displaysingleproduct/${product.productID}" >
					<img src="resources/IMAGES/${product.code}/1.jpg" style="width: 250px; height: 270px;margin-left:5px;margin-top:10px;" /> 
					<span style="font-size: 20px;color:white;margin-left:5px;margin-top:10px;">${product.productbrandname}</span>
					<span style="font-size: 20px;color:white;margin-left:5px;margin-top:10px;">${product.productname}</span>
					<br />
					<span style="font-size: 20px;color:white;margin-left:5px;margin-top:10px;">$${product.price}</span>
					<br /> 
					
				</a>
				<a
					href="${pageContext.request.contextPath }/addcart/${product.productID}?qty=1"
					class="btn btn-lg btn-dark " style="margin-left:5px;margin-top:10px;">Add to cart</a>
				</div>
			</c:forEach>


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