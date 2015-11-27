/**
 * 
 */
package com.wsr.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import oracle.jdbc.driver.OracleTypes;

import com.wsr.pojos.BarebonePJ;
import com.wsr.services.Dbconnection;

/**
 * @author narvind
 *
 */
public class ReportGenerationDao {
	
	public ResultSet getResultSetForAllReport(String strQuery,  String track,	String sdate, String edate)
	{
	Dbconnection con = new Dbconnection();

	ResultSet rs = null;
	try {
		Connection conn = con.getconnection();

		String qry = strQuery;

		//.println(qry);

		CallableStatement storedProc = conn.prepareCall(qry);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date startdate = sdf1.parse(sdate);
		java.util.Date enddate = sdf1.parse(edate);
		java.sql.Date sqlStartDate = new java.sql.Date(startdate.getTime());
		java.sql.Date sqlEndDate = new java.sql.Date(enddate.getTime());

		storedProc.setString(1, track);
		storedProc.setDate(2, sqlStartDate);
		storedProc.setDate(3, sqlEndDate);
		storedProc.registerOutParameter(4, OracleTypes.CURSOR);

		// execute store procedure
		storedProc.execute();

		rs = (ResultSet) storedProc.getObject(4);

	} catch (Exception e) {
		e.printStackTrace();
	}
	return rs;
} 

	public ResultSet getResultSetForPriorityReport(String track, String sdate,
			String edate) {
		
		String str = "{CALL wsr_grid_priority_report_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);
	}

	public ResultSet getResultSetForPriorityNewReport(String track,
			String sdate, String edate) {
		
		String str = "{CALL wsr_grid_priority_new_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);
	}
	
	

	public ResultSet getResultSetForPriorityOpenReport(String track,
			String sdate, String edate) {
		
			String str = "{CALL wsr_grid_priority_open_proc(?,?,?,?)}";
		
			return getResultSetForAllReport(str,track,sdate,edate);
	}

	public ResultSet getResultSetForPriorityCloseReport(String track,
			String sdate, String edate) {
		
		String str = "{CALL wsr_grid_priority_close_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);
	}

	public ResultSet getResultSetForMonthlyPriorityReport(String track,
			String sdate, String edate) {
		
		String str = "{CALL wsr_grid_priority_mly_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);
	}

	public ResultSet getResultSetForWeeklyPriorityReport(String track,
			String sdate, String edate) {
		
		String str = "{CALL wsr_grid_priority_wly_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);
	}

	public ResultSet getResultSetForStatusReport(String track, String sdate,
			String edate) {
		
		String str = "{CALL wsr_grid_status_report_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);
	}

	public ResultSet getResultSetForWeeklyStatusReport(String track,
			String sdate, String edate) {
		
		String str = "{CALL wsr_grid_status_wly_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);
	}

	public ResultSet getResultSetForMonthlyStatusReport(String track,
			String sdate, String edate) {
		
		String str = "{CALL wsr_grid_status_mly_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);
	}

	


	


	public ResultSet getResultSetForMonthlyOpenPriorityReport(String track,
			String sdate, String edate) {
String str = "{CALL wsr_grid_priority_opn_mly_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);

}
	public ResultSet getResultSetForWeeklyOpenPriorityReport(String track,
			String sdate, String edate) {
String str = "{CALL wsr_grid_priority_opn_wly_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);

}
	public ResultSet getResultSetForMonthlyClosePriorityReport(String track,
			String sdate, String edate) {
String str = "{CALL wsr_grid_priority_cls_mly_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);

}
	public ResultSet getResultSetForWeeklyClosePriorityReport(String track,
			String sdate, String edate) {
String str = "{CALL wsr_grid_priority_cls_wly_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);

}
	
	public ResultSet getResultSetForTicketAgeOpen(String track,
			String sdate, String edate) {
String str = "{CALL wsr_grid_ticketage_opn_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);

}
	public ResultSet getResultSetForTicketAgeResolved(String track,
			String sdate, String edate) {
String str = "{CALL wsr_grid_ticketage_rslv_proc(?,?,?,?)}";
		
		return getResultSetForAllReport(str,track,sdate,edate);

}
	
	
	
	
}
