<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="../pageHeader.jsp">
	<jsp:param name="titel" value="Leerlingen Lijst" />
</jsp:include>        
<%@ page import="com.appspot.accent.model.Administrator" %>
<%@ page import="com.appspot.accent.model.CompetentieItem" %>
<%@ page import="com.appspot.accent.model.User" %>
<%@ page import="com.appspot.accent.dao.Dao"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%List<User> allUsers = Dao.INSTANCE.getAlleLeerlingen();%>
<link rel="stylesheet" href="/CSS/admin-style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/Scripts/admin-scripts.js"></script>

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
  				<li><a href="lijstLeerlingen.jsp">Leerlingen beheer</a>
  				
 			</ul>
		</div>
	</div>
	<div id="wrapper-content">
		<div id ="content">
			<div id="lineup">
			

				<p>${message}</p>		
			
			
<table id="table" >
  <tr>
      <th>Leerling naam </th>
      <th>Tools</th>
    </tr>

<% for (User ci : allUsers) {%>
<tr> 
<td>
<%=ci.getUsername()%>
</td>
<td>

<img src="../images/new.png" height="25px" width="25px" id="img" class="img">
<div id="popup_box">
	
	
	
	<div id="inputbox">
	<input type="text" class="ltf" placeholder="Leerling gebruiksnaam"><br>
	<input type="text" class="ltf" placeholder ="wachtwoord"><br>
	</div>
	
	<input type="button" id="button" name="enter" value="Toevoegen"> <input type="button" name="cancel" value="Annuleren" id="popcancel">
</div>

<form style="display:inline" action="LeerlingVerwijderenServlet.do?id=<%=ci.getId()%>" method="post">
<input type="image" src="../images/delete.png" height="25px" width="25px">
</form>
<form style="display:inline" action="LeerlingWijzigenServlet.do" method="post">
<input type="image" src="../images/edit.png" height="25px" width="25px">
</form>
</td>
<%} %>
</tr>
</table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../pageFooter.jsp"></jsp:include>  