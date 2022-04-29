package com.blogs.servlets;

//import javax.annotation.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.blogs.entities.*;
import java.io.PrintWriter;
import com.blogs.helper.*;
import com.blogs.dao.*;

@MultipartConfig
@WebServlet("/RegisterServlet")
public class Signup extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) {

		String check = request.getParameter("check");
		try {
			PrintWriter out = response.getWriter();
			if(check == null)
			{
				out.print("box not Checked");
			}
			else 
			{
				String name = request.getParameter("userName");
//				out.println(name);
				String email = request.getParameter("email");
//				out.println(email);
				String password = request.getParameter("password");
//				out.println(password);
				String gender = request.getParameter("gender");
//				out.print ln(gender);
				
				User user = new User(name,email,password,gender);
				
				UserDao dao= new UserDao(ConnectionProvider.getConnection());
				boolean status = dao.insertUser(user);
				if(status)
				{
					out.println("done");
				}
				else
				{
					out.println("error");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
