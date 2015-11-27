package com.wsr.controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wsr.pojos.BarebonePJ;
import com.wsr.services.Services;

@WebServlet("/ReportController")
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ReportController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String track;
		String app;
		String sdate;
		String edate;
		String typeofChart;
		String typeofReport;*/
		
		/*track = (String) request.getSession().getAttribute("track");
		 app = (String) request.getSession().getAttribute("appName");
			sdate = (String) request.getSession().getAttribute("sdate");
			edate = (String) request.getSession().getAttribute("edate");
			typeofChart = (String) request.getSession().getAttribute("typeofChart");
			typeofReport=(String) request.getSession().getAttribute("typeofReport");*/
		

		String track=(String)request.getParameter("track");
	    String sdate=(String)request.getParameter("startDate");
	    String edate=(String)request.getParameter("endDate");
			
	    //.println(track+ " " +sdate+ " " +edate);
	    
		Services serviceobj=new Services();
		//ArrayList<BarebonePJ> v ;
		
		Map<String, ResultSet> allReportMap;
		
		allReportMap = serviceobj.getData(track, sdate, edate);	
		//.println("In controller:" +allReportMap);
		request.getSession().setAttribute("allReportMap", allReportMap); 
		
		request.getSession().setAttribute("track", track);
	    request.getSession().setAttribute("sdate", sdate);
	    request.getSession().setAttribute("edate", edate);
		
		/*v=serviceobj.getdataforReporttable(serviceobj.getResultSetForReport(track, sdate, edate,"priority_report"));
		 request.getSession().setAttribute("listofRows", v);*/
		
		//.println("Going to jsp page");
		 
		 RequestDispatcher reqDispatcher = request.getRequestDispatcher("report_all.jsp");
		 reqDispatcher.forward(request, response);
        
		   
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
