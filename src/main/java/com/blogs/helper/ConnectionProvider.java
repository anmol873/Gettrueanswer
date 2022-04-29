package com.blogs.helper;

import java.sql.*;
public class ConnectionProvider
{
	private static Connection connection = null;
	
	public static Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogs","root","masterkey");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.println("The value of Connection "+connection);
		return connection;
		
	}
}
