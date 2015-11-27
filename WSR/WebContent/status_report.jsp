<%@page import="com.wsr.pojos.BarebonePJ"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wsr.services.Services"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
<!--
@import url("style.css");
-->
</style>
<head>

<title>Table Report</title>
</head>
<body>
   
   		<%!String track = null; %>
    	<%!String app = null; %>
		<%!String sdate = null;%>
		<%!String edate = null;%>
		<%!String typeofReport = null;%>
		
		 <%
		 
		 /* if(app !=null && sdate !=null && edate !=null && typeofReport !=null)
		 { */
			 track = (String) request.getSession().getAttribute("track");
			 app = (String) request.getSession().getAttribute("app");
			sdate = (String) request.getSession().getAttribute("sdate");
			edate = (String) request.getSession().getAttribute("edate");
			//typeofChart = (String) request.getSession().getAttribute("typeofChart");
			typeofReport=(String) request.getSession().getAttribute("typeofReport"); 
			
			
			/* Services serviceobj=new Services();
			ArrayList<BarebonePJ> listofRows ;
			
			listofRows=serviceobj.getdataforReporttable(serviceobj.getResultSetForReport(track, sdate, edate,"priority_report"));  */
			%>
			
			
    <div align="right">
       <table style="width=100%;" id="ver-minimalist">
            <caption><h2>Report Structure – By Application / Status  </h2></caption>              
          
            <c:set var="flag" value="1" />
             <c:forEach items="${sessionScope.listofRows}" var="row">
             <c:choose> 
              <c:when test="${flag=='1'}">
              
      <tr>
     		 <td colspan="5">
     		 Track: <%= track %><br>
             Start Date: <%= sdate %> <br>
             End Date: <%= edate %><br>
           <%--  Type of Report: <%= typeofReport %><br> --%>
     		 
      		<%-- <caption align="left">Track: <%= track %></caption> 
             <caption  align="left">Start Date: <%= sdate %></caption> 
             <caption  align="left">End Date: <%= edate %></caption>
            <caption  align="left">Type of Report: <%= typeofReport %></caption> --%>
            </td>
      </tr>
            
     <tr>
                <th>${row.col1}</th>
                <th>${row.col2}</th>
                <th>${row.col3}</th>
                <th>${row.col4}</th>
                <th>${row.col5}</th>
                 <c:set var="flag" value="2" />
             
              
            </tr>
      </c:when>
           
     <c:otherwise>        
          
   <tr>
  
       <td>${row.col1}</td>
       <td>${row.col2}</td>
       <td>${row.col3}</td>
       <td>${row.col4}</td>
       <td>${row.col5}</td>
                     
    </tr>
     </c:otherwise>
</c:choose>
</c:forEach>
        </table>
    </div>
</body>
</html>