
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="oracle.jdbc.driver.OracleTypes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
<!--
@import url("style.css");
-->
</style>

<head>
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

						//3
						

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
														pointPadding : 0.2,
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reportview</title>




</head>
<body>
   
     
    <div align="right">
       <table style="width=100%;" id="ver-minimalist">
            <caption><h2>List of users</h2></caption>
            <tr>
                <th>App</th>
                <th>Critical</th>
                <th>High</th>
                <th>Medium</th>
                <th>Low</th>
              
            </tr>
            
           <c:forEach items="${sessionScope.listofRows}" var="name">
   <tr>
  
       <td>${name.col1}</td>
       <td>${name.col2}</td>
       <td>${name.col3}</td>
         <td>${name.col4}</td>
       <td>${name.col5}</td>
                     
    </tr>
</c:forEach>
        </table>
    </div>
</body>
</html>