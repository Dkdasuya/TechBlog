<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>


<div class="row">
<%
//Thread.sleep(500);

User user = (User)session.getAttribute("currentUser");

PostDao dao = new PostDao(ConnectionProvider.getConnection());

int cid = Integer.parseInt(request.getParameter("cid"));
List<Post> posts=null;
if(cid==0){
	 posts = dao.getAllPosts();
}else{
	posts = dao.getPostByCatId(cid);
}

if(posts.size()==0){
	out.println("<h4 class='display-3 text-center'>No posts in this category.</h4>");
	return;
}

for(Post p:posts){
	%>
	<div class="col-md-6 mt-3">
		<div class="card">
			 <img src="blog_pics/<%=p.getPpic() %>" class="card-img-top" alt="...">
			<div class="card-body">
				<b><%=p.getPtitle() %></b>
				<p> <%=p.getContent() %></p>
			</div>
			<div class="card-footer primary-background">
			<%
				LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
			%>
				<a href="show_blog_post.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read more...</a>
				<%-- <a href="#" onClick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid()) %> </span></a>
				<a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> </span></a> --%>
			</div>
		
		
		</div>
	
	
	
	</div>
	<%
}
%>

</div>

<script type="text/javascript" src="js/myjs.js"></script>