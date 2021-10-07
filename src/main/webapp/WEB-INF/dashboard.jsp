
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>All Expenses</h1>
		<table class="table table-bordered">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Creator</th>
				<th>Version</th>
				<th>Created At</th>
				<th>Updated At</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="oneLanguage" items="${languages}">
				<tr>
					<td><c:out value="${oneLanguage.id}"></c:out></td>
					<td><a href="/view/${oneLanguage.id}"><c:out value="${oneLanguage.name}"></c:out></a></td>
					<td><c:out value="${oneLanguage.creator}"></c:out></td>
					<td><c:out value="${oneLanguage.version}"></c:out></td>
					<td><c:out value="${oneLanguage.createdAt}"></c:out></td>
					<td><c:out value="${oneLanguage.updatedAt}"></c:out></td>
					<td class="d-flex justify-content-around"><a href="/edit/${oneLanguage.id}">edit</a>
						<form action="/delete/${oneLanguage.id}" method="post">
							<input type="hidden" name="_method" value="delete"> <input
								type="submit" value="delete">
						</form></td>
				</tr>
			</c:forEach>
		</table>
	<form:form action="/create" method="post" modelAttribute="language">
			<div class="d-flex flex-column">
				<form:label path="name">Name</form:label>
				<form:errors path="name" />
				<form:input path="name" />
			</div>
			<div class="d-flex flex-column">
				<form:label path="creator">Creator</form:label>
				<form:errors path="creator" />
				<form:input path="creator" />
			</div>
			<div class="d-flex flex-column">
				<form:label path="version">Version</form:label>
				<form:errors path="version" />
				<form:input path="version" />
			</div>
			<input type="submit" value="Submit" />
		</form:form>
	</div>
</body>
</html>