<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" import="com.tech.blog.helper.*" %>
 <%@page import="com.tech.blog.entities.*" errorPage="error_page.jsp" %>
    <%@page import="com.tech.blog.dao.*" %>
    <%@page import="com.tech.blog.helper.*" %>
    <%@page import="java.util.*" %>
 <%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    response.setHeader("pragma", "no-cache");
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
<body >
	
	<!-- navbar -->
	<%@ include file="normalNavBar.jsp"%>
	
	<!-- banner -->
	<div class="container-fluid p-0 m-0" >
		
		<div class="jumbotron primary-background text-white">
		  <div class="container">
		  
			<h3 class="display-3">Welcome to TechBlog</h3>
			<p>Welcome to technical blog,world of technology</p>
			
			<a href="registrationPage.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-plus"></span>  Start! It's Free</a>
			<a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span> Login</a>
		  </div>
		
		
		</div>
	
	
	
	</div>
	
	<div class="container">
		
		<div class="row">
			
			<div class="col-md-4">
			<div class="card" >
			  <div class="card-body">
			    <h5 class="card-title">Java Programming</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn primary-background">Read More</a>
			  </div>
			</div>
			</div>
			
			<div class="col-md-4">
			<div class="card" >
			  <div class="card-body">
			    <h5 class="card-title">Java Programming</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn primary-background">Read More</a>
			  </div>
			</div>
			</div>
			
			<div class="col-md-4">
			<div class="card" >
			  <div class="card-body">
			    <h5 class="card-title">Java Programming</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn primary-background">Read More</a>
			  </div>
			</div>
			</div>
		
		</div>	
		
		<br>
		
		
		<div class="row mb-20">
			
			<div class="col-md-4">
			<div class="card" >
			  <div class="card-body">
			    <h5 class="card-title">Java Programming</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn primary-background">Read More</a>
			  </div>
			</div>
			</div>
			
			<div class="col-md-4">
			<div class="card" >
			  <div class="card-body">
			    <h5 class="card-title">Java Programming</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn primary-background">Read More</a>
			  </div>
			</div>
			</div>
			
			<div class="col-md-4">
			<div class="card" >
			  <div class="card-body">
			    <h5 class="card-title">Java Programming</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn primary-background">Read More</a>
			  </div>
			</div>
			</div>
		
		</div>	
		
		<br>
	
	</div>
	
	<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<!-- <script type="text/javascript" src="js/myjs.js"></script> -->
	<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
</body>
</html>