<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:include page="../pageHeader.jsp">
	<jsp:param name="titel" value="Leerlingen Lijst" />
</jsp:include>        
<%@ page import="com.appspot.accent.model.Administrator" %>
<%@ page import="com.appspot.accent.model.CompetentieItem" %>
<%@ page import="com.appspot.accent.model.User" %>
<%@ page import="com.appspot.accent.model.Docent" %>
<%@ page import="com.appspot.accent.model.Leerling" %>
<%@ page import="com.appspot.accent.dao.Dao"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%Docent d =(Docent)request.getSession().getAttribute("userobject");%>
<%ArrayList<Leerling> mijnleerlingen = d.getMijnLeerlingen();%>
<link rel="stylesheet" type="text/css" href="/CSS/docent-style.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="../Scripts/sorttable.js"></script>
<!-- wrapper (content + menu) -->
<div class="wrapper">
	<div id="wrapper-menu">
		<div id ="menu">
			<ul>
				<li><a href="../Index.jsp">Home</a></li>
  				<li><a href="lijstLeerlingen.jsp">Alle Leerlingen</a></li>
  				<li><a href="Competentiesleerling.jsp">Leerling Beoordelen </a></li>
  				<li><a href="mijnLeerlingen.jsp">Mijn leerlingen </a></li>
 			</ul>
		</div>
	</div>
	<div id="wrapper-content">
		<div id ="content">
			<div id="lineup">
			

				<p>${message}</p>		
			
			
<table id="table"class="sortable"> 
  <tr>
      <th>Leerlingnaam </th>
      <th>Add</th>
    </tr>

<%if(mijnleerlingen != null){ for (Leerling ci : mijnleerlingen) {%>
<tr> 
<td>
<%=ci.getUsername()%>
</td>
<td>
<%=ci.getLijst()%>
</td>
<%} }%>
</tr>
</table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../pageFooter.jsp"></jsp:include>  