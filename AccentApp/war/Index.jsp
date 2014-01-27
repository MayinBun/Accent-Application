<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.appspot.accent.controller.SessionCounterListener"%>
    <%@ page import="com.appspot.accent.model.Administrator" %>
    <%@ page import="com.appspot.accent.model.User" %>
    <%@ page import="com.appspot.accent.model.Leerling" %>
    <%@ page import="com.appspot.accent.model.Docent" %>
    <%@ page import="com.appspot.accent.model.Stagebegeleider" %>
    <%@ page import="com.appspot.accent.controller.LoginServlet"%>
<jsp:include page="IndexHeader.jsp">
	<jsp:param name="titel" value="Homepage" />
</jsp:include> 
<%User user =(User)request.getSession().getAttribute("userobject");%>
				<% if(user instanceof Administrator){ %>			
				<!-- wrapper (content + menu) -->
				<div class="wrapper">
					<div id="wrapper-menu">
						<div id ="menu">
							<ul>
								<li><a href="Index.jsp">Home</a></li>
								<li><a href="Administrator/Leerlingtoevoegen.jsp">Leerling toevoegen</a></li>
								<li><a href="Administrator/Docenttoevoegen.jsp">Docent toevoegen</a></li>
								<li><a href="Administrator/Stagebegeleidertoevoegen.jsp">Begeleider toevoegen</a></li>
				  				<li><a href="Administrator/Competentiestoevoegen.jsp">Competentie toevoegen </a></li>
				  				<li><a href="Administrator/Competentieswijzigen.jsp">Competentie wijzigen</a></li>
				  				<li><a href="Administrator/Competentiesverwijderen.jsp">Competentie verwijderen</a></li>
				  				<li><a href="Administrator/lijstLeerlingen.jsp">Leerlingen beheer</a></li>
				 			</ul>
						</div>
					</div>
					<div id="wrapper-content">
						<div id ="content">
						<div id = "adminindex">
						<div id="title"><h3>Dashboard:<h3> </div><br>
						<script type="text/javascript" src="//www.google.com/jsapi"></script>
						<script type="text/javascript">google.load('visualization', '1', {packages: ['corechart']});</script>
						 <script type="text/javascript">
					      function drawVisualization() {
					        // Create and populate the data table.
					        var data = google.visualization.arrayToDataTable([
					          ['logins', 'aantal'],
					          ['Succesvol', <%= LoginServlet.getCorrectLogin() %>],
					          ['Niet succesvol', <%= LoginServlet.getErrorLogin() %>],
					       
					        ]);
					      // test
					        // Create and draw the visualization.
					        new google.visualization.PieChart(document.getElementById('visualization')).
					            draw(data, {title:"Overzicht inlogpogingen" ,is3D: true, colors:['#28e351','#e00e41']});
					      }
					      
					
					      google.setOnLoadCallback(drawVisualization);
					    </script>
							 <div id="visualization" style="width: 600px; height: 400px;"></div>				 
						</div>
							
						</div>
					
					</div>
				</div>
			<%}%>
			
			
			
			 <%if (user instanceof Leerling) {%>			
				<!-- wrapper (content + menu) -->
				<div class="wrapper">
					<div id="wrapper-menu">
						<div id="menu">
							<ul>
								<li><a href="Index.jsp">Home</a></li>
								<li><a href="Leerling/Competentiesleerling.jsp">Competenties invullen </a></li>
								<li><a href="Leerling/Competentiesoverzicht.jsp">Voortgang</a></li>
							</ul>
						</div>
					</div>
					<div id="wrapper-content">
						<div id="content"></div>
						<!-- hierin kan nog content komen voor de index  -->
					</div>
				</div>
				<%}%>
				
			<%if (user instanceof Docent) {%>			
				<!-- wrapper (content + menu) -->
				<div class="wrapper">
					<div id="wrapper-menu">
						<div id ="menu">
							<ul>
								<li><a href="Index.jsp">Home</a></li>
								<li><a href="Docent/Mijnleerlingen.jsp">Mijn Leerlingen </a></li>
								<li><a href="Docent/lijstLeerlingen.jsp">Alle Leerlingen </a></li>
				 			</ul>
						</div>
					</div>
					<div id="wrapper-content">
						<div id ="content">
				 				<!-- hierin kan nog content komen voor de index  -->
						
						</div>
					</div>
				</div>
			<%}%>
				
			<%if (user instanceof Stagebegeleider) {%>			
				<!-- wrapper (content + menu) -->
				<div class="wrapper">
					<div id="wrapper-menu">
						<div id ="menu">
							<ul>
							<li><a href="Index.jsp">Home</a></li>
								<li><a href="Stagebegeleider/Competentiesleerling.jsp">Competenties invullen </a></li>
								<li><a href="Stagebegeleider/Competentiesoverzicht.jsp">Voortgang</a></li>
				 			</ul>
						</div>
					</div>
					<div id="wrapper-content">
						<div id ="content">
				 				<!-- hierin kan nog content komen voor de index  -->
						
						</div>
					</div>
				</div>
			<%}%>

</body>
</html>
