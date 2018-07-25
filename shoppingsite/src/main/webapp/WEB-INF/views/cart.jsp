<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/CSS/bootstrap.css"
	rel="stylesheet">

	
	
	
</head>
<body style="color:white;background:#333;">
	<%@include file="header.jsp"%>



	<div class="container" style="margin-top: 80px;">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<div class="text-center">
					<h1>Your Cart</h1>
				</div>
				<tr>
					<th style="width: 50%">Product</th>
					<th style="width: 10%">Price</th>
					<th style="width: 8%">Quantity</th>
					<th style="width: 22%" class="text-center">Subtotal</th>
					<th style="width: 10%"></th>
				</tr>
			</thead>
			<c:forEach items="${cartlist}" var="cart">
				<tbody>
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-2 hidden-xs">
									<img style="height: 100px;"
										src="${pageContext.request.contextPath}/resources/IMAGES/${cart.product.code}/1.jpg"
										alt="IMG" class="img-responsive" />
								</div>
								<div class="col-sm-10">
									<h4 class="nomargin">${cart.product.productbrandname}</h4>
									<h4 class="nomargin">${cart.product.productname}</h4>
								</div>
							</div>
						</td>
						<td data-th="Price">$${cart.product.price}</td>
						<td data-th="Quantity">
							<form method="POST" action="updatecart/${cart.id}">
								<input name="qty" value="${cart.productCount}" />
								<button type="submit">Update</button>
							</form>
						</td>
						<td data-th="Subtotal" class="text-center">
							$${cart.product.price*cart.productCount}</td>
						<td class="actions" data-th=""><a
							href="${pageContext.request.contextPath}/deletecartline/${cart.id}"
							class="btn btn-danger btn-sm">Delete
								</button></td>
					</tr>
				</tbody>
			</c:forEach>
			<tfoot>
				<tr>
					<td><a
						href="${pageContext.request.contextPath}/displayproduct"
						class="btn btn-dark"><i class="fa fa-angle-left"></i> Continue
							Shopping</a></td>
					<td colspan="2" class="hidden-xs"></td>
					<td class="hidden-xs text-center"><strong>Total
							$${grandTotal}</strong></td>
					<td><a href="${pageContext.request.contextPath}/bill"
						class="btn btn-dark btn-block">Checkout <i
							class="fa fa-angle-right"></i></a></td>
				</tr>
			</tfoot>
		</table>
	</div>







</body>
</html>