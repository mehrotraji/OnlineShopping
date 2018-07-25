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
<body>
<%@include file="header.jsp"%>

</head>
<body style="background:#333;color:white;">
<div class="container" style="margin-top:100px;margin-left:400px;">
    <div class="row">
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        <strong>${name}</strong>
                        <br>
                        ${address}
                        <br/>
                         ${number}
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <p>
                        Receipt #: ${cartid}
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="text-center">
                    <h1>Receipt</h1>
                </div>
                </span>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>#</th>
                            <th class="text-center">Price</th>
                            <th class="text-center">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${cartlist}" var="cart">
                        <tr>
                            <td class="col-md-9"><em>${cart.product.productbrandname} ${cart.product.productname}</em></h4></td>
                            <td class="col-md-1" style="text-align: center">${cart.productCount }</td>
                            <td class="col-md-1 text-center">$${cart.product.price}</td>
                            <td class="col-md-1 text-center">$${cart.product.price}</td>
                        </tr>
                        </c:forEach>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
                            <td class="text-center text-danger"><h4><strong>$${grandtotal}</strong></h4></td>
                        </tr>
                    </tbody>
                </table>
                </td>
            </div>
        </div>
    </div>
</body>
</html>