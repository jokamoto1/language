
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
		<h1>Edit Language</h1>
		<a href="/">Back</a>
		<form:form action="/edits/${oneLanguage.id}" method="post"
			modelAttribute="language">
			<div class="d-flex flex-column">
				<form:label path="name">Language Name</form:label>
				<form:errors path="name" />
				<form:input path="name" value="${oneLanguage.name}" />
			</div>
			<div class="d-flex flex-column">
				<form:label path="creator">Creator</form:label>
				<form:errors path="creator" />
				<form:input path="creator" value="${oneLanguage.creator }" />
			</div>
			<div class="d-flex flex-column">
				<form:label path="version">Version</form:label>
				<form:errors path="version" />
				<form:input path="version" value="${oneLanguage.version }" />
			</div>
			<input type="submit" value="Submit" />
		</form:form>

	</div>
</body>
</html>