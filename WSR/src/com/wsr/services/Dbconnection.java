package com.wsr.services;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnection {

	public Connection  getconnection() throws ClassNotFoundException, SQLException 
	{
		
		 Connection con=null;
		   
		   
		    // Class.forName("com.mysql.jdbc.Driver");
		    //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/northwind","syed","135791");
		 Class.forName("oracle.jdbc.driver.OracleDriver");  

		//step2 create  the connection object  
		 con=DriverManager.getConnection("jdbc:Oracle:thin:@OCSDDEVDB:1521/OCSDDEV3_SRV","ocs_admin","ocs#maint123");   
		        
		     return con;
		
		

	
	
}

}
