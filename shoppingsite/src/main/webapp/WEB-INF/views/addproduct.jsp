<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1>product</h1>
<hr />
<c:if test="${userclickededit==true}">
	<c:set var="url" value="UpdateProduct" />
</c:if>

<c:if test="${userclickededit!=true}">
	<c:set var="url" value="SaveProduct" />
</c:if>
<center>
	<form:form enctype="multipart/form-data" modelAttribute="product"
		action="${pageContext.request.contextPath}/${url}" method="post">
		<c:if test="${userclickededit==true}">
			<form:hidden path="productID" />
		</c:if>
		<form:input path="productname" placeholder="productname" />
		<form:input path="productbrandname" placeholder="productbrandname" />
		<form:input path="productcolor" placeholder="productcolor" />
		<form:input path="productmaterial" placeholder="productmaterial" />
		<form:input path="price" placeholder="price" />
		<form:input path="stock" placeholder="stock" />
		<form:input path="productdetails" placeholder="productdetails" />
		<form:select path="categoryID" items="${catlist}" 
		itemLabel="categoryname" 
		itemValue="categoryID">
		
		
		
		</form:select>
		<input type="file" name="file1"/>
		<input type="file" name="file2"/>
		<input type="file" name="file3"/>

		<c:if test="${userclickededit==true}">
			<input type="submit" value="Update product" />
		</c:if>
		<c:if test="${userclickededit!=true}">
			<input type="submit" value="Save product" />
		</c:if>
	</form:form>

	<table align="center" width="300">
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>DISCRIPTION</th>
				<th>BRAND NAME</th>
				<th>COLOR</th>
				<th>MATERIAL</th>
				<th>PRICE</th>
				<th>IMAGE</th>
				<th>STOCK</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productlist}" var="product">
				<tr>
					<td>${product.productID}</td>
					<td>${product.productname}</td>
					<td>${product.productdetails}</td>
					<td>${product.productbrandname}</td>
					<td>${product.productcolor}</td>
					<td>${product.productmaterial}</td>
					<td>${product.price}</td>
					<td><img src="resources/IMAGES/${product.code}/1.jpg" height="200px" width="200px"></td>
					<td><img src="resources/IMAGES/${product.code}/2.jpg" height="200px" width="200px"></td>
					<td><img src="resources/IMAGES/${product.code}/3.jpg" height="200px" width="200px"></td>
					<td>${product.stock}</td>
					<td><a
						href="${pageContext.request.contextPath}/editproduct/${product.productID}">Edit</a></td>
						<td><a
						href="${pageContext.request.contextPath}/deleteproduct/${product.productID}">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

</center>