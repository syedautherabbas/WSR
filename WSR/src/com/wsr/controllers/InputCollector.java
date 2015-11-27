package com.wsr.controllers;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InputCollector
 */
@WebServlet("/InputCollector")
public class InputCollector extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public InputCollector() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String track=(String)request.getParameter("track");
		String app=(String)request.getParameter("App");
	    String sdate=(String)request.getParameter("startDate");
	    String edate=(String)request.getParameter("endDate");
	   // String typeOfChart=(String)request.getParameter("typeofChart");
	   // String typeofReport=(String)request.getParameter("typeofReport");  
	    
	    if(app==null)
	    {
	    	
	    	app="OCS";
	    }
	   /* if(typeOfChart==null)
	    {
	    	
	    	typeOfChart="column";
	    }*/
	    /*if(typeofReport==null)
	    {
	    	
	    	typeofReport="status";
	    }*/
	    
	    
	    
	    
	//System.out.println("In Input Collector : App name : "+app+"  sdate  : "+sdate+" edate : "+edate);
	    
		request.getSession().setAttribute("track",track );
		request.getSession().setAttribute("appName",app );
		request.getSession().setAttribute("sdate",sdate);
		request.getSession().setAttribute("edate",edate );
		//request.getSession().setAttribute("typeofChart",typeOfChart );
		//request.getSession().setAttribute("typeofReport",typeofReport);
		//RequestDispatcher rd=request.getRequestDispatcher("choicepage.jsp");
		RequestDispatcher rd=request.getRequestDispatcher("/ReportController");
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
