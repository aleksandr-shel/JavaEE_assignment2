<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Information</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
</head>
<body>
	<div class="container">
		<form action="/passenger/update" method="POST">
			<input type="hidden" name="custId" value="${account.custId }">
			<input type="text" name="firstname" value="${account.firstname }" required>
			<input type="text" name="lastname" value="${account.lastname }" required>
			<input type="text" name="lastname" value="${account.lastname }">
			<input type="text" name="lastname" value="${account.lastname }">
			<input type="text" name="lastname" value="${account.lastname }">
			<input type="text" name="lastname" value="${account.lastname }">
			<input type="text" name="lastname" value="${account.lastname }">
			<input type="text" name="lastname" value="${account.lastname }">
			<button type="submit">Update</button>
			<button type="button" onclick="location.href = '/account-page'">Cancel</button>
		</form>
	</div>
</body>
</html>