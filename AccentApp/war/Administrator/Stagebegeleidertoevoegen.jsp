<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.appspot.accent.model.Administrator" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="../pageHeader.jsp">
	<jsp:param name="titel" value="Stagebegeleider toevoegen" />
</jsp:include> 

<%Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));%>

<!-- wrapper (content + menu) -->
<div class="wrapper">
	<div id="wrapper-menu">
		<div id ="menu">
			<ul>
				<li><a href="../Index.jsp">Home</a></li>
				<li><a href="lijstLeerlingen.jsp">Leerlingen Beheer</a></li>
				<li><a href="DoentenBeheer.jsp">Docenten Beheer</a></li>
				<li><a href="Stagebegeleidertoevoegen.jsp">Begeleider Beheer</a></li>
				<li><a href="AdminBeheer.jsp">Admin Beheer</a></li>
  				<li><a href="CompetentiesBeheer.jsp">Competenties Beheer </a></li>
 			</ul>
		</div>
	</div>
	<div id="wrapper-content">
		<div id ="content">
			<div id="lineup">
			
				<p>${message}</p>
				<form action="StagebegeleidertoevoegenServlet.do" method="POST">
				<p>1)<input type="text" name="username" placeholder="Gebruiksnaam"></p>
				<p>2)<input type="text" name="password" placeholder="Wachtwoord"></p>
			<!-- 	Stagebegeleider moet wel een bedrijf hebben dit moet nog doorgevoerd worden -->
				<p>3)<input type="text" name="bedrijf" placeholder="Bedrijf" ></p>
				<input type="submit" name="enter">
				
				</form>
				
			</div>
		</div>
	</div>
</div>

<jsp:include page="../pageFooter.jsp"></jsp:include>  