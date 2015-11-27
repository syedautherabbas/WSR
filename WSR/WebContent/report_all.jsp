<%@page import="com.wsr.dao.ReportGenerationDao"%>
<%@page import="com.wsr.services.Services"%>
<%@page import="com.wsr.pojos.BarebonePJ"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
<!--
@import url("style.css");
-->
</style>
<head>

<title>WSR Report Page</title>
<script type="text/javascript" src="jquery-1.11.3.js"></script>
<script type="text/javascript" src="highcharts.js"></script>
<script src="highcharts-3d.js"></script>
<script type="text/javascript">
  
  
    
    $(document).ready(function() 
    			{

       	
    	  <%!String app;
	String sdate;
	String edate;
	String track;
	;%>
    	    
    	    
    	    <%
    	    
    	    track = (String) request.getSession().getAttribute("track");
			sdate = (String) request.getSession().getAttribute("sdate");
			edate = (String) request.getSession().getAttribute("edate");
	
			
			%>
    
    
    	 var b="<%=track%>";
    	
    	 var d="<%=sdate%>";
    	 var e="<%=edate%>";
   
    	
						giveJSON("column", b,"priority",d,e,"#priority");
						giveJSON("column", b,"prioritynew",d,e,"#prioritynew");-
						giveJSON("column", b,"priorityopen",d,e,"#priorityopen");
						giveJSON("column", b,"priorityclose",d,e,"#priorityclose");
						giveJSON("column", b,"prioritymonthly",d,e,"#prioritymonthly");
						giveJSON("column", b,"prioritymonthlyopen",d,e,"#prioritymonthlyopen");
						giveJSON("column", b,"prioritymonthlyclose",d,e,"#prioritymonthlyclose");
						giveJSON("column", b,"priorityweekly",d,e,"#priorityweekly");
						giveJSON("column", b,"priorityweeklyopen",d,e,"#priorityweeklyopen");
						giveJSON("column", b,"priorityweeklyclose",d,e,"#priorityweeklyclose");
						giveJSON("column", b,"status",d,e,"#status");
						giveJSON("column", b,"statusmonthly",d,e,"#statusmonthly");
						giveJSON("column", b,"statusweekly",d,e,"#statusweekly");
						giveJSON("column", b,"ticketageopen",d,e,"#ticketageopen");
						giveJSON("column", b,"ticketageclose",d,e,"#ticketageclose");
						
						
						
						
						

					
						
						$(".chartchanger").change(function() {
						
							var t1="#"+$(this).attr('name');
							//alert($(this).val()+b+$(this).attr('name')+d+e+"#"+$(this).attr('name'));
							giveJSON($(this).val(),b,$(this).attr('name'),d,e,t1);
							t1=null;
							 
						});

					

					

					});//doc end

					
					
					
					function loadchart(gdata,charttype,reporttype,sdate,edate, tablename) {

					
							var p = new Array();

							for (i in gdata) {

								for (key in gdata[i]) {

									if (gdata[i][key].name == "list") {

										list = gdata[i][key].data;

									} else {
									
										//set the charttype to the chartype selected from drop down , else default it to column
										if(gdata[i][key].type=="" ||  gdata[i][key].type==null )
											{
											
											
											if(charttype!=null)
												{
												
												gdata[i][key].type=charttype;
												
												
												}
											else{
												alert("defaulting Chart to bar ");
												
											gdata[i][key].type="bar";
											}
											
											}else{
												
												
											}
										
										//color the recieved data sets 
										if(gdata[i][key].name==="High")
										{
											
											gdata[i][key].color="red";
											
										
										
										
										}else if(gdata[i][key].name==="Medium")
										{
											
											gdata[i][key].color="yellow";
										}
										else if(gdata[i][key].name==="Low")
										{
											
											gdata[i][key].color="green";
										}
										
									
										p.push({
											"name" : gdata[i][key].name,
											"data" : gdata[i][key].data,
											"type":gdata[i][key].type,
											"color":gdata[i][key].color
											
											
											
											
										})
										
										
									

									}

								

								}
								
							

							}

							
						
						var reportname=getreportName(reporttype);

							$(tablename)
									.highcharts(
											{
												 
												title : {
													text :   ' Graph based on '+reportname+" Report from "+sdate+" to "+edate
												},

												xAxis : {
													categories : list,
													
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
															+ '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
													footerFormat : '</table>',
													shared : true,
													useHTML : true
												},
												plotOptions : {
													column : {
														
														borderWidth : 0
													}
												},

												series : p
											});
				

						}

						
					
					
					
// getting data from DB

function giveJSON(typeOfChart,app, typeOfReport,sdate,edate,tablename) {

		var list = new Array();
		var processed_json = new Array();


		$.ajax({

			url : "/WSR/DataSupply?typeOfChart=" + typeOfChart+"&app="+app+"&typeOfReport="+typeOfReport+"&sdate="+sdate+"&edate="+edate,
			dataType : 'json',

			error : function(ts) {

				alert("App Crashed Due to an Error , Please try again later ");

			},

			success : function(data) {

			
				loadchart(data,typeOfChart,typeOfReport,sdate,edate,tablename);
				
			}

		});

	}
	
function getreportName(reporttype)
{
var reportname;
if(reporttype=="priority")
	{
	reportname="Priority";
	}
else if(reporttype=="prioritynew")
		{
		reportname="Priority/New";
		
		}
	else if(reporttype=="priorityopen")
		{
		reportname="Priority/Open";
		}			
		else if(reporttype=="priorityclose")
		{
		reportname="Priority/Close";
		}
		else if(reporttype=="prioritymonthly")
		{
		reportname="Priority/Monthly";
		}
		else if(reporttype=="prioritymonthlyopen")
		{
		reportname="Priority/Monthly-Open";
		}
		else if(reporttype=="prioritymonthlyclose")
		{
		reportname="Priority/Monthly-Close";
		}
		else if(reporttype=="priorityweekly")
		{
		reportname="Priority/Weekly";
		}
		else if(reporttype=="priorityweeklyopen")
		{
		reportname="Priority/Weekly-Open";
		}
		else if(reporttype=="priorityweeklyclose")
		{
		reportname="Priority/Weekly-Close";
		}
		else if(reporttype=="status")
		{
		reportname="Status";
		}
		else if(reporttype=="statusmonthly")
		{
		reportname="Status/Monthly";
		}
		
		else if(reporttype=="statusweekly")
		{
		reportname="Status/Weekly";
		}
		
		else if(reporttype=="ticketageopen")
		{
		reportname="TiketAge/Open";
		}
		
		else if(reporttype=="ticketageclose")
		{
		reportname="TiketAge/Close";
		}
		
		
		return reportname;
		
	
}


// getting data end
					
					
				
					
					
					
	

	
</script>


<script src="exporting.js"></script>
</head>
<body>



	<%! ReportGenerationDao repDao = new ReportGenerationDao(); %>
	<%! Services serviceobj=new Services();	 %>

	<%			
		 	 	track = (String) request.getSession().getAttribute("track");
				sdate = (String) request.getSession().getAttribute("sdate");
				edate = (String) request.getSession().getAttribute("edate");
		
				//.println(track+ " " +sdate+ " " +edate);
	%>

	<div align="Center">
		<table>
			<tr>
				<td colspan="5">Track: <%= track %><br> Start Date: <%= sdate %>
					<br> End Date: <%= edate %><br>
				</td>
			</tr>
		</table>
	</div>
	<div id="numerouno"></div>

	<div>
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsPriority = repDao.getResultSetForPriorityReport(track, sdate, edate);
				
				//.println(rsPriority);
				
				ArrayList<BarebonePJ> listPriority = serviceobj.getdataforReporttable(rsPriority);	          
		%>
		<br> <br>

		<table id="ver-minimalist">
			<caption>
				<h2>Report Structure – By Application / Priority</h2>
			</caption>
			<%int  counter=1;
       					for(BarebonePJ temp:listPriority)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				<th><%= temp.getCol5() %></th>
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>
				<td><%= temp.getCol5() %></td>
			</tr>

			<%	} }  %>
		</table>

		<br> <br>

		<div id="priority"></div>

		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="priority">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>

	</div>


	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsPriorityMonthly = repDao.getResultSetForMonthlyPriorityReport(track, sdate, edate);
				
				//.println(rsPriorityMonthly);
				
				ArrayList<BarebonePJ> listPriorityMonthly = serviceobj.getdataforReporttable(rsPriorityMonthly);	          
		%>
		<br> <br>
		<table id="nolastrow">
			<tr>
				<td colspan="5">
					<h2>Report Structure – By Application / Priority Monthly</h2>
				</td>
			</tr>
		<%  counter=1;
       					for(BarebonePJ temp:listPriorityMonthly)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>

			</tr>

			<%	}  } %>
		</table>

		<br> <br>
		<div id="prioritymonthly"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="prioritymonthly">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
		
	</div>

	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsPriorityWeekly = repDao.getResultSetForWeeklyPriorityReport(track, sdate, edate);
				
				//.println(rsPriorityMonthly);
				
				ArrayList<BarebonePJ> listPriorityWeekly = serviceobj.getdataforReporttable(rsPriorityWeekly);	          
		%>
		<br> <br>
		<table id="nolastrow">
			<tr>
				<td colspan="5">
					<h2>Report Structure – By Application / Priority Weekly</h2>
				</td>
			</tr>
		<%  counter=1;
       					for(BarebonePJ temp:listPriorityWeekly)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
			
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>

			</tr>

			<%	}  } %>
		</table>

		<br> <br>
		<div id="priorityweekly"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="priorityweekly">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>


	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsPriorityNew = repDao.getResultSetForPriorityNewReport(track, sdate, edate);
				
				//.println(rsPriorityNew);
				
				ArrayList<BarebonePJ> listPriorityNew = serviceobj.getdataforReporttable(rsPriorityNew);	          
		%>
		<br> <br>
		<table id="ver-minimalist">
			<tr>
				<td colspan="5">
					<h2>Report Structure – By Application / Priority New</h2>
				</td>
			</tr>
			<%  counter=1;
       					for(BarebonePJ temp:listPriorityNew)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				<th><%= temp.getCol5() %></th>
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>
				<td><%= temp.getCol5() %></td>
			</tr>

			<%	}  } %>
		</table>

		<br> <br>
		<div id="prioritynew"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="prioritynew">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>




	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsPriorityOpen = repDao.getResultSetForPriorityOpenReport(track, sdate, edate);
				
				//.println(rsPriorityOpen);
				
				ArrayList<BarebonePJ> listPriorityOpen = serviceobj.getdataforReporttable(rsPriorityOpen);	          
		%>
		<br> <br>
		<table id="ver-minimalist">
			<tr>
				<td colspan="5">
					<h2>Report Structure – By Application / Priority Open</h2>
				</td>
			</tr>
	<%  counter=1;
       					for(BarebonePJ temp:listPriorityOpen)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				<th><%= temp.getCol5() %></th>
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>
				<td><%= temp.getCol5() %></td>
			</tr>

			<%	}  } %>
		</table>
		<br> <br>
		<div id="priorityopen"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="priorityopen">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>



	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsPriorityClose = repDao.getResultSetForPriorityCloseReport(track, sdate, edate);
				
				//.println(rsPriorityClose);
				
				ArrayList<BarebonePJ> listPriorityClose = serviceobj.getdataforReporttable(rsPriorityClose);	          
		%>
		<br> <br>
		<table id="ver-minimalist">
			<tr>
				<td colspan="5">
					<h2>Report Structure – By Application / Priority Close</h2>
				</td>
			</tr>
			<%  counter=1;
       					for(BarebonePJ temp:listPriorityClose)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				<th><%= temp.getCol5() %></th>
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>
				<td><%= temp.getCol5() %></td>
			</tr>

			<%	}  } %>
		</table>
		<br> <br>
		<div id="priorityclose"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="priorityclose">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>


	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsPriorityMonthlyOpen = repDao.getResultSetForMonthlyOpenPriorityReport(track, sdate, edate);
				
				//.println(rsPriorityMonthlyOpen);
				
				ArrayList<BarebonePJ> listPriorityMonthlyOpen = serviceobj.getdataforReporttable(rsPriorityMonthlyOpen);	          
		%>
		<br> <br>
		<table id="nolastrow">
			<tr>
				<td colspan="5">
					<h2>Report Structure – By Application / Priority Monthly Open</h2>
				</td>
			</tr>
		<%  counter=1;
       					for(BarebonePJ temp:listPriorityMonthlyOpen)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				<th><%= temp.getCol5() %></th>
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>
				<td><%= temp.getCol5() %></td>
			</tr>

			<%	}  } %>
		</table>
		<br> <br>
		<div id="prioritymonthlyopen"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="prioritymonthlyopen">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>

	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsPriorityMonthlyClose = repDao.getResultSetForMonthlyClosePriorityReport(track, sdate, edate);
				
				//.println(rsPriorityMonthlyClose);
				
				ArrayList<BarebonePJ> listPriorityMonthlyClose = serviceobj.getdataforReporttable(rsPriorityMonthlyClose);	          
		%>
		<br> <br>
		<table id="nolastrow">
			<tr>
				<td colspan="5">
					<h2>Report Structure – By Application / Priority Monthly Close</h2>
				</td>
			</tr>
			<%  counter=1;
       					for(BarebonePJ temp:listPriorityMonthlyClose)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				<th><%= temp.getCol5() %></th>
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>
				<td><%= temp.getCol5() %></td>
			</tr>

			<%	}  } %>
		</table>
		<br> <br>
		<div id="prioritymonthlyclose"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="prioritymonthlyclose">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>


	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsPriorityWeeklyOpen = repDao.getResultSetForWeeklyOpenPriorityReport(track, sdate, edate);
				
				//.println(rsPriorityWeeklyOpen);
				
				ArrayList<BarebonePJ> listPriorityWeeklyOpen = serviceobj.getdataforReporttable(rsPriorityWeeklyOpen);	          
		%>
		<br> <br>
		<table id="nolastrow">
			<tr>
				<td colspan="5">
					<h2>Report Structure – By Application / Priority Weekly Open</h2>
				</td>
			</tr>
			<%  counter=1;
       					for(BarebonePJ temp:listPriorityWeeklyOpen)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				<th><%= temp.getCol5() %></th>
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>
				<td><%= temp.getCol5() %></td>
			</tr>

			<%	}  } %>
		</table>
		<br> <br>
		<div id="priorityweeklyopen"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="priorityweeklyopen">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>



	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsPriorityWeeklyClose = repDao.getResultSetForWeeklyClosePriorityReport(track, sdate, edate);
				
				//.println(rsPriorityWeeklyClose);
				
				ArrayList<BarebonePJ> listPriorityWeeklyClose = serviceobj.getdataforReporttable(rsPriorityWeeklyClose);	          
		%>
		<br> <br>
		<table id="nolastrow">
			<tr>
				<td colspan="5">
					<h2>Report Structure – By Application / Priority Weekly Close</h2>
				</td>
			</tr>
			<%  counter=1;
       					for(BarebonePJ temp:listPriorityWeeklyClose)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				<th><%= temp.getCol5() %></th>
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>
				<td><%= temp.getCol5() %></td>
			</tr>

			<%	}  } %>
		</table>
		<br> <br>
		<div id="priorityweeklyclose"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="priorityweeklyclose">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>


	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsStatus = repDao.getResultSetForStatusReport(track, sdate, edate);
				
				//.println(rsPriorityWeeklyClose);
				
				ArrayList<BarebonePJ> listStatus = serviceobj.getdataforReporttable(rsStatus);	          
		%>
		<br> <br>
		<table id="statusrepleft">
			<tr>
				<td colspan="5">
					<h2>Report Structure – By Application / Status</h2>
				</td>
			</tr>
		<%  counter=1;
       					for(BarebonePJ temp:listStatus)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				<th><%= temp.getCol5() %></th>
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>
				<td><%= temp.getCol5() %></td>
			</tr>

			<%	}  } %>
		</table>
		<br> <br>
		<div id="status"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="status">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>

	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsStatusMonthly = repDao.getResultSetForMonthlyStatusReport(track, sdate, edate);
				
				//.println(rsPriorityWeeklyClose);
				
				ArrayList<BarebonePJ> listStatusMonthly = serviceobj.getdataforReporttable(rsStatusMonthly);	          
		%>
		<br> <br>
		<table id="nolastrow">
			<tr>
				<td colspan="5">
					<h2>Report Structure – By Application / Status Monthly</h2>
				</td>
			</tr>
		<%  counter=1;
       					for(BarebonePJ temp:listStatusMonthly)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>

			</tr>

			<%	}  } %>
		</table>
		<br> <br>
		<div id="statusmonthly"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="statusmonthly">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>
	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsStatusWeekly = repDao.getResultSetForWeeklyStatusReport(track, sdate, edate);
				
				//.println(rsPriorityWeeklyClose);
				
				ArrayList<BarebonePJ> listStatusWeekly = serviceobj.getdataforReporttable(rsStatusWeekly);	          
		%>
		<br> <br>
		<table id="nolastrow">
			<tr>
				<td colspan="5">
					<h2>Report Structure – By Application / Status Weekly</h2>
				</td>
			</tr>
		<%  counter=1;
       					for(BarebonePJ temp:listStatusWeekly)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>

			</tr>

			<%	}  } %>
		</table>
		<br> <br>
		<div id="statusweekly"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="statusweekly">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>

	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsTicketAgeOpen = repDao.getResultSetForTicketAgeOpen(track, sdate, edate);
				
				//.println(rsPriorityWeeklyClose);
				
				ArrayList<BarebonePJ> listTicketAgeOpen = serviceobj.getdataforReporttable(rsTicketAgeOpen);	          
		%>
		<br> <br>
		<table id="ver-minimalist">
			<tr>
				<td colspan="7">
					<h2>Report Structure – By Application / Ticket Age Open</h2>
				</td>
			</tr>
			<%  counter=1;
       					for(BarebonePJ temp:listTicketAgeOpen)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				<th><%= temp.getCol5() %></th>
				<th><%= temp.getCol6() %></th>
				<th><%= temp.getCol7() %></th>
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>
				<td><%= temp.getCol5() %></td>
				<td><%= temp.getCol6() %></td>
				<td><%= temp.getCol7() %></td>
			</tr>

			<%	}  } %>
		</table>
		<br> <br>
		<div id="ticketageopen"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="ticketageopen">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>

	<div align="center">
		<!--  <table style="width=100%;" id="ver-minimalist"> -->

		<%
          		ResultSet rsTicketAgeResolved = repDao.getResultSetForTicketAgeResolved(track, sdate, edate);
				
				//.println(rsPriorityWeeklyClose);
				
				ArrayList<BarebonePJ> listTicketAgeResolved = serviceobj.getdataforReporttable(rsTicketAgeResolved);	          
		%>
		<br> <br>
		<table id="ver-minimalist">
			<tr>
				<td colspan="7">
					<h2>Report Structure – By Application / Ticket Age Resolved</h2>
				</td>
			</tr>
			<%  counter=1;
       					for(BarebonePJ temp:listTicketAgeResolved)
						{
       						if(counter==1)
       						{
       							counter=0;
       						 %>
			<tr>
				<th><%= temp.getCol1() %></th>
				<th><%= temp.getCol2() %></th>
				<th><%= temp.getCol3() %></th>
				<th><%= temp.getCol4() %></th>
				<th><%= temp.getCol5() %></th>
				<th><%= temp.getCol6() %></th>
				<th><%= temp.getCol7() %></th>
			</tr>

			<% }else{
    	   %>
			<tr>
				<td><%= temp.getCol1() %></td>
				<td><%= temp.getCol2() %></td>
				<td><%= temp.getCol3() %></td>
				<td><%= temp.getCol4() %></td>
				<td><%= temp.getCol5() %></td>
				<td><%= temp.getCol6() %></td>
				<td><%= temp.getCol7() %></td>
			</tr>

			<%	}  } %>
		</table>
		<br> <br>
		<div id="ticketageclose"></div>
		<div align="center">
			<label for="chartchanger">Type of Chart </label> <select
				class="chartchanger" name="ticketageclose">
				<option>Choose Type</option>
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>


			</select>
		</div>
	</div>


</body>
</html>