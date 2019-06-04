
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%
try {
	String aux=session.getAttribute("usuario").toString();
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}

%>
<html>
<head>
<title>Datos</title>
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
</head>
<body style="background-color:#1e2833; color:#fff;">
<%
String idCliente = request.getParameter("nombre");
String nombre;
String query1="select nombre, apellidos from clientes where id_cliente=" + idCliente;
beanDB basededatos = new beanDB();
String [][] tablares1 = basededatos.resConsultaSelectA3(query1);
nombre = tablares1[0][0] + " " + tablares1[0][1];

%>
<h1><%=session.getAttribute("usuario") %>: Estos son los datos</h1>
<hr/>
<div class="login-dark" style=" height:30%;">
<form style="width:25%; ">
<p><a class="btn btn-primary btn-block" href="bienvenido.jsp">Página principal</a></p>
<p><a class="btn btn-primary btn-block" href="cerrarsesion.jsp">Salir</a></p>
</form>
</div>
<% 
try{
String query="select tabla1.id_cli_has_vuelos, ciudad_origen, ciudad_destino from (select clientes_id, id_cli_has_vuelos, ciudad ciudad_origen from cli_has_vuelos join vuelos on (cli_has_vuelos.vuelos_id=vuelos.id_vuelo) join aeropuerto on(vuelos.origen_id=aeropuerto.id_aeropuerto)) tabla1 join (select id_cli_has_vuelos, ciudad ciudad_destino from cli_has_vuelos join vuelos on (cli_has_vuelos.vuelos_id=vuelos.id_vuelo) join aeropuerto on(vuelos.destino_id=aeropuerto.id_aeropuerto)) tabla2 on(tabla2.id_cli_has_vuelos=tabla1.id_cli_has_vuelos) where clientes_id=" + idCliente;
String [][] tablares = basededatos.resConsultaSelectA3(query);
%>
<hr/>
<table id="uno" class="table">
<%
	%>
	  <thead class="thead-dark">
		<tr>
	 		<th scope="col">id Compra</th>
			<th scope="col">Cuidad Origen</th>
	 		<th scope="col">Cuidad Destino</th>
		</tr>
	</thead>
	<%
	for(int i = 0; i < tablares.length; i++) {
		%>
		<tr>
	 		<td> <%= tablares[i][0] %> </td>
	 		<td> <%= tablares[i][1] %> </td>
	 		<td> <%= tablares[i][2] %> </td>
	 	</tr> <% 	 
	}
%>
</table>
<%
}
catch (NullPointerException e){
	%>
	<p>Este Cliente no ha comprado ningun vuelo todavia.<p>
<%
}
%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script> 
</body></html>