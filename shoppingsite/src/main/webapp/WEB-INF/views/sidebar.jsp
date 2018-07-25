<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!-- Side navigation -->
<div class="sidenav">
  <c:forEach items="${catlist}" var="catlist">
  <a href="#">${catlist.categoryname}</a>
  </c:forEach>
</div>

<!-- Page content -->
<div class="main">
  ...
</div> 