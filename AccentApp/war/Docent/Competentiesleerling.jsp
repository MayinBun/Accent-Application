<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.appspot.accent.model.Administrator" %>
<%@ page import="com.appspot.accent.model.CompetentieItem" %>
<%@ page import="com.appspot.accent.model.Leerling" %>
<%@ page import="java.util.ArrayList" %>

<jsp:include page="../pageHeader.jsp">
	<jsp:param name="titel" value="Competenties Invullen" />
</jsp:include> 
<%Administrator admin = (Administrator)(getServletContext().getAttribute( "admin" ));%>
<%Object obj = getServletContext().getAttribute("leerlingen"); 
ArrayList<Leerling> leerlingen = (ArrayList<Leerling>)obj;
%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
<script language="javascript">
/* Functie om ervoor te zorgen dat de radio button groep dynamisch wordt aangemaakt.  */
var curr=1 ;
function addradio()
{
document.getElementById("my_div").innerHTML=document.getElementById("my_div").innerHTML+
"<br><input type='radio' id='my"+curr+"'  value='1' name='my"+curr+"'>1 "+
"<input type='radio' id='my"+curr+"' value='2' name='my"+curr+"'>2 "+
"<input type='radio' id='my"+curr+"' value='3' name='my"+curr+"'>3 "+
"<input type='radio' id='my"+curr+"' value='4' name='my"+curr+"'>4 "+"</br>"; 
  curr=curr+1;
}	
</script>
<script>
function myFunction()
{
alert("Beoordeling is verzonden !");
}
</script>

<!-- wrapper (content + menu) -->
<div class="wrapper">
	<div id="wrapper-menu">
		<div id ="menu">
			<ul>
				<li><a href="../Index.jsp">Home</a></li>
  				<li><a href="lijstLeerlingen.jsp">Alle Leerlingen</a></li>
  				<li><a href="Competentiesleerling.jsp">Leerling Beoordelen </a></li>
 			</ul>
		</div>
	</div> 
	<div id="wrapper-content">
		<div id ="content">
			<div id ="lineup">
		<div id="title"><h3>Te beoordelen punten:<h3> </div>
		
		<select id="leerlingen">
		
			<%for (Leerling l : leerlingen){ %>
		<option value="<%=l.getUsername()%>">
        <%=l.getUsername()%>
   		</option>
   		 </select>	
   		 <%} %>
		
		
			<% for( CompetentieItem ci : admin.getAlleCompetentieItems())
					{ %>
				<form action="KoppelenBeoordelingCompententieServletD.do" method="POST">
			
					 <script>
					 addradio();
					 </script>
					 
			 <%=ci.getItemNaam()%>
					 
					<br></br>
					<div id="radio" >
						 <div id="my_div"></div>
						 </div>
					<% } %>
					
					<br>
					
			
				
			<div id="submitBeoordeling"><input type="submit" onclick="myFunction()" name="knop" id="knopcomp"value="Voer Door" /></div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../pageFooter.jsp"></jsp:include>  