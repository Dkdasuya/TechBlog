package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	//fetch all data
    	
    	String email = request .getParameter("user_email");
    	String name = request .getParameter("user_name");
    	String password = request .getParameter("user_password");
    	String about = request .getParameter("user_about");
    	Part part = request.getPart("image");
    	String imageName = part.getSubmittedFileName();
    	
    	//get the user fromm the session 
    	HttpSession session = request.getSession();
    	User user = (User)session.getAttribute("currentUser");
    	user.setEmail(email);
    	user.setName(name);
    	user.setPassword(password);
    	user.setAbout(about);
    	String oldfile=user.getProfile();
    	user.setProfile(imageName);
    	
    	//update the data in the datat=base
    	
    	UserDao dao = new UserDao(ConnectionProvider.getConnection());
    	boolean ans = dao.updateUser(user);
    	PrintWriter out  = response.getWriter();
    	if(ans) {
    		
    		@SuppressWarnings("deprecation")
			String path = request.getRealPath("/")+"pics"+File.separator+user.getProfile();
    		Helper.deleteFile(path);
    		if(Helper.saveFile(part.getInputStream(), path)) {
    			Message msg = new Message("Profile Updated","success","alert-success");
        		
        		
        		session.setAttribute("msg", msg);
    		}else {
    			Message msg = new Message("Something went wrong","error","alert-danger");
        		
        		
        		session.setAttribute("msg", msg);
    		}

    		
    	}
    	else {
//    		Message msg = new Message("Something went wrong","error","alert-danger");
//    		
//    		
//    		session.setAttribute("msg", msg);
    	}
    	response.sendRedirect("profile.jsp");
    }
    

}
