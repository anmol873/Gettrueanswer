package com.blogs.servlets;
import javax.servlet.http.HttpServlet;
import com.blogs.entities.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.blogs.dao.*;
import com.blogs.helper.*;
import com.blogs.helper.ConnectionProvider;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import com.blogs.entities.User;
@MultipartConfig
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	{
		//fetching the user name and the password from the user
		
		String userEmail = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDao user = new UserDao(ConnectionProvider.getConnection());
		
		User u = user.getUserByEmail(userEmail, password);
		if(u == null)
		{
			//login error
			try {
				Message msg = new Message("Invalid Details","error","alert-danger");
				HttpSession session = request.getSession();
				session.setAttribute("message", msg);
				response.sendRedirect("login-page.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			//login success
			HttpSession session = request.getSession();
			session.setAttribute("currentUser",u);
			try
			{
				response.sendRedirect("profile.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		
		}
	}
}
