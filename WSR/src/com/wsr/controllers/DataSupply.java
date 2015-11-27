package com.wsr.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





import org.json.*;

import com.wsr.services.Main;

/**
 * Servlet implementation class DataSupply
 */
@WebServlet("/DataSupply")
public class DataSupply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DataSupply() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		
		
		//.println("HI From data supply manager");

		String app=(String)request.getParameter("app");
	    String sdate=(String)request.getParameter("sdate");
	    String edate=(String)request.getParameter("edate");
	    String typeOfChart=(String)request.getParameter("typeOfChart");
	    String typeofReport=(String)request.getParameter("typeOfReport");  
	    
	  
	    //.println("In data supply : App name : "+app+"  sdate  : "+sdate+" edate : "+edate+" type of chart  : "+typeOfChart+" type of report :"+typeofReport );

			Main mainthread = new Main();

			JSONArray htags = new JSONArray();

			try {
				htags.put(mainthread.getTickets(typeOfChart,app, typeofReport,sdate,edate));
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(htags);

		

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}
