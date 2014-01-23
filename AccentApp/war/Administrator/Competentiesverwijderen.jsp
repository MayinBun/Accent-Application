<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="../pageHeader.jsp">
	<jsp:param name="titel" value="Competenties verwijderen" />
</jsp:include>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="com.appspot.accent.model.Administrator" %>
<%@ page import="com.appspot.accent.model.CompetentieItem" %>
<%@ page import="com.appspot.accent.model.User" %>
<%@ page import="com.appspot.accent.dao.Dao"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%List<CompetentieItem> items = Dao.INSTANCE.getAlleCompetentieItems();%>
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
			

<table id="table" >
  <tr>
      <th>Competentie naam </th>
      <th>Tools</th>
    </tr>

<% for (CompetentieItem ci : items) {%>
<tr> 
<td>
<%=ci.getItemNaam()%>
</td>
<td>
<input type="image" src="../images/new.png" height="25px" width="25px">
<form style="display:inline" action="CompetentiesVerwijderenServlet.do?id=<%=ci.getId()%>" method="post">
<input type="image" src="../images/delete.png" height="25px" width="25px">
</form>
<form style="display:inline" action="CompetentieWijzigenServlet.do" method="post">
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