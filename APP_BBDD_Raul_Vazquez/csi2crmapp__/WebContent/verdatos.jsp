<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="java.sql.SQLException"%>

<%
try {
	String aux=session.getAttribute("usuario").toString();
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}


beanDB db = new beanDB();
boolean okdb = false;
String resultado = "";

try {
	db.conectarBD();
	okdb = true;
} catch (Exception e) {
	e.printStackTrace();
}
if (okdb) {
/* 	String opcion=request.getParameter(tabla);
	 switch(opcion){
	 
	 } */
	String query="select id_cliente, nombre, apellidos from clientes";
	String [][] tablares = null;
	try {
		tablares = db.resConsultaSelectA3(query);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if (tablares != null) {
		
		resultado = "<table class=table table-striped table-dark style=background-color=#475d62>";
		for (int i=0; i<tablares.length;i++) { //g es una variable tipo grupo que va recorriendo la lista
			resultado += "<tr>";
			resultado += "<td>" + tablares[i][0] + "</td>";
			resultado += "<td>" + tablares[i][1] + "</td>";
			resultado += "<td>" + tablares[i][2] + "</td>";
			resultado += "</tr>";
		}
		resultado += "</table>";
		
	}
	db.desconectarBD();
}
else resultado = "No se pudo conectar con la BBDD.";


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
<h1><%=session.getAttribute("usuario") %>: Estos son los datos</h1>
<hr/>
<div class="login-dark" style=" height:30%;">
<form style="width:25%; ">
<p><a class="btn btn-primary btn-block" href="bienvenido.jsp">Página principal</a></p>
<p><a class="btn btn-primary btn-block" href="cerrarsesion.jsp">Salir</a></p>
</form>
</div>


<hr/>
<%=resultado %>
<div id="contenedor1">
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script> 
</body></html>