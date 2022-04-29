package com.blogs.dao;

import java.sql.*;
import java.util.ArrayList;
import com.blogs.entities.Post;
import com.blogs.entities.Categories;
public class PostDao 
{
	private Connection connection;
	
	public PostDao(Connection connection)
	{
		this.connection = connection;
	}
	
	public ArrayList<Categories> getCategory()
	{
		ArrayList<Categories> list = new ArrayList<>();
		try
		{
			String querry = "select * from categories";
			
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(querry);
			
			while(rs.next())
			{
				int cid = rs.getInt("c_id");
				String cTitle = rs.getString("c_title");
				String cDescription = rs.getString("c_description");
				Categories cat = new Categories(cid,cTitle,cDescription);
				list.add(cat);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
		
	}
	public boolean addPost(Post post)
	{
		boolean status = false;
		try {
			String querry = "insert into posts(p_title,p_content,p_date,c_id,user_id,p_description,post_pic) values(?,?,now(),?,?,?,?)";
			PreparedStatement pstmt = connection.prepareStatement(querry);
			pstmt.setString(1, post.getTitle());
			pstmt.setString(2, post.getContent());
			pstmt.setInt(3,post.getCId());
			pstmt.setInt(4, post.getUserId());
			pstmt.setString(5,post.getpDescription());
			pstmt.setString(6, post.getpPic());
			pstmt.execute();
			status = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	
	//this is for fetch and adding the blogs to the page
	
	public ArrayList<Post> getPost()
	{
		ArrayList <Post> list = new ArrayList<>();
		try 
		{
			String querry = "select * from posts";
			PreparedStatement pstmt = connection.prepareStatement(querry);
			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next())
			{
				int pid = resultSet.getInt("p_id");
				String p_title = resultSet.getString("p_title");
				String p_content = resultSet.getString("p_content");
				Timestamp datetime = resultSet.getTimestamp("p_date");
				int c_id = resultSet.getInt("c_id");
				int user_id = resultSet.getInt("user_id");
				String p_Discription = resultSet.getString("p_description");
				String p_pic = resultSet.getString("post_pic");
				Post post = new Post(pid,p_title,p_content,datetime,c_id,user_id,p_Discription,p_pic);
				list.add(post);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public Post getPost(int p_id)
	{
		Post post = null;
		try
		{
			String querry = "select * from posts where p_id = ?";
			PreparedStatement pstmt = connection.prepareStatement(querry);
			pstmt.setInt(1,p_id);
			ResultSet resultSet = pstmt.executeQuery();
			System.out.println(p_id);
			if(resultSet.next())
			{
				int pid = resultSet.getInt("p_id");
				String p_title = resultSet.getString("p_title");
				String p_content = resultSet.getString("p_content");
				Timestamp datetime = resultSet.getTimestamp("p_date");
				int c_id = resultSet.getInt("c_id");
				int user_id = resultSet.getInt("user_id");
				post = new Post(pid,p_title,p_content,datetime,c_id,user_id,null,null);
			}
					
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return post;
	}
	public ArrayList<Post> getPostByCid(int C_id)
	{
		ArrayList <Post> list = new ArrayList<>();
		try 
		{
			String querry = "select * from posts where c_id = ?";
			PreparedStatement pstmt = connection.prepareStatement(querry);
			pstmt.setInt(1, C_id);
			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next())
			{
				int pid = resultSet.getInt("p_id");
				String p_title = resultSet.getString("p_title");
				String p_content = resultSet.getString("p_content");
				Timestamp datetime = resultSet.getTimestamp("p_date");
				int c_id = resultSet.getInt("c_id");
				int user_id = resultSet.getInt("user_id");
				String p_Discription = resultSet.getString("p_description");
				String p_pic = resultSet.getString("post_pic");
				Post post = new Post(pid,p_title,p_content,datetime,c_id,user_id,p_Discription,p_pic);
				list.add(post);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
}
