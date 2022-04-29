package com.Servlets;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.Entities.*;
import com.dao.*;
import com.helper.*;
import com.helper.ConnectionProvider;

import javax.servlet.annotation.WebServlet;
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	{
		//fetching the user name and the password from the user
		
		String userEmail = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(userEmail);
		System.out.println(password);
		AdminDao dao = new AdminDao(ConnectionProvider.getConnection());
		Admin admin = dao.getUser(userEmail,password);
		HttpSession session = request.getSession();
//		String ExistingEmail = admin.getAdminEmail();
//		HttpSession session = request.getSession();
//		System.out.println(admin);
//		System.out.println(admin.getAdminEmail());
		if(admin != null)
		{
			try
			{
				
				Message message = new Message("Login Success!!","Success","alert-primary");
				session.setAttribute("message", message);
				response.sendRedirect("AddScholarship.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			Message message1 = new Message("Check Creadantionals","Error","alert-danger");
			session.setAttribute("message", message1);
			try 
			{
				response.sendRedirect("admin.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
}
