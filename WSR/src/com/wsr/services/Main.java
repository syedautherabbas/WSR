package com.wsr.services;



import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.wsr.dao.ReportGenerationDao;
import com.wsr.pojos.BarebonePJ;




public class Main {
	
	
	public JSONArray getTickets(String typeOfChart,String app,String  typeofReport,String sdate,String edate) throws Exception {
		
		JSONArray arr=new JSONArray();
	
		ReportGenerationDao rep=new ReportGenerationDao();
	
	if(typeofReport.equalsIgnoreCase("priority"))
	{

		ResultSet rst0=rep.getResultSetForPriorityReport(app, sdate, edate);
		int count=0;
		while(rst0.next())
		{
			count++;
		}
		
		
		ResultSet rst=rep.getResultSetForPriorityReport(app, sdate, edate);
		arr=getJsonArray(rst, arr, typeofReport, count);
		
		
		
	}
	
	
	else if(typeofReport.equalsIgnoreCase("prioritynew")) {
		
		ResultSet rst0=rep.getResultSetForPriorityNewReport(app, sdate, edate);
		int count=0;
		while(rst0.next())
		{
			count++;
		}
		
		
		ResultSet rst=rep.getResultSetForPriorityNewReport(app, sdate, edate);
		arr=getJsonArray(rst, arr, typeofReport, count);
		 
	}
	
else if(typeofReport.equalsIgnoreCase("priorityopen")) {
		
	ResultSet rst0=rep.getResultSetForPriorityOpenReport(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	
		ResultSet rst=rep.getResultSetForPriorityOpenReport(app, sdate, edate);
		arr=getJsonArray(rst, arr, typeofReport, count);
		 
	}
	
else if(typeofReport.equalsIgnoreCase("priorityclose")) {
	
	ResultSet rst0=rep.getResultSetForPriorityCloseReport(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	ResultSet rst=rep.getResultSetForPriorityCloseReport(app, sdate, edate);
	arr=getJsonArray(rst, arr, typeofReport, count);
	 
}
		
	
else if(typeofReport.equalsIgnoreCase("prioritymonthly")) {
	
	
	ResultSet rst0=rep.getResultSetForMonthlyPriorityReport(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	 
	 ResultSet rst=rep.getResultSetForMonthlyPriorityReport(app, sdate, edate);
	
	arr=	getJsonArray(rst, arr, typeofReport, count);
	


	
}
	
else if(typeofReport.equalsIgnoreCase("priorityweekly")) {
	

	ResultSet rst0=rep.getResultSetForWeeklyPriorityReport(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	ResultSet rst=rep.getResultSetForWeeklyPriorityReport(app, sdate, edate);
	
	arr=getJsonArray(rst, arr, typeofReport, count);
	 
}
	
	
else if(typeofReport.equalsIgnoreCase("prioritymonthlyopen")) {
	

	ResultSet rst0=rep.getResultSetForMonthlyOpenPriorityReport(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	ResultSet rst=rep.getResultSetForMonthlyOpenPriorityReport(app, sdate, edate);
	
	arr=getJsonArray(rst, arr, typeofReport, count);
	 
}
	
	
else if(typeofReport.equalsIgnoreCase("prioritymonthlyclose")) {
	

	ResultSet rst0=rep.getResultSetForMonthlyClosePriorityReport(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	ResultSet rst=rep.getResultSetForMonthlyClosePriorityReport(app, sdate, edate);
	
	arr=getJsonArray(rst, arr, typeofReport, count);
	 
}
	
else if(typeofReport.equalsIgnoreCase("priorityweeklyopen")) {
	

	ResultSet rst0=rep.getResultSetForWeeklyOpenPriorityReport(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	ResultSet rst=rep.getResultSetForWeeklyOpenPriorityReport(app, sdate, edate);
	
	arr=getJsonArray(rst, arr, typeofReport, count);
	 
}
	
else if(typeofReport.equalsIgnoreCase("priorityweeklyclose")) {
	

	ResultSet rst0=rep.getResultSetForWeeklyClosePriorityReport(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	ResultSet rst=rep.getResultSetForWeeklyClosePriorityReport(app, sdate, edate);
	
	arr=getJsonArray(rst, arr, typeofReport, count);
	 
}
else if(typeofReport.equalsIgnoreCase("status")) {
	

	ResultSet rst0=rep.getResultSetForStatusReport(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	ResultSet rst=rep.getResultSetForStatusReport(app, sdate, edate);
	
	arr=getJsonArray(rst, arr, typeofReport, count);
	 
}
else if(typeofReport.equalsIgnoreCase("statusmonthly")) {
	

	ResultSet rst0=rep.getResultSetForMonthlyStatusReport(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	ResultSet rst=rep.getResultSetForMonthlyStatusReport(app, sdate, edate);
	
	arr=getJsonArray(rst, arr, typeofReport, count);
	 
}
	
else if(typeofReport.equalsIgnoreCase("statusweekly")) {
	

	ResultSet rst0=rep.getResultSetForWeeklyStatusReport(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	ResultSet rst=rep.getResultSetForWeeklyStatusReport(app, sdate, edate);
	
	arr=getJsonArray(rst, arr, typeofReport, count);
	 
}
else if(typeofReport.equalsIgnoreCase("ticketageopen")) {
	

	ResultSet rst0=rep.getResultSetForTicketAgeOpen(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	ResultSet rst=rep.getResultSetForTicketAgeOpen(app, sdate, edate);

	
	arr=getJsonArray(rst, arr, typeofReport, count);
	 
}
else if(typeofReport.equalsIgnoreCase("ticketageclose")) {
	

	ResultSet rst0=rep.getResultSetForTicketAgeResolved(app, sdate, edate);
	int count=0;
	while(rst0.next())
	{
		count++;
	}
	ResultSet rst=rep.getResultSetForTicketAgeResolved(app, sdate, edate);
	

	
	arr=getJsonArray(rst, arr, typeofReport, count);
	 
}
	
	
	//.println(arr.toString());
	return arr;
	}
	
	
	
public JSONArray  getJsonArray(ResultSet rst,JSONArray arr, String reptype, int count) throws SQLException, JSONException {
	
	ResultSetMetaData rsmd = rst.getMetaData();
	 ArrayList<String> list=new ArrayList<String>();
	

	
	 
	 if(rst.next())
	   {
		 int arr1[]=new int[count];
		 int arr2[]=new int[count];
		 int arr3[]=new int[count];
		 int arr4[]=new int[count];
		 int arr5[]=new int[count];
		 int arr6[]=new int[count];
		 int arr7[]=new int[count];
		 //.println(count+"MALINGA count");
		 int iter=0;
		 
		   
	do{
		
		 
		
		 
	
	
		  if(reptype.equalsIgnoreCase("priorityweekly")||reptype.equalsIgnoreCase("priorityweeklyopen")||reptype.equalsIgnoreCase("priorityweeklyclose")||reptype.equalsIgnoreCase("statusweekly")){
				String temp=rst.getString(1);
				temp=temp.replaceAll("00:00:00.0", "");
				temp=temp.replaceFirst("^[^-]*", "" );
				temp=temp.replaceFirst("-", "");
		list.add(temp);
			 }
			 else
			 {
				 list.add(rst.getString(1));
			 }
		  
		  if(reptype.equalsIgnoreCase("priorityweekly")||reptype.equalsIgnoreCase("prioritymonthly"))
			 {
				
				 arr1[iter]=Integer.valueOf(rst.getString(2));
				 arr2[iter]=Integer.valueOf(rst.getString(3));
				 arr3[iter]=Integer.valueOf(rst.getString(4));
			 }
		  else if(reptype.equalsIgnoreCase("status")||reptype.equalsIgnoreCase("statusmonthly")||reptype.equalsIgnoreCase("statusweekly"))
			 {
			  arr1[iter]=Integer.valueOf(rst.getString(2));
				 arr2[iter]=Integer.valueOf(rst.getString(3));
				 arr3[iter]=Integer.valueOf(rst.getString(4));
				 if(reptype.equalsIgnoreCase("status"))
				 {
			 arr4[iter]=Integer.valueOf(rst.getString(5));
				 }
			
					
					
					 
				 
			 }
		  else if(reptype.equalsIgnoreCase("ticketageopen")||reptype.equalsIgnoreCase("ticketageclose"))
		  {
			  arr1[iter]=Integer.valueOf(rst.getString(2));
				 arr2[iter]=Integer.valueOf(rst.getString(3));
				 arr3[iter]=Integer.valueOf(rst.getString(4));
				 arr4[iter]=Integer.valueOf(rst.getString(5));
					 arr5[iter]=Integer.valueOf(rst.getString(6));
					 arr6[iter]=Integer.valueOf(rst.getString(7));
		  }
		  else if(!reptype.equalsIgnoreCase("priorityweekly")||!reptype.equalsIgnoreCase("prioritymonthly"))
			 {
				 arr1[iter]=Integer.valueOf(rst.getString(2))+Integer.valueOf(rst.getString(3));
				 arr2[iter]=Integer.valueOf(rst.getString(4));
			 arr3[iter]=Integer.valueOf(rst.getString(5));
			 }
			
	  
	 
	  
	 iter++;
	 } while(rst.next());
	
	
	
	JSONObject jsonlist = new JSONObject();
	jsonlist.put("name", "list");
	jsonlist.put("data", list);
		arr.put(jsonlist);
		
	
	JSONObject json1 = new JSONObject();
   
   if(reptype.equalsIgnoreCase("status"))
   {json1.put("name", "Carryover");
	   }
   else if(reptype.equalsIgnoreCase("statusmonthly")||reptype.equalsIgnoreCase("statusweekly"))
   {
	   json1.put("name", "New_Incidents");
	   
   }
   else if(reptype.equalsIgnoreCase("ticketageopen")||reptype.equalsIgnoreCase("ticketageclose"))
   {
	   json1.put("name", "<=30");
	   
   }
   else
	   {
		   json1.put("name", "High");
	   }
   
   json1.put("data", arr1);
	arr.put(json1);
	
	JSONObject json2 = new JSONObject();
	if(reptype.equalsIgnoreCase("status"))
	{
		  json2.put("name", "NewTickets");
	}
	 else if(reptype.equalsIgnoreCase("statusmonthly")||reptype.equalsIgnoreCase("statusweekly"))
	   {
		   json2.put("name", "Closed_Incidents");
		   
	   }
	 else if(reptype.equalsIgnoreCase("ticketageopen")||reptype.equalsIgnoreCase("ticketageclose"))
	   {
		   json2.put("name", ">30 & <=60");
		   
	   }
	
	else
   json2.put("name", "Medium");
   json2.put("data", arr2);
	arr.put(json2);

	JSONObject json3 = new JSONObject();
	if(reptype.equalsIgnoreCase("status"))
	{
		 json3.put("name", "ResolvedTickets");
	}
	 else if(reptype.equalsIgnoreCase("statusmonthly")||reptype.equalsIgnoreCase("statusweekly"))
	   {
		   json3.put("name", "Backlog");
		   json3.put("type", "line");
		   json3.put("color","red");
		   
	   }
	 else if(reptype.equalsIgnoreCase("ticketageopen")||reptype.equalsIgnoreCase("ticketageclose"))
	   {
		   json3.put("name", ">60 & <=90");
		   
	   }
	else
   json3.put("name", "Low");
   json3.put("data", arr3);
	arr.put(json3);

	
	if(reptype.equalsIgnoreCase("status"))
	{
		JSONObject json4 = new JSONObject();
		json4.put("name", "Total_open");
		json4.put("data", arr4);
			arr.put(json4);
	}
	
	if(reptype.equalsIgnoreCase("ticketageopen")||reptype.equalsIgnoreCase("ticketageclose"))
	{
		JSONObject json4 = new JSONObject();
		json4.put("name", ">90 & <=180");
		json4.put("data", arr4);
			arr.put(json4);
			
			JSONObject json5 = new JSONObject();
			json5.put("name", ">180");
			json5.put("data", arr5);
				arr.put(json5);
				
				JSONObject json6 = new JSONObject();
				json6.put("name", "Total");
				json6.put("data", arr6);
					arr.put(json6);
	}
	
	
	
	
	   }else{
		   //.println("no data in ajax call for priority  ");
	   }
	 
	 
	
		 
	 
		 System.out.println("REPTYPE : "+reptype+arr.toString());
	 
	 return arr;

}
}
	
	