<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.tech.blog.entities.*" errorPage="error_page.jsp" %>
    <%@page import="com.tech.blog.dao.*" %>
    <%@page import="com.tech.blog.helper.*" %>
    <%@page import="java.util.*" %>
    <%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    response.setHeader("pragma", "no-cache");
    %>
    <%
    	User user =(User) session.getAttribute("currentUser");
    	if(user ==null){
    		response.sendRedirect("login_page.jsp");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel= "stylesheet" href="css/style.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<!-- navbar -->
 
 <nav class="navbar navbar-expand-lg navbar-light primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-code"></span>   Tech DisqsOne</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <!-- <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li> -->
      <li class="nav-item">
        <a class="nav-link" href="#"> <span class="	fa fa-address-book-o"></span> Contact Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-product-hunt"></span> Post</a>
      </li>
    </ul>
	<ul class="navbar-nav mr-right">
	
	
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"> <span class="	fa fa-user-circle"></span> <%=user.getName() %></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"> <span class="	fa fa-user-plus"></span> Logout</a>
      </li>
	
	</ul>
  </div>
</nav>
 
 
<!-- end of navbar -->
<%
							Message m = (Message)session.getAttribute("msg");		
							if(m!=null){
								%>
								<div class="alert alert-primary <%=m.getCssClass()	 %>" role="alert">
								  <%=m.getContent() %>
								</div>
								
								<%
								session.removeAttribute("msg");
							}
						%>
						
						
<!-- main body of the page -->

	<main>  
		
		<div class="container">
			<div class="row mt-4">
				<!-- first coloumn -->
				<div class="col-md-4">
					<!-- list of categories -->
					<div class="list-group">
					  <a href="#" onClick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
					    All Posts
					  </a>
					  <!-- Categories -->
					  
					  <%
					  	PostDao dao = new PostDao(ConnectionProvider.getConnection());
					  	ArrayList<Categories> list1 =dao.getCategories();
					  	for(Categories cc:list1){
					  		
					  		%>
					  		  <a href="#" onClick="getPosts(<%=cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%=cc.getName() %></a>
					  		<%
					  		
					  	}
					  %>
					  
					</div>
				</div>
				
				<!-- second coloumn -->
				<div class="col-md-8" >
					<!-- posts -->
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-3x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					
					</div>
					<div class="container-fluid" id="post-container">
					
					 </div>
				</div>
			</div>
		
		</div>
	
	
	</main>

<!-- end of the page -->

<!-- profile modal -->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
        	<img alt="" src="pics/<%=user.getProfile() %>" style="max-width:120px;border-radius:50%;">
        	<h5 class="modal-title" id="exampleModalLabel"><%=user.getName() %></h5>
        	<div id="profile-details">
        	<table class="table">
			  
			  <tbody>
			    <tr>
			      <th scope="row">ID:</th>
			      <td><%=user.getId() %></td>
			    </tr>
			    <tr>
			      <th scope="row">E-mail:</th>
			      <td><%=user.getEmail() %></td>
			    </tr>
			    <tr>
			      <th scope="row">Gender:</th>
			      <td><%=user.getGender() %></td>
			    </tr>
			    <tr>
			      <th scope="row">Status:</th>
			      <td><%=user.getAbout() %></td>
			    </tr>
			  </tbody>
			</table>
			</div>
			
			<!-- profile edit -->
			
			<div  id="profile-edit"  style="display:none;" >
			<h3 class="mt-2">Please Edit Carefully</h3>
			<form action = "EditServlet" method="post" enctype="multipart/form-data">
				<table class="table">
					<tr>
					<td>ID:</td>
					<td><%=user.getId() %></td>			
					</tr>
					
					<tr>
					<td>E-mail:</td>
					<td> <input  type="email" class="form-control" name="user_email" value="<%=user.getEmail() %>">  </td>			
					</tr>
					
					<tr>
					<td>Name:</td>
					<td> <input  type="text" class="form-control" name="user_name" value="<%=user.getName() %>">  </td>			
					</tr>
					
					<tr>
					<td>Password:</td>
					<td> <input  type="password" class="form-control" name="user_password" value="<%=user.getPassword() %>">  </td>			
					</tr>
					
					<tr>
					<td>Gender:</td>
					<td>  <%=user.getGender().toUpperCase() %> </td>			
					</tr>
					
					<tr>
					<td>Status:</td>
					<td> <textarea class="form-control" name="user_about" rows="3" cols=""><%=user.getAbout() %></textarea> </td>			
					</tr>
					
					<tr>
					<td>New Profile Pic:</td>
					<td> <input type="file" name="image" class="form-control"> </td>			
					</tr>
						
				</table>
				<div class="container" >
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			
			</form>
			</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

<!-- end of modal -->


<!-- post modal -->

	<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="add-post-form" action="AddPostServlet" method="post">
        	<div class="form-group">
        		<select class="form-control" name="cid"> 
        			<option selected disabled>---Select Category---</option>
        			<%
        				PostDao postd = new PostDao(ConnectionProvider.getConnection());
        				ArrayList<Categories> list = postd.getCategories();
        				for(Categories c :list)
        				{
        			%>
        				<option value="<%= c.getCid() %>"> <%=c.getName() %> </option>
        			
        			<%
        				}
        			%>
        		</select>
        	
        	</div>
        	
        	<div class="form-group">
        		<input name="pTitle" type="text" class="form-control" placeholder="Enter Post Title.">
        	</div>
        
        	<div class= "form-group">
        		<textarea name="pContent" class="form-control" placeholder="Enter Your Content" rows="4"></textarea>
        	</div>
        	
        	<div class= "form-group">
        		<textarea name="pCode" class="form-control" placeholder="Enter Your Code(if any)" rows="4"></textarea>
        	</div>
        	
        	<div class="form-group">
        	<label>Select Pic(if any)</label>
        	<br>
        		<input name="pPic" type="file">
        	</div>
        	<div class="container text-center">
        		<button type="submit" class="btn btn-outline-primary">Post</button>
        	</div>
        </form>
      </div>
      
    </div>
  </div>
</div>

<!-- end  of post modal -->

<script
  src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<!-- <script type="text/javascript" src="js/myjs.js"></script> -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>

	$(document).ready(function(){
		
		let editStatus = false;
		
		$('#edit-profile-button').click(function(){
			if(editStatus==false){
				$('#profile-details').hide();
				$('#profile-edit').show();
				editStatus=true;
				$(this).text('Back');
			}else{

				$('#profile-details').show();
				$('#profile-edit').hide();
				editStatus=false;
				$(this).text('Edit');
			}
		})
	})
	
	</script>
	
	<!-- Now add post javaScript -->
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$('#add-post-form').on('submit',function(event){
				//this code gets called when the form is submitted;
				event.preventDefault();
				console.log('u have submitted');
				let form = new FormData(this);
				
				//now requesting to servlet
				$.ajax({
					url:"AddPostServlet",
					type:'post',
					data:form,
					success:function(data,textStatus,jqXHR){
						//success
						if(data.trim()=='done'){
							swal("Good job!", "Posted Successfully", "success");
						}else{
							swal("Error", "Something went wrong", "success");
						}
					},
					error:function(jqXHR,textStatus,errorThrown){
						swal("Error", "Something went wrong", "success");
					},
					processData:false,
					contentType:false
				})
				
			})
			
		})
	</script>
	
	<!-- loading posts using ajax -->
	<script type="text/javascript">
	
		function getPosts(catId,temp){
			$('#loader').show();
			$('#post-container').hide();
			$('.c-link').removeClass('active');
			$.ajax({
				url:"load_posts.jsp",
				data:{cid:catId},
				success:function(data,textStatus,jqXHR){
					console.log(data);
					$('#loader').hide();
					$('#post-container').show();
					$('#post-container').html(data);
					$(temp).addClass('active');
				}
			})
		}
	
		$(document).ready(function(e){
			let allPostsRef = $('.c-link')[0];
			getPosts(0,allPostsRef);
		})
	
	</script>
	
</body>
</html>