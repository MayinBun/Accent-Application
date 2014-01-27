<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="../pageHeader.jsp">
	<jsp:param name="titel" value="Leerlingen Beheer" />
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
				<li><a href="DoentenBeheer.jsp">Docenten Beheer</a></li>
				<li><a href="Stagebegeleidertoevoegen.jsp">Begeleider Beheer</a></li>
  				<li><a href="CompetentiesBeheer.jsp">Competenties Beheer </a></li>
  				<li><a href="Competentieswijzigen.jsp">Competentie wijzigen</a></li>
  				<li><a href="Competentiesverwijderen.jsp">Competentie verwijderen</a></li>
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

<img src="../images/edit.png" height="25px" width="25px" id="wzg" class="<%=ci.getId()%>" style="cursor: pointer; cursor: hand;">

<div id="popup_box2">
	<div id="popcontainer2">
		<div id="inputbox2">
			<h3>Gegevens wijzigen</h3>
			<form style="display:inline" action="LeerlingWijzigenServlet.do" method="post">
			<input type="text" name="username" class="ltf"  value=<%=ci.getUsername()%>><br>
			<input type="text" name="password" class="ltf"  value=<%=ci.getPassword()%>><br>
			<input type="button" id="button" name="enter" value="Wijzigen" style="float:left;" onclick="submit()">
			<input type="button" id="popcancel2" name="popcancel2" value="Annuleren" style="margin-left:120px;">
			</form>
		</div>
	</div>
</div>
</td>
<script>
$( document ).ready(function() {
	$('#wzg').click(function( event ) {
		loadPopupBox2();
    });
	
	$('#popcancel2').click( function() {
		unloadPopupBox2();
	});
	 
	$( "#img" ).click(function( event ) {
        loadPopupBox();
    });
	
	$('#popcancel').click( function() {
		unloadPopupBox();
	});
	
	function loadPopupBox() {    // To Load the Popupbox
        $('#popup_box').fadeIn("slow");
	}
	
	function unloadPopupBox(){
		$('#popup_box').fadeOut("slow");
	}
	
	function loadPopupBox2() {    // To Load the Popupbox
        $('#popup_box2').fadeIn("slow");
	}
	
	function unloadPopupBox2(){
		$('#popup_box2').fadeOut("slow");
	}
	
});		




</script>


<%} %>
</tr>
</table>

<img src="../images/new.png" height="25px" width="25px" style="cursor: pointer; cursor: hand;" id="img" class="img"> Nieuwe Leerling toevoegen
<div id="popup_box">
	<div id="popcontainer">
		<div id="inputbox">
			<h3>Nieuwe leerling toevoegen</h3>
			<form style="display:inline" action="LeerlingToevoegenServlet.do" method="post" onsubmit="setTimeout('location.reload());">
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