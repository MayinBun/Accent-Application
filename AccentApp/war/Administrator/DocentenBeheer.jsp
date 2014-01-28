<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="../pageHeader.jsp">
	<jsp:param name="titel" value="Docenten Beheer" />
</jsp:include>        
<%@ page import="com.appspot.accent.model.Administrator" %>
<%@ page import="com.appspot.accent.model.CompetentieItem" %>
<%@ page import="com.appspot.accent.model.User" %>
<%@ page import="com.appspot.accent.dao.Dao"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%List<User> allUsers = Dao.INSTANCE.getAlleDocenten();%>
<link rel="stylesheet" href="/CSS/admin-style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="http://tablesorter.com/addons/pager/jquery.tablesorter.pager.js"></script>
<script src="/Scripts/admin-scripts.js"></script>

<!-- wrapper (content + menu) -->
<div class="wrapper">
	<div id="wrapper-menu">
		<div id ="menu">
			<ul>
				<li><a href="../Index.jsp">Home</a></li>
				<li><a href="lijstLeerlingen.jsp">Leerlingen Beheer</a></li>
				<li><a href="DocentenBeheer.jsp">Docenten Beheer</a></li>
				<li><a href="Stagebegeleidertoevoegen.jsp">Begeleider Beheer</a></li>
  				<li><a href="CompetentiesBeheer.jsp">Competenties Beheer </a></li>
 			</ul>
		</div>
	</div>
	<div id="wrapper-content">
		<div id ="content">
			<div id="lineup">
			

				<p>${lvmessage}</p>		
			
			
<table id="table" >
  <tr>
      <th>Gebruiksnaam </th>
      <th>Wachtwoord</th>
      <th>Tools</th>
    </tr>

<% for (User ci : allUsers) {%>
<tr> 
<td>
<%=ci.getUsername()%>
</td>

<td>
<%=ci.getPassword()%>
</td>

<td>
<!-- Verwijderen van docenten -->
<form style="display:inline" action="DocentVerwijderenServlet.do?id=<%=ci.getId()%>" method="post">
<input type="image" src="../images/delete.png" height="25px" width="25px" >
</form>

</td>
<%} %>
</tr>
</table>

<img src="../images/new.png" height="25px" width="25px" style="cursor: pointer; cursor: hand;" id="img" class="img"> Nieuwe Docent toevoegen
<div id="popup_box">
	<div id="popcontainer">
		<div id="inputbox">
			<h3>Nieuwe docent toevoegen</h3>
			<form style="display:inline" action="DocentToevoegenServlet.do" method="post" onsubmit="setTimeout('location.reload());">
			<input type="text" name="username" class="ltf" placeholder="gebruiksnaam"><br>
			<input type="text" name="password" class="ltf" placeholder ="wachtwoord"><br>
			<input type="button" id="button" name="enter" value="Toevoegen" style="float:left;" onclick="submit()">
			<input type="button" id="popcancel" name="popcancel" value="Annuleren" style="margin-left:120px;">
			</form>
		</div>
	</div>
</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../pageFooter.jsp"></jsp:include>  