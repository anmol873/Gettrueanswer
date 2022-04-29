package com.blogs.dao;
import com.blogs.entities.User;

//import java.sql.Timestamp;
import java.sql.*;

import javax.servlet.annotation.MultipartConfig;
//import java.security.Timestamp;
//import java.sql.Timestamp;

@MultipartConfig
public class UserDao 
{
	private User user = null;
	private Connection connection;
	
	public UserDao(Connection connection)
	{
		this.connection = connection;
	}
	
	//method to insert user to database 
	
	public boolean insertUser(User user)
	{
		boolean status = false;
		try
		{
			
			String querry =  "insert into user(user_name,user_email,user_password,user_gender,r_date) values(?,?,?,?,now())";
			PreparedStatement pstmt = this.connection.prepareStatement(querry);
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			pstmt.setString(4, user.getGender());
			
			pstmt.executeUpdate();
			status = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	public User getUserByEmail(String email,String password)
	{
		try 
		{
			String querry = "select * from user where user_email = ? and user_password = ?";
			PreparedStatement pstmt = connection.prepareStatement(querry);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				 user = new User();
				 
				 //this will set the id of the user
				 int id = rs.getInt("user_id");
				 user.setId(id);
				 
				 //now this will set the name of the user
				 
				 String name = rs.getString("user_name");
				 user.setName(name);
				 
				 //this will set the mail of the user
				 
				 user.setEmail(rs.getString("user_email"));
				 
				 //now this will set the password of the user
				 
				 user.setPassword(rs.getString("user_password"));
				 
				 //this will set the gender of the user
				 user.setGender(rs.getString("user_gender"));
				 
				 //this will set the registration date of the user
				 
				 user.setDate(rs.getTimestamp("r_date"));
				 
				 //this will set the profile pic of the user
				 
				 user.setProfile(rs.getString("user_profile"));
				 
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return user;
	}
	 
	public boolean updateUser(User user)
	{
		boolean status = false;
		try {
			String querry = "update user set user_name = ? ,user_email = ?,user_profile =? where user_id  = ?";
			PreparedStatement pstmt = connection.prepareStatement(querry);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getProfile());
			pstmt.setInt(4,user.getId());
			pstmt.executeUpdate();
			status = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
}
