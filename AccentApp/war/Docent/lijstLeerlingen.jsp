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
<link rel="stylesheet" type="text/css" href="/CSS/docent-style.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="dscripts.js"></script>
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

<img src="../images/new.png" height="25px" width="25px" id="+img" class="+img">
<div id="popup_box">
	<input type="text" placeholder="Leerling">
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