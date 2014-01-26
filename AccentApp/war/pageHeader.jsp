<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% Object o = request.getSession().getAttribute("LoggedUser");%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../CSS/content-style.css">
<!--  Naamgeving voor de jsp paginas -->
<title>${param.titel} - Accent</title>
</head>
<body>

<!-- top design -->
<div class="header">
	<div id="header-logo">
		<img id="accentlogo" src="../images/accentlogo.png">
	</div>
	<div id="header-banner">
		<i class="breakline"></i>
			<div class="userinfo">
				<h4 class="username">
					<!-- Tonen van naam van ingelogde user -->
					<%if(o != null){ %>
					Welkom ${LoggedUser}<br><br>
					<form action="../LogoutServlet.do" method = "post">
					<input id="button" type="submit" name="uitloggen" value="Uitloggen" onclick="submit()">
					<%}%>
					</form>
					
					<%if(o == null){ %>
					<input id="button" type="submit" value="Inloggen" onclick="location.href='Inloggen.jsp'"><br/>
					<%}%>
					
				</h4><br>
			</div>
	</div>	
</div>