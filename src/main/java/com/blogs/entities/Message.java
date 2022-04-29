package com.blogs.entities;

public class Message 
{
	private String content;
	private String type;
	private String cssClass;
	
	public Message(String content,String type,String cssClass)
	{
		this.content = content;
		this.type = type;
		this.cssClass = cssClass;
	}
	
	//getter and setter mehtod
	
	public void setContent(String content)
	{
		this.content = content;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public void setCssClass(String cssClass)
	{
		this.cssClass = cssClass;
	}
	
	//getter methods
	
	public String getContent()
	{
		return content;
	}
	public String getType()
	{
		return type;
	}
	public String getCssClass()
	{
		return cssClass;
	}
}
