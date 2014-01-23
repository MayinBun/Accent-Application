<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.appspot.accent.model.Administrator" %>
<%@ page import="com.appspot.accent.model.CompetentieItem" %>
<%@ page import="java.util.ArrayList" %>
    <%Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));%>
<jsp:include page="../pageHeader.jsp">
	<jsp:param name="titel" value="Competenties overzicht" />
</jsp:include> 

<!-- wrapper (content + menu) -->
<div class="wrapper">
	<div id="wrapper-menu">
		<div id ="menu">
			<ul>
				<li><a href="../Index.jsp">Home</a></li>
  				<li><a href="Competentiesleerling.jsp">Competenties invullen </a></li>
  				<li><a href="Competentiesoverzicht.jsp">Voortgang</a></li>
 			</ul>
		</div>
	</div>
	<div id="wrapper-content">
		<div id ="content">
			<div id ="lineup">
						
				<form action="CompetentieWijzigenServlet.do" method="post">
				 <p  id="selectedCompetentie" >
					 	
					<!-- door het gebruik van een for loop doorloop je alle competenties , daaraan moet hij een slider + waarde hieraan meegeven , dit gebeurt nu alleen nog maar bij 
					de eerste waarde uit de arraylist.  -->		
					<% for( CompetentieItem ci : admin.getAlleCompetentieItems())
					{ %>
					<%=ci.getItemNaam()%> 
					<% System.out.println(ci);%>
					
		<span id="range8">  <a id="kleiner" href="grafiekleerling.jsp">grafiek</a></span></p> 
				
					 
					<br>
				
					<% } %>
					
					</p><br>
					
				</form>
				
			</div>
			<p>
			<input type="submit" name="knop" id="knopcomp"value="Voeg Toe" />
		</div>
	</div>
</div>

<jsp:include page="../pageFooter.jsp"></jsp:include>  
