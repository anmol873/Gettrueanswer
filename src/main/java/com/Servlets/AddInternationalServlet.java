package com.Servlets;

import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import com.Entities.Message;
import javax.servlet.annotation.WebServlet;

@WebServlet("/AddInternationalServlet")
public class AddInternationalServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		String scholarshipName = request.getParameter("scholarshipName");
		String gender = request.getParameter("gender");
		double amount = Double.parseDouble(request.getParameter("amount"));
		String Discription = request.getParameter("Discription");
		String Courses = request.getParameter("courses");
		String externalLink = request.getParameter("link");
		String criterea = request.getParameter("criterea");
		System.out.println("The name of the scholarship is" + scholarshipName);
		System.out.println("The amount of the sdcholarship is " + amount);
		System.out.println("The Discription " + Discription);
		System.out.println("The Gender is "+gender);
		System.out.println("The Courses is "+Courses);
		System.out.println("The Courses is "+externalLink);
		System.out.println("The criterea is "+criterea);
		
		try 
		{
			response.sendRedirect("AddInternationalscholarship.jsp");
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
