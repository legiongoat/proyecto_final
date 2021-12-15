<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MEDICALIA</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<c:set var="tipo" value="sanitario"></c:set>
	<c:if test="${sessionScope.rol ne tipo}">
		<jsp:forward page="noAutorizado.jsp"></jsp:forward>
	</c:if>

	<div class="container">
		<div class="text-center">
			<h1>ENFERMERO</h1>
		</div>


		<form action="ServletMedicina" method="post">
			<div class="form-group">
				<label for="usuario"><h2>Medicamento:</h2></label> <input type="text"
					class="form-control" placeholder="Introduce medicamento"
					id="medicamento" list="medicinas"
					 name="nombre"
					onchange="javascript:document.forms[0].submit()" >
				<datalist id="medicinas">
					<c:forEach items="${medicinas}" var="nombre">
						<option value="${nombre }">
					</c:forEach>
				</datalist>
			</div>
			<h4>Nombre medicamento : ${medicamento.nombreMedicamento}</h4>
			<br/>
			<h4>Tipo medicamento : ${medicamento.tipoMedicamento}</h4>
			<div class="form-group">
			<br/>
				<a href="#generalidades" class="btn btn-primary"
					data-toggle="collapse">Generalidades </a>
				<div id="generalidades" class="collapse">
					<textarea class="form-control" rows="5" id="comment"
						disabled="true">${medicamento.generalidades }</textarea>
				</div>
			</div>
			<div class="form-group">
				<a href="#indicaciones" class="btn btn-primary"
					data-toggle="collapse">Indicaciones </a>
				<div id="indicaciones" class="collapse">
					<textarea class="form-control" rows="5" id="comment"
						disabled="true">${medicamento.indicaciones }</textarea>
				</div>
			</div>
			<div class="form-group">
				<a href="#cuidados" class="btn btn-primary" data-toggle="collapse">Cuidados
				</a>
				<div id="cuidados" class="collapse">
					<textarea class="form-control" rows="5" id="comment"
						disabled="true">${medicamento.cuidados }</textarea>
				</div>
			</div>
			<div class="form-group">
				<a href="#ram" class="btn btn-primary" data-toggle="collapse">Ram
				</a>
				<div id="ram" class="collapse">
					<textarea class="form-control" rows="5" id="comment"
						disabled="true">${medicamento.ram }</textarea>
				</div>
			</div>
			
			<div>
			
			</div>
			<a href="${medicamento.linkFichaTecnica}" class="btn btn-danger" target="_new">Ficha técnica</a>
			<button type="button" class="btn btn-warning"
				onclick="javascript:document.location='login.jsp'">Salir</button>

		</form>
		<h3 class="text-danger" id="error">${error}</h3>
	</div>
</body>
</html>