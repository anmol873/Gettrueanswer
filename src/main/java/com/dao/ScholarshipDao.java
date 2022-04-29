package com.dao;

import com.helper.ConnectionProvider;
import java.sql.*;
import com.Entities.*;
public class ScholarshipDao 
{
	private Connection connection;
	ScholarshipDao(Connection connection)
	{
		this.connection = connection;
	}
	
	public boolean addInternationalScholarship(InternationalScholarship sch)
	{
		try
		{
			PreparedStatement pstmt = connection.prepareStatement("insert into ");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return true;
	}
}
