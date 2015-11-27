package com.wsr.controllers;


import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wsr.pojos.BarebonePJ;
import com.wsr.services.Dbconnection;

import oracle.jdbc.driver.OracleTypes;

@WebServlet("/NewC")
public class NewC extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NewC() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String app;
			String sdate;
			String edate;
			String typeofChart;
			String typeofReport;
			
			 app = (String) request.getSession().getAttribute("appName");
				sdate = (String) request.getSession().getAttribute("sdate");
				edate = (String) request.getSession().getAttribute("edate");
				typeofChart = (String) request.getSession().getAttribute("typeofChart");
				typeofReport=(String) request.getSession().getAttribute("typeofReport");
		    Dbconnection con=new Dbconnection();
		    Connection conn=con.getconnection();
		    ResultSet rs;
		    
			String procQry="{CALL wsr_grid_priority_report_proc(?,?,?,?)}";
		    CallableStatement storedProc = conn.prepareCall(procQry);
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date startdate = sdf1.parse(sdate);
			java.util.Date enddate = sdf1.parse(edate);
			java.sql.Date sqlStartDate = new java.sql.Date(startdate.getTime());
			java.sql.Date sqlEndDate = new java.sql.Date(enddate.getTime());
			

			storedProc.setString(1, app);
			storedProc.setDate(2,sqlStartDate  );
			storedProc.setDate(3,  sqlEndDate);
			storedProc.registerOutParameter(4, OracleTypes.CURSOR);

			// execute  store procedure
			  storedProc.execute();

			rs = (ResultSet)storedProc.getObject(4);

		        ArrayList<BarebonePJ> v = new ArrayList<BarebonePJ>();
		        BarebonePJ bobj = new BarebonePJ();
		    
		         BarebonePJ Barebone = null;
		         int oi=0;
		         while(rs.next()){
		        	 bobj = new BarebonePJ();
		           
		       bobj.setCol1(rs.getString(1));
		       bobj.setCol2(rs.getString(2));
		       bobj.setCol3(rs.getString(3));
		       bobj.setCol4(rs.getString(4));
		       bobj.setCol5(rs.getString(5));
		             v.add(bobj); 
		            
		         }
		        // System.out.println("db1");
  Iterator<BarebonePJ> i=v.iterator();
		         
		        
				
				 request.getSession().setAttribute("listofRows", v);
			        RequestDispatcher view = request.getRequestDispatcher("listnames.jsp");
			        view.forward(request, response);
		
		
		
		}catch (Exception e) {
				e.printStackTrace();
				}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
