<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.tech.blog.entities.*" %>
    
    <%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    response.setHeader("pragma", "no-cache");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel= "stylesheet" href="css/style.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<%@include file="normalNavBar.jsp" %>

	<main class="d-flex align-items-center primary-background " style="height:78vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-plus fa-3x"></span>
							<p>Login Here!</p>
						</div>
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
						
						<div class="card-body">
							<form action="LoginServlet" method="post">
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
							    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							  </div>
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
							  </div>
							  <div class="container text-center" >
							  <button type="submit" class="btn btn-primary">Submit</button>
							  </div>
							</form>
						</div>
					</div>
				
				</div>
			
			</div>
		
		</div>
	
	</main>

	<script
	  src="https://code.jquery.com/jquery-2.2.4.min.js"
	  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	  crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<!-- <script type="text/javascript" src="js/myjs.js"></script> -->
</body>
</html>