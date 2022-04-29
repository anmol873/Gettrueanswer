package com.blogs.entities;

import java.sql.*;
public class Post 
{
	private int p_id;
	private String p_title;
	private String p_content;
	private Timestamp date;
	private int c_id;
	private int user_id;
	String p_Description;
	String post_pic;
	public Post()
	{
		
	}
	public Post(String p_title,String p_content,int c_id,int user_id)

	{
//		this.p_id = p_id;
		this.p_title = p_title;
		this.p_content = p_content;
		this.c_id = c_id;
		this.user_id = user_id;
	}
	public Post(int p_id,String p_title,String p_content,Timestamp date,int c_id,int user_id,String p_Description,String post_pic)
	{
		this.p_id = p_id;
		this.p_title = p_title;
		this.p_content = p_content;
		this.date = date;
		this.c_id = c_id;
		this.user_id = user_id;
		this.p_Description = p_Description;
		this.post_pic = post_pic;
		
	}
	public Post(String p_title,String p_content,int c_id,int user_id,String p_Description,String post_pic)
	{
		this.p_title = p_title;
		this.p_content = p_content;
		this.c_id = c_id;
		this.user_id = user_id;
		this.p_Description = p_Description;
		this.post_pic = post_pic;
	}
	
	//getter and setter methods
	public void setPId(int p_id)
	{
		this.p_id = p_id;
	}
	public void setPTitle(String p_title)
	{
		this.p_title = p_title;
	}
	
	public void setPContent(String p_content)
	{
		this.p_content = p_content;
	}
	
	public void setDateTime(Timestamp date)
	{
		this.date = date;
	}
	
	public void setCId(int c_id)
	{
		this.c_id = c_id;
	}
	public void setUserId(int user_id)
	{
		this.user_id = user_id;
	}
	
	public void setDescription(String p_Description)
	{
		this.p_Description = p_Description;
	}
	
	public void setPostPic(String post_pic)
	{
		this.post_pic = post_pic;
	}
	
	//getters methods
	
	public int getPId()
	{
		return p_id;
	}
	public String getTitle()
	{
		return p_title;
	}
	public String getContent()
	{
		return p_content;
	} 
	
	public Timestamp getDate()
	{
		return date;
	}
	
	public int getCId()
	{
		return c_id;
	}
	
	public int getUserId()
	{
		return user_id;
	}
	
	public String getpDescription()
	{
		return this.p_Description;
	}
	
	public String getpPic()
	{
		return this.post_pic;
	}
} 