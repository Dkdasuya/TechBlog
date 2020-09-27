package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
    
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	String check = request.getParameter("check");
    	PrintWriter out = response.getWriter();
    	if(check==null) {
    		out.println("Please Agree with the terms and Conditions.");
    	}else {
    		
    		//fetch data from the submitted form
    		String name = request.getParameter("user_name");
    		String email = request.getParameter("user_email");
    		String password = request.getParameter("user_password");
    		String gender = request.getParameter("gender");
    		String about = request.getParameter("about");
    		
    		//create user object and set all the data to that object
    		User user = new User(name,email,password,gender,about);
    		
    		//create a user dao object
    		UserDao dao = new UserDao(ConnectionProvider.getConnection());
    		if(dao.saveUser(user)) {
    			out.println("Done");
    		}else {
    			out.println("Error");
    		}
    		
    	}

}
}
