package com.blogs.servlets;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blogs.helper.ConnectionProvider;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import java.io.File;
import com.blogs.entities.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import com.blogs.dao.*;
import com.blogs.helper.*;
@WebServlet("/AddPostServlet")
@MultipartConfig(maxFileSize = 16177215)  
public class AddPostServlet extends HttpServlet 
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		String cat = request.getParameter("category");
//		int c_id = 1;
		String postTitle = request.getParameter("post-title");
		String postContent = request.getParameter("post-content");
		String postDescription = request.getParameter("post-description");
		Part part = request.getPart("blog-picture");
		System.out.println(postDescription);
		InputStream inputStream = part.getInputStream();
		HttpSession session = null;
		PrintWriter out = null;
		if(cat == null)
		{
			cat = "5";
		}
		int c_id = Integer.parseInt(cat);
		try {
//			System.out.println("called");
			out = response.getWriter();
			out.println("Post Title is "+postTitle);
			session = request.getSession();
			out.println(session.getAttribute("currentUser"));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		String imageName = part.getSubmittedFileName();
		User user = (User)session.getAttribute("currentUser");
		Post post = new Post(postTitle,postContent,c_id,user.getId(),postDescription,imageName);
//		System.out.println(imageName);
		PostDao pDao = new PostDao(ConnectionProvider.getConnection());
		
		boolean status = pDao.addPost(post);
		
		
		if(status)
		{
			String path = request.getRealPath("/")+"images"+File.separator+post.getpPic();
			Helper.deleteFile(path);
			if(Helper.saveFile(inputStream, path))
			{
				
			}
			
			Message message = new Message("Blogs Added Successfully","Sucess","alert-primary");
			session.setAttribute("message", message);
			response.sendRedirect("profile.jsp");
		}
		else
		{
			Message message = new Message("Some error Happened","Error","alert-danger");
			session.setAttribute("message", message);
//			out.println("Some error Happened");
		}
	}
}
