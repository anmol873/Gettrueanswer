package com.Entities;

public class InternationalScholarship {
	private String NameOfScholarship;
	private String ScholarType;
	private String ScholarCategory;
	private String ScholarCountry;
	private float ScholarAmount;
	private String CandidateGender;

	InternationalScholarship() {

	}

	InternationalScholarship(String NameOfScholarship, String ScholarType, String ScholarCategory,
			String ScholarCountry, float ScholarAmount, String CandidateGender) {

	}

	public String getNameOfScholarship() {
		return NameOfScholarship;
	}

	public void setNameOfScholarship(String nameOfScholarship) {
		NameOfScholarship = nameOfScholarship;
	}

	public String getScholarType() {
		return ScholarType;
	}

	public void setScholarType(String scholarType) {
		ScholarType = scholarType;
	}

	public String getScholarCategory() {
		return ScholarCategory;
	}

	public void setScholarCategory(String scholarCategory) {
		ScholarCategory = scholarCategory;
	}

	public String getScholarCountry() {
		return ScholarCountry;
	}

	public void setScholarCountry(String scholarCountry) {
		ScholarCountry = scholarCountry;
	}

	public float getScholarAmount() 
	{
		return ScholarAmount;
	}

	public void setScholarAmount(float scholarAmount) 
	{
		ScholarAmount = scholarAmount;
	}

	public String getCandidateGender() {
		return CandidateGender;
	}

	public void setCandidateGender(String candidateGender) {
		CandidateGender = candidateGender;
	}

}