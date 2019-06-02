
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mi Primer Formulario</title>
<style type="text/css">
	.inputgris {
		border: none; 
		background-color: #DFDFDF;
		color: red;
	}
</style>
<script type="text/javascript">
function compruebayenvia() {
	datos=document.iniciosesion;
	if (datos.usuario.value == '' ||
			datos.pass.value == '')
		alert ('¡Tiene que rellenar todos los campos!');
	else datos.submit();
}
function compruebanums(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (keycode < 48 || keycode > 57) //Rango ASCII de números
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir números ');
			return false;
		}
		else return true;
	}
	else return true;
}
function compruebaalfan(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (( keycode < 48 || keycode > 57 ) && ( keycode < 64 || keycode > 90 ) && ( keycode < 97 || keycode > 122 )) //Rango ASCII de números y letras
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir letras y números ');
			return false;
		}
		else return true;
	}
	else return true;
}
</script>
</head>
<body style="font-family: sans-serif; font-size: 10pt; background-color: #FAFAFA;">

 <h1>Iniciar Sesión</h1>
<form action="./LoginAuthenticator" method="post" name="iniciosesion"/>
<table style="text-align: left; border: none;">
<tr><td>
<input type="hidden" name="varoculta" value="secreto"/>
Usuario:
	</td><td><input type="text" name="usuario" onkeypress="return compruebaalfan(this,event);" maxlength="10" value="" class="inputgris"/>
</td></tr><tr><td>Contraseña:
	</td><td><input type="password" name="pass" onkeypress="return compruebaalfan(this,event);" maxlength="8" value="" class="inputgris"/>
</td></tr><tr><td>
	</td><td style="text-align: right;">
		<input type="button" name="send" value="Enviar" onclick="compruebayenvia();"/>
</td></tr></table>
</form>
</body>
</html>  --%>

 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Mi primer Formulario</title>
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
	datos=document.iniciosesion;
	if (datos.usuario.value == '' ||
			datos.pass.value == '')
		alert ('¡Tiene que rellenar todos los campos!');
	else datos.submit();
}
function compruebanums(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (keycode < 48 || keycode > 57) //Rango ASCII de números
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir números ');
			return false;
		}
		else return true;
	}
	else return true;
}
function compruebaalfan(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (( keycode < 48 || keycode > 57 ) && ( keycode < 64 || keycode > 90 ) && ( keycode < 97 || keycode > 122 )) //Rango ASCII de números y letras
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir letras y números ');
			return false;
		}
		else return true;
	}
	else return true;
}
</script>
</head>


<body>
    <div class="login-dark">
        <form action="./LoginAuthenticator" name="iniciosesion" method="post">
            <h2 class="sr-only">Iniciar Sesión</h2>
            <input type="hidden" name="varoculta" value="secreto"/> 
            <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
            <input class="form-control" type="text" name="usuario" onkeypress="return compruebaalfan(this,event);"
            placeholder="usuario"
             maxlength="10">
            <input class="form-control" type="password" name="pass" onkeypress="return compruebaalfan(this,event);"
            placeholder="contraseña"
             maxlength="8">
            <button class="btn btn-primary btn-block" value="enviar" name="send" type="button" onclick="compruebayenvia();">Enviar</button>
                      
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script> 
</body>