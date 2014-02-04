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
<%List<CompetentieItem> items = Dao.INSTANCE.getAlleCompetentieItems();%>
<link rel="stylesheet" href="/CSS/admin-style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="http://tablesorter.com/addons/pager/jquery.tablesorter.pager.js"></script>
<script src="/Scripts/admin-scripts.js"></script>
<script src="/Scripts/sorttable.js"></script>
<script>
/* Code om ervoor te zorgen dat er gezocht kan worden in de tabellen.
is getest in de oude versie van het project! */
function doSearch() {
    var searchText = document.getElementById('searchTerm').value;
    var targetTable = document.getElementById('mytable');
    var targetTableColCount;
            
    //Loop through table rows
    for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
        var rowData = '';

        //Get column count from header row
        if (rowIndex == 0) {
           targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
           continue; //do not execute further code for header row.
        }
                
        //Process data rows. (rowIndex >= 1)
        for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
            rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
        }

        //If search term is not found in row data
        //then hide the row, else show
        if (rowData.indexOf(searchText) == -1)
            targetTable.rows.item(rowIndex).style.display = 'none';
        else
            targetTable.rows.item(rowIndex).style.display = 'table-row';
    }
}
</script>
<!-- wrapper (content + menu) -->
<div class="wrapper">
	<div id="wrapper-menu">
		<div id ="menu">
			<ul>
				<li><a href="../Index.jsp">Home</a></li>
				<li><a href="LeerlingenBeheer.jsp">Leerlingen Beheer</a></li>
				<li><a href="DocentenBeheer.jsp">Docenten Beheer</a></li>
				<li><a href="BegeleiderBeheer.jsp">Begeleider Beheer</a></li>
				<li><a href="AdminBeheer.jsp">Admin Beheer</a></li>
  				<li><a href="CompetentiesBeheer.jsp">Competenties Beheer </a></li>
 			</ul>
		</div>
	</div>
	<div id="wrapper-content">
		<div id ="content">
			<div id="lineup">
			

				<p>${message}</p>		
				<input type="text" id="searchTerm" placeholder="Zoek"class="search_box" onkeyup="doSearch()" /></br><br>		
<table id="mytable" class="sortable" >
  <tr>
      <th>Id</th>
      <th>Omschrijving</th>
      <th>Tools</th>
    </tr>

<% for (CompetentieItem ci : items) {%>
<tr> 
<td>
<%=ci.getId()%>
</td>

<td>
<%=ci.getItemNaam()%>
</td>

<td>
<!-- Verwijderen van docenten -->
<form style="display:inline" action="CompetentiesVerwijderenServlet.do?id=<%=ci.getId()%>" method="post">
<input type="image" src="../images/delete.png" height="25px" width="25px" >
</form>

</td>
<%} %>
</tr>
</table>

<img src="../images/new.png" height="25px" width="25px" style="cursor: pointer; cursor: hand;" id="img" class="img"> Nieuwe Competentie toevoegen
<div id="popup_box">
	<div id="popcontainer">
		<div id="inputbox">
			<h3>Nieuwe Item toevoegen</h3>
			<form style="display:inline" action="CompetentieToevoegenServlet.do" method="post">
			<input type="text" name="compnaam" class="ltf" placeholder="Beschrijving"><br>
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