package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LikeServlet
 */
@MultipartConfig
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
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
    	String operation = request.getParameter("operation");
    	int userid = Integer.parseInt(request.getParameter("uid"));
    	int postid = Integer.parseInt(request.getParameter("pid"));
    	PrintWriter out = response.getWriter();
//    	out.println("data from server");
//    	out.println(userid);
//    	out.println(postid);
//    	out.println(operation);
    	LikeDao dao  = new LikeDao(ConnectionProvider.getConnection());
    	boolean f=false;
    	if(operation.equals("like")) {
    		if(dao.isLikedByUser(postid, userid)) {
    			
    		}else {
        		 f=dao.insertLike(postid, userid);
        		 f=true;
    		}
    		out.println(f);
    	}
    	
    }

}
