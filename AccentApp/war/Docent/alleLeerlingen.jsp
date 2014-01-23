<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.appspot.accent.model.Administrator" %>
<%@ page import="com.appspot.accent.model.User" %>
<%@ page import="com.appspot.accent.model.Leerling" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="../pageHeader.jsp">
	<jsp:param name="titel" value="Mijnleerlingen" />
</jsp:include> 

<%Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));%>
<head>
 <script type="text/javascript" src="//www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load('visualization', '1', {packages: ['table']});
    </script>
    <script type="text/javascript">
    function drawVisualization() {
      // TODO : Zorgen dat deze tabel met behulp van een arraylist wordt gevuld i.p.v hard-coded.
      var data = google.visualization.arrayToDataTable([
        ['Naam',  'Competenties'],
        ['Tong Ning mu',  true],
        ['Huang Ang fa',  false],
        ['Teng nu',  true]
      ]);
    
      // Create and draw the visualization.
      visualization = new google.visualization.Table(document.getElementById('tableLeerling'));
      visualization.draw(data, null);
    }
    

    google.setOnLoadCallback(drawVisualization);
    </script>
</head>
<!-- wrapper (content + menu) -->
<div class="wrapper">
	<div id="wrapper-menu">
		<div id ="menu">
			<ul>
				<li><a href="../Index.jsp">Home</a></li>
  				<li><a href="Mijnleerlingen.jsp">Mijn Leerlingen</a></li>
  				<li><a href="alleLeerlingen.jsp">Alle Leerlingen</a></li>
 			</ul>
		</div>
	</div>
	<div id="wrapper-content">
		<div id ="content">
		
		<div id ="lineup">
		
	<div id ="naasttabel" >
	<form action ="voegDocentLeerling.do" method="POST">
		<fieldset>
 			<legend><b>Voeg Leerling toe:</b></legend>
 			<p>Selecteer hieronder een leerling om die vervolgens<br>
 			 Aan uw eigen leerlingen toe te voegen</p>
				<form action="CompetentieWijzigenServlet.do" method="post">
				 <select name="leerling" id="leerling" onchange="displayResult(this)">
					<option value="" disabled selected>Selecteer Leerling</option>
							
					<% for( User ll : admin.getAlleUsers())
					{
						if (ll instanceof Leerling){%><!-- kijkt of het een Leerling is  -->
					<option value="<%=ll.getUsername()%>"><%=ll.getUsername()%></option>
					<% } }%>
					</select>
	
				<p> <input id="button" type="submit" name="button" value="Voeg Toe"></p>		</fieldset>
	</form>	
	</div>
	<!-- laat de table in  -->
    <div id="tableLeerling"></div>


		
			
	
		</div>
	</div>
</div>
<jsp:include page="../pageFooter.jsp"></jsp:include>  
