<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mipk.beanDB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificar Datos</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
.login-dark {
  height:1000px;
  background:#475d62 url(img/star-sky.jpg);
  background-size:cover;
  position:relative;
}

.login-dark form {
  max-width:320px;
  width:90%;
  background-color:#1e2833;
  padding:40px;
  border-radius:4px;
  transform:translate(-50%, -50%);
  position:absolute;
  top:50%;
  left:50%;
  color:#fff;
  box-shadow:3px 3px 4px rgba(0,0,0,0.2);
}

.login-dark .illustration {
  text-align:center;
  padding:15px 0 20px;
  font-size:100px;
  color:#2980ef;
}

.login-dark form .form-control {
  background:none;
  border:none;
  border-bottom:1px solid #434a52;
  border-radius:0;
  box-shadow:none;
  outline:none;
  color:inherit;
}

.login-dark form .btn-primary {
  background:none;
  border:none;
  border-radius:4px;
  padding:11px;
  box-shadow:none;
  margin-top:26px;
  text-shadow:none;
  outline:none;
}

.login-dark form .btn-primary:hover, .login-dark form .btn-primary:active {
  background:#214a80;
  outline:none;
}

.login-dark form .forgot {
  display:block;
  text-align:center;
  font-size:12px;
  color:#6f7a85;
  opacity:0.9;
  text-decoration:none;
}

.login-dark form .forgot:hover, .login-dark form .forgot:active {
  opacity:1;
  text-decoration:none;
}

.login-dark form .btn-primary:active {
  transform:translateY(1px);
}
.form-group{
	background:none
}



</style>
<script type="text/javascript">
	function compruebayenvia() {
        datos = document.formulario;
        if (datos.id.value == '' ||
            datos.selectCampo.value == '' ||
            datos.valor.value == '')
            alert('¡Tiene que rellenar todos los campos!');
        else datos.submit();
    }
</script>
</head>
<body class="login-dark" style="color:white;">
<h1><%=session.getAttribute("usuario") %>: Aqui puede modificar los Clientes</h1>
<hr/>
<div class="login-dark" style=" height:35%;">

<form action="updatedatos.jsp" method="post" name="formulario" style="margin-top:5%;">
		<div class="form-group">
			<label for="id">ID Cliente</label> 
			<input type="text" class="form-control" id="id" name="id" placeholder="Introduzca el id del Cliente" >
		</div>
		<div class="form-group">
		<label for="campo">Seleccione el campo que desea modificar</label> 
			<select id="campo" name="selectCampo">
				<option value="DNI">DNI</option>
				<option value="nombre" selected>Nombre</option>
				<option value="apellidos">Apellidos</option>
				<option value="telefono">Telefono</option>
			</select>
		</div>
		<div class="form-group">
			<label for="valor">Nuevo valor</label> 
			<input type="text" class="form-control" id="valor" name="valor" placeholder="Introduzca el valor nuevo...">
		</div>
		<input class="btn btn-primary btn-block" name="send" value="Actualizar" onclick="compruebayenvia();"/>
		<a class="btn btn-primary btn-block" href="bienvenido.jsp">Página principal</a>
		<a class="btn btn-danger btn-block" href="cerrarsesion.jsp">Salir</a>
	</form>
</div>
<%
beanDB basededatos = new beanDB();			
String idMod = request.getParameter("id");
String campo = request.getParameter("selectCampo");
String valor = request.getParameter("valor");
if(valor != null && idMod != null && valor != null){
	 String queryUpdate = "update clientes set " + campo + "='" + valor + "' where id_cliente=" + idMod;
	 basededatos.update(queryUpdate);
}
String query="select * from clientes";
String [][] tablares = basededatos.resConsultaSelectA3(query);
%>
<table class="table" style="margin-top:10%;">
<%
	%>
	  <thead class="thead-dark">
		<tr>
	 		<th scope="col">idCliente</th>
			<th scope="col">Nombre</th>
	 		<th scope="col">Apellidos</th>
		</tr>
	</thead>
	<%
	for(int i = 0; i < tablares.length; i++) {
		%>
		<tr>
	 		<td> <%= tablares[i][0] %> </td>
	 		<td> <%= tablares[i][2] %> </td>
	 		<td> <%= tablares[i][3] %> </td>
	 	</tr> <% 	 
	}
%>
</table>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script> 
</body>
</html>
