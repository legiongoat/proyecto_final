<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MEDICALIA</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
	<c:set var="tipo" value="paciente"></c:set>
	<c:if test="${sessionScope.rol ne tipo}">
		<jsp:forward page="noAutorizado.jsp"></jsp:forward>
	</c:if>

	<div class="container">
		<div class="text-center">
			<h1>PACIENTE</h1>
			<h3>${nombrePaciente }</h3>
		</div>
		<div class="form-group">
			<label for="usuario">Tratamientos:</label>
			<textarea class="form-control" rows="5" id="comment" >${datos }</textarea>
		</div>

		<button type="button" class="btn btn-warning"
			onclick="javascript:document.location='login.jsp'">volver</button>
	</div>
</body>
</html>