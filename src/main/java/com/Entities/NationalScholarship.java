package com.Entities;


class NationalScholarship 
{
	String NameOfScholarship;
	String ScholarType;
	String ScholarCategory;
	String ScholarState;
	float ScholarAmount;
	String CandidateGender;
	String description;
	String caste;
	String state;
	String externalLink;
	
	NationalScholarship()
	{
		
	}
	NationalScholarship(String NameOfScholarship,String ScholarType ,
	String ScholarCategory , String ScholarState , float ScholarAmount)
	{
		this.NameOfScholarship = NameOfScholarship;
		this.ScholarType = ScholarType;
		this.ScholarCategory =ScholarCategory;
		this.ScholarState = ScholarState ;
		this.ScholarAmount = ScholarAmount;
	}
	
	//setter method
	public void  setScholarAmount(float ScholarAmount)
	{
		this.ScholarAmount = ScholarAmount;
	}
	public void  setScholarState(String ScholarState)
	{
		this.ScholarState = ScholarState ;
	}
	public void  setScholarCategory(String ScholarCategory)
	{
		this.ScholarCategory =ScholarCategory;
	}
	public void  setScholarType(String ScholarType)
	{
		this.ScholarType = ScholarType;
	}
	public void setNameOfScholarship(String NameOfScholarship)
	{
		this.NameOfScholarship = NameOfScholarship;
	}
	public void setCandidateGender(String CandidateGender)
	{
		this.CandidateGender = CandidateGender;
	}
	
	public void setDescription(String description)
	{
	    this.description = description;
	}
	public void setCaste(String caste)
	{
	    this.caste = caste;
	}
	public void setExternalLink(String externalLink)
	{
	    this.externalLink = externalLink;
	}
	
    //geter method
	public float getScholarAmount()
	{
		return ScholarAmount;
	}
	public String getScholarState()
	{
		return ScholarState;
	}
	public String getScholarCategory()
	{
		return ScholarCategory;
	}
	public String getScholarType()
	{
		return ScholarType;
	}
	public String getNameOfScholarship()
	{
		return NameOfScholarship;
	}
	public String getCandidateGender()
	{
		return CandidateGender;
	}
	public String getDescription()
	{
	    return description;
	}
	public String getCaste()
	{
	    return caste;
	}
	public String getExternalLink()
	{
	    return externalLink;
	}

}
