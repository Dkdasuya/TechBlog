 	package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
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
    	String useremail = request.getParameter("email");
    	String password = request.getParameter("password");
    	UserDao  dao = new UserDao(ConnectionProvider.getConnection());
    	User user = dao.getUserByEmailAndPassword(useremail, password);
    	PrintWriter out = response.getWriter();
    	
    	if(user == null) {
    		//error login
    		//out.println("error logging in");
    		Message msg = new Message("Invalid details try with another","error","alert-danger");
    		
    		HttpSession session = request.getSession();
    		session.setAttribute("msg", msg);
    		response.sendRedirect("login_page.jsp");
    		
    	}else {
    		HttpSession s = request.getSession();
    		s.setAttribute("currentUser", user);
    		response.sendRedirect("profile.jsp");
    	}
    }

}
