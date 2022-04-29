package com.blogs.entities;

//import java.security.Timestamp;
import java.sql.Timestamp;
public class User {
	private int id;
	private String name;
	private String email;
	private String gender;
	private String password;
	private Timestamp dateTime;
	private String profile;
	public User(int id, String name, String email, String password, String gender, Timestamp dateTime) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.dateTime = dateTime;
	}

	public User() {

	}

	
	public User(String name, String email, String password, String gender) {
//		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.dateTime = dateTime;
	}

//	setters method

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public void setDate(Timestamp timestamp)
	{
		this.dateTime = dateTime;
	}
	
	public void setProfile(String profile)
	{
		this.profile = profile;
	}
	
	//geters method
	
	public int getId()
	{
		return this.id;
	}
	
	public String getName()
	{
		return this.name;
	}
	public String getEmail()
	{
		return this.email;
	}
	public String getPassword()
	{
		return this.password;
	}
	public String getGender()
	{
		return this.gender;
	}
	
	public String getProfile()
	{
		return this.profile; 
	}
	public Timestamp getDateTime()
	{
		return this.dateTime;
	}
	

}
