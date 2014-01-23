<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="../pageHeader.jsp">
	<jsp:param name="titel" value="Competentie toevoegen" />
</jsp:include>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.appspot.accent.model.Competentie" %>

 <!-- <script src="Chartjs/Chart.js"></script> -->
 <!-- het inladen van Google Chart. -->
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript" src="//maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript">
	  google.load("search", "1");
	  google.load("jquery", "1.4.2");
	  google.load("jqueryui", "1.7.2");
	  google.load("visualization", "1");
	  google.load('visualization', '1.0', {packages: ['charteditor']});
	  google.load('visualization', '1', {packages:['table']});
	</script>

 

<!-- wrapper (content + menu) -->
<div class="wrapper">
	<div id="wrapper-menu">
		<div id ="menu">
			<ul>
				<li><a href="../Index.jsp">Home</a></li>
  				<li><a href="Competentiesleerling.jsp">Competenties invullen </a></li>
  				<li><a href="Competentiesoverzicht.jsp">Voortgang</a></li>
 			</ul>
		</div>
	</div>
	<div id="wrapper-content">
		<div id ="content">
		<div id ="grafieken">
		<div id ="visualization"></div>
		<div id ="visualization-2"></div>
		<div id ="visualization-3"></div>
			
	</div>
	<script type="text/javascript">
//eerste grafiek hard coded 
google.setOnLoadCallback(drawVisualization);
function drawVisualization() {
	  var wrapper = new google.visualization.ChartWrapper({
	    chartType: 'ColumnChart',
	    dataTable:
	    	[
	    	 ['Beoordeling', 'Piet', 'Jan', 'Klaas'],
	          ['Samenwerken en overleggen',  2,   1,       3,      ],
	          ['Aandacht en begrip tonen',  3,   2,       2,      ],
	          ['Klantvriendelijk en dienstverlenend', 3,   1,       4,     ],
	          ['Instructies en procedures opvolgen',  4,   1,       3,      ],
	          ['Plannen en organiseren',  1,   3,       4,     ],
	          ['Kwaliteit en vakdeskundigheid ',  2,   1,       4,     ],
	          ['Veilig werken',  1,   4,       2,      ],
	          ['Met druk en tegenslag omgaan',  3,   1,      4,     ],
	          ['Omgaan met verandering en aanpassen',  2,   1,       4,     ],
	          ['Leren',  2,   3,       2,     ]
	    	
	    	],
	  
	    options: {'title': 'Periode 1',
	    'legend':'bottom',
	 
	    },
	   	
	    containerId: 'visualization',
	  });
	  wrapper.draw();
	}
</script>
    
<script type="text/javascript">
// tweede grafiek hard coded 
google.setOnLoadCallback(drawVisualization);
function drawVisualization() {
	  var wrapper = new google.visualization.ChartWrapper({
	    chartType: 'ColumnChart',
	    dataTable:
	    	[
	    	 ['Beoordeling', 'Docent', 'Student', 'Behaald'],
	          ['Samenwerken en overleggen',  2,   4,       1,      ],
	          ['Aandacht en begrip tonen',  1,   4,       2,      ],
	          ['Klantvriendelijk en dienstverlenend',  2,   3,       1,     ],
	          ['Instructies en procedures opvolgen',  2,   3,       2,      ],
	          ['Plannen en organiseren',  3,   4,       1,     ],
	          ['Kwaliteit en vakdeskundigheid ',  4,   4,       2,     ],
	          ['Veilig werken',  2,   3,       2,      ],
	          ['Met druk en tegenslag omgaan',  3,   4,       1,     ],
	          ['Omgaan met verandering en aanpassen',  4,   4,       2,     ],
	          ['Leren',  4,   4,       2,     ]
	    	
	    	],
	  
	    options: {'title': 'Periode 2',
	    'legend':'bottom',
	 
	    },
	   	
	    containerId: 'visualization-2',
	  });
	  wrapper.draw();
	}
</script>
   
<script type="text/javascript">
// derde grafiek hard coded 
google.setOnLoadCallback(drawVisualization);
function drawVisualization() {
	  var wrapper = new google.visualization.ChartWrapper({
	    chartType: 'ColumnChart',
	    dataTable:
	    	[
	    	 ['Beoordeling', 'Docent', 'Student', 'Behaald'],
	          ['Samenwerken en overleggen',  2,   1,       1,      ],
	          ['Aandacht en begrip tonen',  1,   4,       2,      ],
	          ['Klantvriendelijk en dienstverlenend',  2,   3,       4,     ],
	          ['Instructies en procedures opvolgen',  4,   2,       2,      ],
	          ['Plannen en organiseren',  3,   4,       1,     ],
	          ['Kwaliteit en vakdeskundigheid ',  4,   4,       2,     ],
	          ['Veilig werken',  2,   3,       2,      ],
	          ['Met druk en tegenslag omgaan',  2,   4,       4,     ],
	          ['Omgaan met verandering en aanpassen',  4,   1,       2,     ],
	          ['Leren',  4,   4,       2,     ]
	    	
	    	],
	  
	    options: {'title': 'Periode 3',
	    'legend':'bottom',
	 
	    },
	   	
	    containerId: 'visualization-3',
	  });
	  wrapper.draw();
	}
</script>
    
</script>

			
			
		</div>
	</div>
</div>
<jsp:include page="../pageFooter.jsp"></jsp:include>  
