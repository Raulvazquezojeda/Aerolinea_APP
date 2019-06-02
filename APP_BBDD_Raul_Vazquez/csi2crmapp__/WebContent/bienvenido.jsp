<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<head>
<% 
//aquí pongo todo el código java que quiera que mi servidor ejecute.
String usuario="";
boolean ok=false;
try {
	 usuario=session.getAttribute("usuario").toString();
	 ok=true;
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}

%><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bienvenido</title>
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
<body class="login-dark">
<% if (ok) { %>
<div>
<form>
<h1>Bienvenido <%=session.getAttribute("usuario") %></h1>
Sesión iniciada
<hr/>
<!-- <div class="form-group">
   <select class="custom-select" required name="modo" id="modo">
      <option value="">Seleccion tabla</option>
      <option value="fill">Aeropuerto</option>
      <option value="stroke">Clientes</option>
      <option value="stroke">Aviones</option>
      <option value="stroke">Cli_has_vuelos</option>
      <option value="stroke">Empleados</option>
      <option value="stroke">Vuelos</option>
   </select>
</div> -->
<a class="btn btn-primary btn-block" href="verdatos.jsp">Acceder a los Datos</a>
<a class="btn btn-primary btn-block" href="insertdatos.jsp">Insertar Datos</a>
<p><a class="btn btn-primary btn-block" href="updatedatos.jsp">Modificar Datos</a></p>
<a class="btn btn-primary btn-block"  href="cerrarsesion.jsp">Salir</a>
<% } else { 
	//AHORA PONGO EL HTML DE SESION INCORRECTA %>
<h1>Usuario y/o contraseña incorrectos.</h1>
Por favor, inténtelo de nuevo.<br/>
<a href="index.jsp">Volver</a>
<% } %>
</form>
</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script> 
</body>
</html>