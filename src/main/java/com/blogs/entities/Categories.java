package com.blogs.entities;

public class Categories 
{
	private int c_id;
	private String c_title;
	private String c_discription;
	
	public Categories()
	{
		
	}
	public Categories(int c_id,String c_title,String c_discription)
	{
		this.c_id = c_id;
		this.c_title = c_title;
		this.c_discription = c_discription;
	}
	
	//getter and setter methods
	
	
	public void setCId(int c_id)
	{
		this.c_id = c_id;
	}
	public void setCTitle(String c_Title)
	{
		this.c_title = c_Title;
	}
	public void setCDescription(String c_Description)
	{
		this.c_discription = c_Description;
	}
	
	//getters method
	
	public int getCID()
	{
		return c_id;
	}
	
	public String getCTitle()
	{
		return c_title;
	}
	
	public String getCDescription()
	{
		return c_discription;
	}
}
