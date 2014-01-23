<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.appspot.accent.model.Administrator" %>
<%@ page import="com.appspot.accent.model.CompetentieItem" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="../pageHeader.jsp">
	<jsp:param name="titel" value="Competenties wijzigen" />
</jsp:include> 

<%Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));%>


<!-- wrapper (content + menu) -->
<div class="wrapper">
	<div id="wrapper-menu">
		<div id ="menu">
			<ul>
				<li><a href="../Index.jsp">Home</a></li>
				<li><a href="Leerlingtoevoegen.jsp">Leerling toevoegen</a></li>
				<li><a href="Docenttoevoegen.jsp">Docent toevoegen</a></li>
				<li><a href="Stagebegeleidertoevoegen.jsp">Begeleider toevoegen</a></li>
				<li><a href="Competentiestoevoegen.jsp">Competentie toevoegen </a></li>
				<li><a href="Competentieswijzigen.jsp">Competentie wijzigen</a></li>
				<li><a href="Competentiesverwijderen.jsp">Competentie verwijderen</a></li>
 			</ul>
		</div>
	</div>
	<div id="wrapper-content">
		<div id ="content">
			<div id="lineup">
			
				<p>${message}</p>
				<form action="CompetentieWijzigenServlet.do" method="post">
				1) <select name="competentieitem" id="selectedCompetentie" onchange="displayResult(this)">
					<option value="" disabled selected>Selecteer competentie</option>
							
					<% for( CompetentieItem ci : admin.getAlleCompetentieItems())
					{ %>
					<option value="<%=ci.getItemNaam()%>"><%=ci.getItemNaam()%></option>
					<% } %>
					</select><br>

				<p>2) Geef nieuwe naamgeving:<input type="text" name="compnaam" id="val"size="30" /></p>
				<p>3) <input id="button" type="submit" name="button" value="Wijzigen"></p>
				</form>
				
			</div>
		</div>
	</div>
</div>
<jsp:include page="../pageFooter.jsp"></jsp:include>  