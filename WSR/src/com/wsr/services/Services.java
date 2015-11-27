package com.wsr.services;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import oracle.jdbc.driver.OracleTypes;

import com.wsr.dao.ReportGenerationDao;
import com.wsr.pojos.BarebonePJ;

public class Services {

	private Map<String, ResultSet> m;
	private ReportGenerationDao repDao = new ReportGenerationDao();

	public ArrayList<BarebonePJ> getdataforReporttable(ResultSet rs) {
		ArrayList<BarebonePJ> v = new ArrayList<BarebonePJ>();
		try {

			ResultSetMetaData rsmd = rs.getMetaData();
		

			BarebonePJ bobj;
			bobj = new BarebonePJ();
int colnumber=rsmd.getColumnCount();

if(colnumber==1 && colnumber<2)
{
			bobj.setCol1(rsmd.getColumnName(1));
}
else if(colnumber==2 && colnumber<3)
{

	bobj.setCol1(rsmd.getColumnName(1));
	bobj.setCol2(rsmd.getColumnName(2));
} 
else if(colnumber==3 && colnumber<4)
{
	bobj.setCol1(rsmd.getColumnName(1));
	bobj.setCol2(rsmd.getColumnName(2));
	bobj.setCol3(rsmd.getColumnName(3));
} 
else if(colnumber==4 && colnumber<5)
{
	bobj.setCol1(rsmd.getColumnName(1));
	bobj.setCol2(rsmd.getColumnName(2));
	bobj.setCol3(rsmd.getColumnName(3));
	bobj.setCol4(rsmd.getColumnName(4));

} 
else if(colnumber==5 && colnumber<6)
{
	bobj.setCol1(rsmd.getColumnName(1));
	bobj.setCol2(rsmd.getColumnName(2));
	bobj.setCol3(rsmd.getColumnName(3));
	bobj.setCol4(rsmd.getColumnName(4));
	bobj.setCol5(rsmd.getColumnName(5));

} 
else if(colnumber==6 && colnumber<7)
{ 
	bobj.setCol1(rsmd.getColumnName(1));
	bobj.setCol2(rsmd.getColumnName(2));
	bobj.setCol3(rsmd.getColumnName(3));
	bobj.setCol4(rsmd.getColumnName(4));
	bobj.setCol5(rsmd.getColumnName(5));
	bobj.setCol6(rsmd.getColumnName(6));
	
} 
else if(colnumber==7 && colnumber<8)
{
	bobj.setCol1(rsmd.getColumnName(1));
	bobj.setCol2(rsmd.getColumnName(2));
	bobj.setCol3(rsmd.getColumnName(3));
	bobj.setCol4(rsmd.getColumnName(4));
	bobj.setCol5(rsmd.getColumnName(5));
	bobj.setCol6(rsmd.getColumnName(6));
	bobj.setCol7(rsmd.getColumnName(7));
	
} 




		
			v.add(bobj);

			bobj = null;

			while (rs.next()) {
				bobj = new BarebonePJ();

				if(colnumber==1 && colnumber<2)
				{
							bobj.setCol1(rs.getString(1));
				}
				else if(colnumber==2 && colnumber<3)
				{
					bobj.setCol1(rs.getString(1));
					bobj.setCol2(rs.getString(2));
				} 
				else if(colnumber==3 && colnumber<4)
				{
					bobj.setCol1(rs.getString(1));
					bobj.setCol2(rs.getString(2));
					bobj.setCol3(rs.getString(3));
				} 
				else if(colnumber==4 && colnumber<5)
				{
					bobj.setCol1(rs.getString(1));
					bobj.setCol2(rs.getString(2));
					bobj.setCol3(rs.getString(3));
					bobj.setCol4(rs.getString(4));

				} 
				else if(colnumber==5 && colnumber<6)
				{
					bobj.setCol1(rs.getString(1));
					bobj.setCol2(rs.getString(2));
					bobj.setCol3(rs.getString(3));
					bobj.setCol4(rs.getString(4));
					bobj.setCol5(rs.getString(5));

				} 
				else if(colnumber==6 && colnumber<7)
				{
					bobj.setCol1(rs.getString(1));
					bobj.setCol2(rs.getString(2));
					bobj.setCol3(rs.getString(3));
					bobj.setCol4(rs.getString(4));
					bobj.setCol5(rs.getString(5));
					bobj.setCol6(rs.getString(6));
					
				} 
				else if(colnumber==7 && colnumber<8)
				{
					bobj.setCol1(rs.getString(1));
					bobj.setCol2(rs.getString(2));
					bobj.setCol3(rs.getString(3));
					bobj.setCol4(rs.getString(4));
					bobj.setCol5(rs.getString(5));
					bobj.setCol6(rs.getString(6));
					bobj.setCol7(rs.getString(7));
					
				} 

				
				/*bobj.setCol6(rs.getString(6));*/
				v.add(bobj);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	

	public Map<String, ResultSet> getData(String track, String sdate,
			String edate) {

		m = new LinkedHashMap<String, ResultSet>();
		m.put("Priority", repDao.getResultSetForPriorityReport(track, sdate, edate));
		m.put("Priority Close", repDao.getResultSetForPriorityCloseReport(track,sdate, edate));
		m.put("Priority Open",repDao.getResultSetForPriorityOpenReport(track, sdate, edate));
		m.put("Priority New", repDao.getResultSetForPriorityNewReport(track, sdate,edate));
		m.put("Priority Monthly", repDao.getResultSetForMonthlyPriorityReport(track, sdate, edate));
		m.put("Priority Weekly", repDao.getResultSetForWeeklyPriorityReport(track, sdate, edate));
		 m.put("Priority Monthly Open", repDao.getResultSetForMonthlyOpenPriorityReport(track, sdate, edate));
		 m.put("Priority Monthly Close", repDao.getResultSetForMonthlyClosePriorityReport(track, sdate, edate));
		 m.put("Priority Weekly Open", repDao.getResultSetForWeeklyOpenPriorityReport(track, sdate, edate));
		 m.put("Priority Weekly Close ", repDao.getResultSetForWeeklyClosePriorityReport(track, sdate, edate));
		 m.put("Status", repDao.getResultSetForStatusReport(track, sdate, edate));
		 m.put("Status Monthly", repDao.getResultSetForMonthlyStatusReport(track,sdate, edate));
		 m.put("Status Weekly", repDao.getResultSetForWeeklyStatusReport(track, sdate, edate));
		 m.put("Ticket Age Open", repDao.getResultSetForTicketAgeOpen(track, sdate, edate));
		 m.put("Ticket Age Resolved", repDao.getResultSetForTicketAgeResolved(track, sdate, edate));
		 
		 
		 
		
		//.println(m);

		return m;

	}

	public ResultSet getResultSetForReport(String app, String sdate,
			String edate, String typeofReport) {
		Dbconnection con = new Dbconnection();

		ResultSet rs = null;
		try {
			Connection conn = con.getconnection();

			String procQry = "{CALL wsr_grid_CHOICE_proc(?,?,?,?)}";
			String finalQry = null;

			if (typeofReport.equalsIgnoreCase("status_report")) {
				finalQry = procQry.replaceAll("CHOICE", "status_report");

			} else if (typeofReport.equalsIgnoreCase("priority_report")) {
				finalQry = procQry.replaceAll("CHOICE", "priority_report");
			}

			else if (typeofReport.equalsIgnoreCase("ticketage_open")) {
				finalQry = procQry.replaceAll("CHOICE", "ticket_age_open");
			} else if (typeofReport.equalsIgnoreCase("ticketage_rslv")) {
				finalQry = procQry.replaceAll("CHOICE", "ticket_age_close");
			}

			//.println(finalQry);

			CallableStatement storedProc = conn.prepareCall(finalQry);
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date startdate = sdf1.parse(sdate);
			java.util.Date enddate = sdf1.parse(edate);
			java.sql.Date sqlStartDate = new java.sql.Date(startdate.getTime());
			java.sql.Date sqlEndDate = new java.sql.Date(enddate.getTime());

			storedProc.setString(1, app);
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

	public String reportPageNameGetter(String typeofReport) {

		String pageName = null;

		if (typeofReport.equalsIgnoreCase("status")) {
			pageName = "statusreport.jsp";

		} else if (typeofReport.equalsIgnoreCase("priority")) {
			pageName = "priorityreport.jsp";
		}

		else if (typeofReport.equalsIgnoreCase("ticket_age_open")) {
			pageName = "ticketageopenreport.jsp";
		} else if (typeofReport.equalsIgnoreCase("ticket_age_close")) {
			pageName = "ticketageclosereport.jsp";
		}

		return pageName;
	}

}
