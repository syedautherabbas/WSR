<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <script type="text/javascript">
	function populate(track, application) {
		var track = document.getElementById(track);
		var application = document.getElementById(application);
		application.innerHTML = "";
		if (track.value == "eBiz") {
			var optionArray = [ "E-Business" ];
		} else if (track.value == "MAS") {
			var optionArray = [ "MAS" ];
		} else if (track.value == "OCS") {
			var optionArray = [ "AIMS", "OCS",  "EOBA", "SMART" ];
		}
		
		

		for ( var option in optionArray) {
			if (optionArray.hasOwnProperty(option)) {
				var pair = optionArray[option];
				var checkbox = document.createElement("input");
				checkbox.type = "checkbox";
				checkbox.name = "App";
				checkbox.value = pair;
				application.appendChild(checkbox);

				var label = document.createElement('label')
				label.htmlFor = pair;
				label.appendChild(document.createTextNode(pair));
				application.appendChild(label);
				application.appendChild(document.createElement("br"));
				
				
				
			}
			
			var label1 = document.createElement('label')
			label1.htmlFor = "Choose Application ";
			application.appendChild(label1);
		
		}
		
		application.appendChild(document.createElement("br"));
	}
 </script> -->
<title>WSR Generation</title>
</head>
<body>
<div align="center">
	<form action="ReportController" id="userInterface">
		<h1>WSR Generation</h1>
		<h2>Select The Duration</h2>
		<lable>Start Date:</lable>
		<input type="date" id="startDate" name="startDate" required/>
		<lable>End Date:</lable>
		<input type="date" id="endDate" name="endDate" required /> <br>
		<h2>Report Type</h2>
		<label>Track:</label> <select id="track" name="track">
			<!-- onchange="populate(this.id, 'application')" -->
			<option value="" Selected>Select One</option>
			<option value="EBIZ">EBIZ</option>
			<option value="MAS">MAS</option>
			<option value="OCS">OCS</option>
		</select> <br>
		<br> 
		<div id="application"></div>
		<!-- <div>
			<label for="typeofReport">Type of Report </label> 
			<select id="typeofReport" name="typeofReport">
				<option>application</option>
				<option>status</option>
				<option>priority</option>
				
			</select>
		</div>
		<br><br> -->
			<!-- <div>
			<label for="typeofChart">Type of Chart </label> 
			<select id="typeofChart" name="typeofChart">
				
				<option>bar</option>
				<option>column</option>
				<option>line</option>
				<option>scatter</option>

			</select>
		</div> -->
		
		

		<input type="submit" value="Generate" />
		</div>
	</form>
</body>
</html>