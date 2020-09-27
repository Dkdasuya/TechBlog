<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel= "stylesheet" href="css/style.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<%@include file="normalNavBar.jsp"  %>
	
	<main class="primary-background " style="padding-bottom:30px">
		<div class="container">
			<div class="col-md-4 offset-md-4" >
				<div class="card">
					<div class="card-header text-center primary-background">
					<span class="fa fa-user-circle fa-3x"></span>
					<br>
					Register Here!
					</div>
					<div class="card-body">
					<form id="reg-form" action="RegisterServlet" method="post">
					  <div class="form-group">
					    <label for="user_name">User Name</label>
					    <input name = "user_name" type="text" class="form-control" id="user_name " aria-describedby="emailHelp" >
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1">Email address</label>
					    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
					  </div>
					  <div class="form-group">
					    <label for="exampleInputPassword1">Password</label>
					    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
					  </div>
					  <div class="form-group">
					    <label for="gender">Gender</label>
					    <br>
					    <input type="radio"  id="gender" name="gender" value="male">Male
					    <input type="radio"  id="gender" name="gender" value="female" style:"margin-left:10px">Female
					  </div>
					  <div class="form-group">
						<textarea name="about" class="form-control" id="" rows="3" cols="10" placeholder="Enter Something about yourself."></textarea>
					  </div>
					  <div class="form-group form-check">
					    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
					    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions.</label>
					  </div>
					  <br>
					  <div class="container text-center" id="loader" style="display:none;">
					  	<span class="fa fa-refresh fa-spin fa-3x"></span>
					  	<h4>Please Wait....</h4>
					  </div>
					  <button id="submit-btn" type="submit" class="btn btn-primary">Sign-Up</button>
					</form>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(document).ready(function(){
			console.log("loaded...........");
			
			$('#reg-form').on('submit',function(event){
				event.preventDefault();
				let form = new FormData(this);
				//Send register Servlet
				
				$('#submit-btn').hide();
				$('#loader').show();
				
				$.ajax({
					url:"RegisterServlet",
					type:'post',
					data:form,
					success:function(data,textStatus,jqXHR){
						console.log(data)
						$('#submit-btn').show();
						$('#loader').hide();
						if(data.trim()==='Done'){
							swal("Registration SuccessFully!!!..We are redirecting you to Login Page.")
							.then((value) => {
							  window.location="login_page.jsp";
							});
							
						}else{
							swal(data);
						}
					},
					error:function(jqXHR,textStatus,errorThrown){
						console.log(jqXHR)

						$('#submit-btn').show();
						$('#loader').hide();
						swal("Something Went wrong.");
						
					},
					processData:false,
					contentType:false
				});
			});
		
		
		});
	
	</script>	

</body>
</html>