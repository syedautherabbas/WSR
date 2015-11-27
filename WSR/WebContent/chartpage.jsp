<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>Tickets Chart Plot</title>
<script type="text/javascript" src="jquery-1.11.3.js"></script>
<script type="text/javascript" src="highcharts.js"></script>
<script src="highcharts-3d.js"></script>
<script type="text/javascript">
  
  
    
    $(document).ready(function() 
    			{
    
    	
    	  <%!String app;
	String sdate;
	String edate;
	String typeofChart;
	String typeofReport;
	;%>
    	    
    	    
    	    <%
    	    
    	    app = (String) request.getSession().getAttribute("appName");
			sdate = (String) request.getSession().getAttribute("sdate");
			edate = (String) request.getSession().getAttribute("edate");
			typeofChart = (String) request.getSession().getAttribute("typeofChart");
			typeofReport=(String) request.getSession().getAttribute("typeofReport");
			
			%>
    
    	 var a="<%=typeofChart%>";
    	 var b="<%=app%>";
    	 var c="<%=typeofReport%>";
    	 var d="<%=sdate%>";
    	 var e="<%=edate%>";
    	 
    	 
						giveJSON(a, b,c,d,e);

						// 2 to display other types of charts for same data 
						$("#type1").change(function() {
							giveJSON($("#type1").val(),b,c,d,e);
						});

						// end

						

					});//doc end

					
					
					function loadchart(gdata,charttype,reporttype,sdate,edate) {

						
						
							var p = new Array();

							for (i in gdata) {

								for (key in gdata[i]) {

									if (gdata[i][key].name == "list") {

										list = gdata[i][key].data;

									} else {

										p.push({
											"name" : gdata[i][key].name,
											"data" : gdata[i][key].data
										})

									}

									//  

								}
								
								

							}

							// alert(list);
							//console.log(p);

							$('#container')
									.highcharts(
											{
												chart : {
													type : charttype
												},
												title : {
													text :   ' Tickets based on '+reporttype+" from "+sdate+" to "+edate
												},

												xAxis : {
													categories : list,
													crosshair : true
												},
												yAxis : {
													min : 0,
													title : {
														text : 'Tickets '
													}
												},
												tooltip : {
													headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
													pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
															+ '<td style="padding:0"><b>{point.y:.1f} Tickets </b></td></tr>',
													footerFormat : '</table>',
													shared : true,
													useHTML : true
												},
												plotOptions : {
													column : {
														pointPadding : 0.0,
														borderWidth : 0
													},
												bar : {
													pointPadding : 0,
													borderWidth : 0
												}
												},

												series : p
											});

						}

						
					
					
					
// getting data from DB

function giveJSON(typeOfChart,app, typeOfReport,sdate,edate) {

		var list = new Array();
		var processed_json = new Array();
	

		$.ajax({

			url : "/WSR/DataSupply?typeOfChart=" + typeOfChart+"&app="+app+"&typeOfReport="+typeOfReport+"&sdate="+sdate+"&edate="+edate,
			dataType : 'json',

			error : function(ts) {

				alert("ERROR WHILE GETTING DATA");

			},

			success : function(data) {

				
				loadchart(data,typeOfChart,typeOfReport,sdate,edate);
				
			}

		});

	}


// getting data end
					
					
					//Loading chart details 
					
					
					
	

	
</script>


<script src="exporting.js"></script>
</head>
<body>

	<div id="container" style="height: 400px"></div>


	<div align="center">
		<label for="type1">Type of Chart </label> <select id="type1">
			<option>spline</option>
			<option>bar</option>
			<option>column</option>
			<option>line</option>
			<option>scatter</option>

		

	</div>


</body>
</html>