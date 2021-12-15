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
<script type="text/javascript">
compruebaDatos=()=>{
let usuario=document.querySelector("#usuario");
let clave=document.querySelector("#clave");
let verificacion=document.querySelector("#verificacion");
document.querySelector("#error").innerHTML="";
if (usuario.value==""){
		verificacion.innerHTML="El usuario no puede estar vacio";
		return;
	}
	if (clave.value==""){
		verificacion.innerHTML="La clave no puede estar vacia";
		return;
	}
	document.forms[0].submit();
}

volver=()=>document.location="/medicalia/"
</script>

</head>
<body>
	<div class="container">
		<div class="text-center">
			<h1>REGISTRO</h1>
		</div>
		<form action="ServletRegistro" method="post">
			<div class="form-group">
				<label for="email">Usuario:</label> <input type="text"
					class="form-control" placeholder="Introduce usuario" id="usuario"
					name="usuario">
			</div>
			<div class="form-group">
				<label for="pwd">Clave:</label> <input type="password"
					class="form-control" placeholder="Introduce clave" id="clave"
					name="clave">
			</div>
			<div class="form-group">
				<label for="pwd">Nombre:</label> <input type="text"
					class="form-control" placeholder="Introduce nombre" id="nombre"
					name="nombre">
			</div>
			<div class="form-group">
				<label for="pwd">Apellidos:</label> <input type="text"
					class="form-control" placeholder="Introduce apellidos"
					id="apellidos" name="apellidos">
			</div>
			<label for="tipo">Tipo de usuario:</label> <select
				class="form-control" id="tipo" name="tipo">
				<option value="0">Selecciona opcion...</option>
				<option value="1">Medico</option>
				<option value="2">Enfermero</option>
				<option value="3">Paciente</option>
			</select>

			<button type="button" class="btn btn-primary"
				onclick="compruebaDatos()">registrar</button>
			<button type="button" class="btn btn-warning" onclick="volver()">volver</button>
		</form>
		<h3 class="text-warning" id="verificacion"></h3>
		<h3 class="text-danger" id="error">
			<%
			if (request.getParameter("error") != null) {
			%>
			<%=request.getParameter("error")%></h3>
		<%
		}
		%>
		<h3 class="text-success" id="resultado">
			<%
			if (request.getParameter("resultado") != null) {
			%>
			<%=request.getParameter("resultado")%>
			<%
			}
			%>
		</h3>
	</div>

</body>
</html>