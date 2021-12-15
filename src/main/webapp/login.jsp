<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
</script>

</head>
<body>
	<div class="container">

		<form action="ServletController" method="post">
			<div class="form-group">
				<label for="email">Usuario:</label> <input type="text"
					class="form-control" placeholder="Introduce usuario" id="usuario" name="usuario">
			</div>
			<div class="form-group">
				<label for="pwd">Clave:</label> <input type="password"
					class="form-control" placeholder="Introduce clave" id="clave" name="clave">
			</div>
			<button type="button" class="btn btn-primary"
				onclick="compruebaDatos()">Entrar</button>
				<button type="button" class="btn btn-warning"
				onclick="javascript:document.location='registro.jsp'">Registro</button>
		</form>
		
		<h3 class="text-warning" id="verificacion"></h3>
		<h3 class="text-danger" id="error">
		${error}
		</h3>
		
	</div>

</body>
</html>