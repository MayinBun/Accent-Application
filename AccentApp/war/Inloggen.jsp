<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Getest met Chrome - Firefox - Internet Explorer -->
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/login-style.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">  </script>
<%@ page import="com.appspot.accent.controller.LoginServlet" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Accent Nijkerk</title>
</head>
<body>
<script>
$("#slideshow > div:gt(0)").hide();

setInterval(function() { 
  $('#slideshow > div:first')
    .fadeOut(1000)
    .next()
    .fadeIn(1000)
    .end()
    .appendTo('#slideshow');
},  3000);

setInterval(function(){$("#error").fadeToggle();}, 2000);
</script>

<!-- Top image -->

<div id="content-body-wrapper">
	<div id ="content-body">
	
			<div id="standaardlogo">
		<img id="logo" src="http://www.scholenmarktamersfoort.nl/nieuw/media/logos/logo_accent.jpg" alt="Accent-logo" width="200"height="80"/>
	</div>
	
	<!-- error message attribute wordt geSet vanuit servlet -->
	<div id="error">
			${error}
	</div>
	
<form action="LoginServlet.do" method="post">

<!-- Login inputvelden -->
	<div id="login-content">
			<input name="US" type="text" class="ltf" placeholder="Gebruiksnaam" value="${cookie.cUN.value}" required="required"><br>
			<input name="PW" type="password" class="ltf" placeholder="Wachtwoord" required="required"><br>
	</div>
	
<!-- Login Microsoft image & submit buton -->
	<div id="login-content-buttons">
		<select id="type" class="type" name="type">
		<option value="Leerling">Leerling</option>
		<option value="Docent">Docent</option>
		<option value="Stagebegeleider">Stagebegeleider</option>
		<option value="Administrator">Administrator</option>
		</select>	
		<input id="button" type="submit" name="button" value="Inloggen" > 
	</div>
</form>

</div>
	<div id ="slider-content">
	<div id="slideshow">
	<div>
   <img src="http://girlslivee.webklik.nl/user_files/2009_05/50180/School.SchoolisCool.SC1004.1.92x3.29.7051.jpg"width="240" height="240">
   </div>
   <div>
  <img src="http://www.ahshawkeye.com/uploads/3/8/6/2/3862975/7237488_orig.jpg"width="240" height="240">
   </div>
   <div>
      <img src="http://nlschoolistanbul.org/wp-content/uploads/2010/05/school-kids.gif"width="240" height="240">
   </div>
	
	</div>
</div>
</div>
</body>
</html>
