<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.appspot.accent.controller.SessionCounterListener"%>
    <%@ page import="com.appspot.accent.model.Administrator" %>
    <%@ page import="com.appspot.accent.model.User" %>
    <%@ page import="com.appspot.accent.model.Leerling" %>
    <%@ page import="com.appspot.accent.model.Docent" %>
    <%@ page import="com.appspot.accent.model.Stagebegeleider" %>
    <%@ page import="com.appspot.accent.model.Competentie" %>
    <%@ page import="com.appspot.accent.controller.LoginServlet"%>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.appspot.accent.dao.Dao"%>
    <%List<User> Leerlingen = Dao.INSTANCE.getAlleLeerlingen();%>
      <%List<User> Docenten = Dao.INSTANCE.getAlleDocenten();%>
      <%List<User> Stagebegeleider = Dao.INSTANCE.getAlleBegeleiders();%>
      <%List<User> Administrator = Dao.INSTANCE.getAlleAdmins(); %>
      <%Object obj = getServletContext().getAttribute("bcompetenties"); 
      	ArrayList<Competentie>bcomps = (ArrayList<Competentie>)obj;%>
      <%Object obj2 = getServletContext().getAttribute("names"); 
      	ArrayList<String>names = (ArrayList<String>)obj2;%>
      	<%Object obj3 = getServletContext().getAttribute("average"); 
      	ArrayList<Integer>average = (ArrayList<Integer>)obj3;%>
      <%String lresult = (String)getServletContext().getAttribute("resultl"); %>
      <%String dresult = (String)getServletContext().getAttribute("resultd"); %>
      <%String sresult = (String)getServletContext().getAttribute("results"); %>

<jsp:include page="IndexHeader.jsp">
	<jsp:param name="titel" value="Homepage" />
</jsp:include> 
<link rel="stylesheet" type="text/css" href="../CSS/content-style.css">
<%User user =(User)request.getSession().getAttribute("userobject");%>
				<% if(user instanceof Administrator){ %>			
				<!-- wrapper (content + menu) -->
				<div class="wrapper">
					<div id="wrapper-menu">
						<div id ="menu">
							<ul>
								<li><a href="Index.jsp">Home</a></li>
								<li><a href="Administrator/LeerlingenBeheer.jsp">Leerlingen Beheer</a></li>
								<li><a href="Administrator/DocentenBeheer.jsp">Docenten Beheer</a></li>
								<li><a href="Administrator/BegeleiderBeheer.jsp">Begeleider Beheer</a></li>
								<li><a href="Administrator/AdminBeheer.jsp">Admin Beheer</a></li>
				  				<li><a href="Administrator/CompetentiesBeheer.jsp">Competenties Beheer</a></li>
				 			</ul>
						</div>
					</div>
					<div id="wrapper-content">
						<div id ="content">
						<div id = "adminindex">
						<div id="title"><h3>Dashboard:<h3> </div><br>
						
							<!-- Google Pie chart 		 -->
							 <script type="text/javascript" src="//www.google.com/jsapi"></script>
			   				 <script type="text/javascript">
			   				 
			    			  google.load('visualization', '1', {packages: ['corechart']});
			   				 </script>
			   				 <script type="text/javascript">
			   		
			   		      

						      function drawVisualization() {
						        // Create and populate the data table.
						        var data = google.visualization.arrayToDataTable([
						          ['logins', 'aantal'],
						          ['Succesvol', <%= LoginServlet.getCorrectLogin() %>],
						          ['Niet succesvol', <%= LoginServlet.getErrorLogin() %>],
						       
						        ]);
						      
						        // Create and draw the visualization.
						        new google.visualization.PieChart(document.getElementById('visualization')).
						            draw(data, {title:"Overzicht inlogpogingen" ,is3D: true, colors:['#28e351','#e00e41']});
						      }

						      google.setOnLoadCallback(drawVisualization);
						    </script>
					
						  
						    <div id="grafiekpositie">
						    <div id="visualization" style="width: 500px; height: 300px;"></div>
						    </div>
						    <br></br>
						    <script type="text/javascript" src="//www.google.com/jsapi"></script>
			   				 <script type="text/javascript">
			   				 
			    			  google.load('visualization', '1', {packages: ['corechart']});
			   				 </script>
			   				 <script type="text/javascript">
			   		

			   			     function drawVisualization() {
			   			        var wrapper = new google.visualization.ChartWrapper({
			   			          chartType: 'ColumnChart',
			   			          dataTable: [['', 'Leerling', 'Docent', 'StageBegeleider', 'Administrator'],
			   			                      ['',  <%=Leerlingen.size() %>,<%=Docenten.size() %>,<%=Stagebegeleider.size() %>,<%=Administrator.size() %>]],
			   			          options: {'title': 'Soorten Gebruikers'},
			   			          containerId: 'visualization2'
			   			        });
			   			        wrapper.draw();
			   			      }
			   			      

			   			      google.setOnLoadCallback(drawVisualization);
						    </script>
					
						  
						  	<div id="grafiekpositie2">
						    <div id="visualization2" style="width: 500px; height: 300px;"></div>
						    </div>
				 
						</div>
							
						</div>
					
					</div>
				</div>
			<%}%>
			
			
			
			 <%if (user instanceof Leerling) {%>	
			 <%Leerling l =(Leerling)request.getSession().getAttribute("userobject");%>		
				<!-- wrapper (content + menu) -->
				<div class="wrapper">
					<div id="wrapper-menu">
						<div id="menu">
							<ul>
								<li><a href="Index.jsp">Home</a></li>
								<li><a href="Leerling/Competentiesleerling.jsp">Competenties invullen </a></li>
								<li><a href="Leerling/competentielijst.jsp">Competentie lijst </a></li>
							</ul>
						</div>
					</div>
					<div id="wrapper-content">
						<div id="content">
						<div id="title" style="margin-left:50px"><h3>Overzicht:<h3> </div>
						<p>${total}<br> ${names} <br> ${average}</p>
						<script type="text/javascript" src="//www.google.com/jsapi"></script>
			   				<script type="text/javascript">
			   				 
			    			  google.load('visualization', '1', {packages: ['corechart']});
			   				 </script>
			   				 <%if (lresult != null){ %>
			   				 
			   				
			   				 <script type="text/javascript">
			   			     function drawVisualization() {
			   			        var wrapper = new google.visualization.ChartWrapper({
			   			        	
			   			          chartType: 'ColumnChart',
			   			          dataTable: [['', ${resultl}],
			   			                      ['', ${valuel}]],
			   			          options: {'title': '${LoggedUser}','legend':'bottom'},
			   			          legend:'bottom',
			   			          containerId: 'visualization4'
			   			          
			   			        });
			   			        
			   			        wrapper.draw();
			   			      }
			   			      

			   			      google.setOnLoadCallback(drawVisualization);
			   			      <%}%>
						    </script>
						    
						    <script type="text/javascript">
			   				<%if (dresult != null){%>
							
			   			     function drawVisualization() {
			   			        var wrapper = new google.visualization.ChartWrapper({
			   			          chartType: 'ColumnChart',
			   			          dataTable: [['', ${resultd}],
			   			                      ['', ${valued}]],
			   			          options: {'title': 'docent','legend':'bottom'},
			   			          containerId: 'visualization5'
			   			        });
			   			        wrapper.draw();
			   			      }
			   			      

			   			      google.setOnLoadCallback(drawVisualization);
			   			      <%}%>
						    </script>
						    
						    <script type="text/javascript">
			   		
							<%if(sresult != null){%>
			   			     function drawVisualization() {
			   			        var wrapper = new google.visualization.ChartWrapper({
			   			          chartType: 'ColumnChart',
			   			          dataTable: [['', ${results}],
			   			                      ['', ${values}]],
			   			          options: {'title': 'begeleider','legend':'bottom' 'pointSize: 5'},
			   			          containerId: 'visualization6'
			   			        });
			   			        wrapper.draw();
			   			      }
			   			      

			   			      google.setOnLoadCallback(drawVisualization);
			   			      <%}%>
						    </script>
						    
						    
						    <div id="visualization4" style="width: 400px; height: 300px;margin-left:10px; margin-top:50px;  position:absolute;"></div>
						    <div id="visualization5" style="width: 400px; height: 300px;margin-left:375px; margin-top:50px; position:absolute;"></div>
							<div id="visualization6" style="width: 400px; height: 300px;margin-left:740px; margin-top:50px; position:absolute;"></div>
						</div>
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
								<li><a href="Docent/lijstLeerlingen.jsp">Alle leerlingen </a></li>
								<li><a href="Docent/mijnLeerlingen.jsp">Mijn leerlingen</a></li>
								<li><a href="Docent/Competentiesleerling.jsp">Leerling Beoordelen </a></li>
								<li><a href="Docent/nieuwelijst.jsp">Nieuwe lijst</a></li>
				 			</ul>
						</div>
					</div>
					<div id="wrapper-content">
						<div id ="content">
						<div id="title" style="margin-left:50px"><h3>Overzicht:<h3> </div>
						 <%
			   				 String aver = "";
			   				 String namez = "";
			   				 for(String s : names){
			   					 namez += "'"+s+"'"+",";
			   				 }
			   				
			   				for(int avg : average){
			   					aver += avg+",";
			   				}
			   				request.setAttribute("namez", namez);
			   				request.setAttribute("aver", aver);
			   					 %>
				 				<script type="text/javascript" src="//www.google.com/jsapi"></script>
				 			 	<script type="text/javascript">
			    			  		google.load('visualization', '1', {packages: ['corechart']});
			   				 	</script>
			   			
						     <script type="text/javascript">
						    
			   			     function drawVisualization() {
			   			        var wrapper = new google.visualization.ChartWrapper({
			   			          chartType: 'ColumnChart',
			   			          dataTable: [['', ${namez}],
			   			                      ['', ${aver}]],
			   			          options: {'title': 'Average Score','legend':'bottom'},
			   			          containerId: 'dvis1'
			   			        });
			   			        wrapper.draw();
			   			      }
			   			      

			   			      google.setOnLoadCallback(drawVisualization);
			   			      
						    </script>
						    
						    
						    
						    <div id="dvis1" style="width: 750px; height: 300px; margin-left:10px; margin-top:50px;  position:absolute;"></div>
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
								<li><a href="Stagebegeleider/Competentiesleerling.jsp">Stagiair Beoordelen </a></li>
				 			</ul>
						</div>
					</div>
					<div id="wrapper-content">
						<div id ="content">
				 			<div id="title" style="margin-left:50px"><h3>Overzicht:<h3> </div>
				 			<script type="text/javascript" src="//www.google.com/jsapi"></script>
			   				<script type="text/javascript">
			   				 
			    			  google.load('visualization', '1', {packages: ['corechart']});
			   				 </script>
			   				 <script type="text/javascript">
			   			
							<%if(sresult != null){%>
			   			     function drawVisualization() {
			   			        var wrapper = new google.visualization.ChartWrapper({
			   			          chartType: 'ColumnChart',
			   			          dataTable: [['', ${results}],
			   			                      ['', ${values}]],
			   			          options: {'title': '${LoggedUser}'},
			   			          containerId: 'svis1'
			   			        });
			   			        wrapper.draw();
			   			      }
			   			      

			   			      google.setOnLoadCallback(drawVisualization);
			   			      <%}%>
						    </script>
						    
						    <script type="text/javascript">
						    <%if(lresult != null){%>
			   			     function drawVisualization() {
			   			        var wrapper = new google.visualization.ChartWrapper({
			   			          chartType: 'ColumnChart',
			   			          dataTable: [['', ${resultl}],
			   			                      ['', ${valuel}]],
			   			          options: {'title': 'leerling','legend':'bottom'},
			   			          legend:'bottom',
			   			          containerId: 'svis2'
			   			        });
			   			        wrapper.draw();
			   			      }
			   			      

			   			      google.setOnLoadCallback(drawVisualization);
			   			      <%}%>
						    </script>
					
						    <div id="svis1" style="width: 500px; margin-top:50px; height: 300px;margin-left:10px; position:absolute;"></div>
						    <div id="svis2" style="width: 500px; margin-top:50px; height: 300px;margin-left:375px;position:absolute;"></div>
				
						
						</div>
					</div>
				</div>
			<%}%>

</body>
</html>
