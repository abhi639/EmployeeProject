package com.employee.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MyDbconnection {

	public Connection con;
	
	
	
	public Connection getMyconnection()
	{
		
		try {
			
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/employees","root","pass");  
		
		}
		catch(Exception e) {
			
			System.out.println(e.getMessage());
		}
		
		return con;
		
	} 
	
}
