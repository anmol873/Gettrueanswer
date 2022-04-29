package com.blogs.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import com.blogs.dao.UserDao;
import com.blogs.entities.User;
import com.blogs.helper.ConnectionProvider;
import com.blogs.helper.Helper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blogs.dao.UserDao;
import com.blogs.entities.User;
import com.blogs.helper.ConnectionProvider;
import com.blogs.entities.*;
/**
 * Servlet implementation class EditServlet
 */
//@MultipartConfig
@WebServlet("/EditServlet")
@MultipartConfig(maxFileSize = 16177215)  
public class EditServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	{
		String userEmail = request.getParameter("email_id");
		String userName = request.getParameter("name");
		Part part = request.getPart("profile-pic");
		InputStream inputStream = part.getInputStream();
		if (part != null) {
            // prints out some information for debugging
            System.out.println(part.getName());
            System.out.println(part.getSize());
            System.out.println(part.getContentType());
              
            // obtains input stream of the upload file
            //inputStream = filePart.getInputStream();
        }
//		Part part = request.getPart("profile-pic");
		String imageName = part.getSubmittedFileName();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");
//		user.setEmail(userEmail);
		if(userName.isEmpty())
		{
			userName = user.getName();
		}
		if(userEmail.isEmpty())
		{
			userEmail = user.getEmail();
		}
//		out.println(user.getId());
//		user.setName(userName);
		user.setEmail(userEmail);
		user.setId(user.getId());
		user.setProfile(imageName);
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		out.println(user.getName());
		boolean status = userDao.updateUser(user);
		out.println(user.getName());
		if(status)
		{
				String path = request.getRealPath("/")+"images"+File.separator+user.getProfile();
				Helper.deleteFile(path);
				if(Helper.saveFile(inputStream, path))
				{
					
				}
			Message msg = new Message("Profile Edit Successfully","done","alert-primary");
			session.setAttribute("message", msg);
		}
		else
		{
			Message msg = new Message("some thing went wrong","done","alert-danger");
			session.setAttribute("message", msg);
		}
		response.sendRedirect("profile.jsp");
		out.println(status);
		
		
		
		
		
		
	}
}
