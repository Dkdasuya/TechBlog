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

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
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
    	PrintWriter out = response.getWriter();
    	int cid = Integer.parseInt(request.getParameter("cid"));
    	String ptitle = request.getParameter("pTitle");
    	String pContent = request.getParameter("pContent");
    	String pCode = request.getParameter("pCode");
    	Part part = request.getPart("pPic");
    	HttpSession session = request.getSession();
    	//getting current userID
    	User user = (User)session.getAttribute("currentUser");
    	Post post = new Post(ptitle,pCode,pContent,part.getSubmittedFileName(),cid,user.getId());
    	PostDao dao = new PostDao(ConnectionProvider.getConnection());
    	if(dao.savePost(post)) {
    		out.println("done");
    		String path = request.getRealPath("/")+"blog_pics"+File.separator+part.getSubmittedFileName();
    		Helper.saveFile(part.getInputStream(), path);
    	}else {
    		out.println("errorr");
    	}
//    	out.println(ptitle);
//    	out.println(part.getSubmittedFileName());
    }

}
