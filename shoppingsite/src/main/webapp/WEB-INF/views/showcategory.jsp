<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@include file="templates/navbar.jsp"%> --%>
<h1>Category</h1>
<hr />
<c:if test="${userclickededit==true}">
	<c:set var="url" value="UpdateCategory" />
</c:if>

<c:if test="${userclickededit!=true}">
	<c:set var="url" value="SaveCategory" />
</c:if>
<center>
	<form:form modelAttribute="category"
		action="${pageContext.request.contextPath}/${url}" method="post">
		<c:if test="${userclickededit==true}">
			<form:hidden path="CategoryID"/>
		</c:if>
		<form:input path="Categoryname" placeholder="categoryname" />
		<form:input path="Categorydesc" placeholder="categorydesc" />
		<c:if test="${userclickededit==true}">
			<input type="submit" value="Update Category" />
		</c:if>
		<c:if test="${userclickededit!=true}">
			<input type="submit" value="Save Category" />
		</c:if>
	</form:form>

	<table align="center" width="300">
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>DISCRIPTION</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${catlist}" var="cat">
				<tr>
					 <td>${cat.categoryID}</td>
					<td>${cat.categoryname}</td>
				    <td>${cat.categorydesc}</td>
					<td>
						<a href="${pageContext.request.contextPath}/editcat/${cat.categoryID}">Edit</a></td>
						<td>
						<a href="${pageContext.request.contextPath}/deletecat/${cat.categoryID}">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

</center>