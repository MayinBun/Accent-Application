<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.appspot.accent.model.Administrator" %>
<%@ page import="com.appspot.accent.model.User" %>
<%@ page import="com.appspot.accent.model.Leerling" %>
<%@ page import="com.appspot.accent.model.User" %>
<%@ page import="java.util.ArrayList" %>

<jsp:include page="../pageHeader.jsp">
	<jsp:param name="titel" value="Mijnleerlingen" />
</jsp:include> 

	<%Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));%>
<head>
<script src="../Scripts/sorttable.js"></script>
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
					<form method="post" action="KoppelLeerlingAanDocentServlet.do">
			<table id="table"class="sortable"> 
  <tr>
      <th>ID</th>
      <th>Naam</th>
      <th>Begeleider</th>
      <th>Mijn leerling</th>
    </tr>

<% for(User u : admin.getAlleUsers()){	if(u instanceof Leerling){	%>
<tr> 
<td>
</td>
<td>
<%=u.getUsername()%>
</td>
<td>
</td>
<td>
<center><input type="checkbox" name="test" value="u.getUsername()"></center>
</td>
<%}} %>
</tr>
</table><br>
				
				
				
				
					</table><br>
					<input type="submit" value="Voeg leerling toe">
				</form>
			</div>
		</div>
	</div>
<jsp:include page="../pageFooter.jsp"></jsp:include>  
