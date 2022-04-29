package com.dao;

import java.sql.*;
import com.Entities.*;
public class AdminDao 
{
	private Connection connection;
	public 	AdminDao()
	{
		
	}
	public AdminDao(Connection connection)
	{
		this.connection = connection;
	}
	//setter methods
	
	//get user by email id;
	public Admin getUser(String email,String password)
	{
		Admin admin = null;
		System.out.println(connection);
		try
		{
			System.out.println("1");
			String querry = "select * from AdminDetail where Admin_Email = ? and Admin_password = ?";
			PreparedStatement pstmt = connection.prepareStatement(querry);
			System.out.println("2");
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			System.out.println("3");
			ResultSet rs = pstmt.executeQuery();
			System.out.println(rs);
			while(rs.next())
			{
				admin = new Admin();
				String adminName = rs.getString(2);
				String adminEmail = rs.getString(3);
				String password1 = rs.getString(4);
				admin.setAdminEmail(adminEmail);
				admin.setAdminName(adminName);
				admin.setAdminPassword(password1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return admin;
	}
	
}
