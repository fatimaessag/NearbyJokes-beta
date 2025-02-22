<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<title>Landing Page</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>



<body style="background-image:url(pinkback.jpg);background-size: cover;">

	<nav class="navbar navbar-expand-lg navbar-light bg-white">
	  <a class="navbar-brand" href="http://localhost:8080/NBJokes/login.jsp">
	    <img src="logo.jpeg" width="50" height="70" class="d-inline-block align-top" alt="" loading="lazy">
	  </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>

	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active" >
	        <a class="nav-link" href="http://localhost:8080/NBJokes/login.jsp" style="font-family: Montserrat, sans-serif; font-size: 1.5em;margin-top: -0.3em;font-weight: 800;color: rgba(0, 0, 0, 1);text-transform: none;font-style: normal;
											    text-decoration: none;line-height: 1.4em;letter-spacing: 0px;text-shadow: 0px 0px 0px rgba(0, 0, 0, 1);}">NBJokes<span class="sr-only">(current)</span>
			</a>
	      </li>
	    </ul>
	    <form action="signup.jsp" class="form-inline my-2 my-lg-0">
	      		<button class="btn btn-outline-success my-2 my-sm-0" >Sign up</button>
	      	
	    </form>
	  </div>
	</nav>
	<div class="container">
	<center>
		<div class="jumbotron" style="margin-top: 7em; color: black; width: 30em ;">
			  <h1 class="display-4" style="font-family: Montserrat, sans-serif; ">Welcome to NearbyJokes!</h1>
			  <br>
			  <br>
			  <div class="container-sm">
			  <form action="Login" method="post">
				  <div class="form-group">
				    <label for="exampleInputEmail1" >Pseudo</label>
				    <input name="email" type="email" class="form-control"  id="exampleInputEmail1" aria-describedby="emailHelp">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password</label>
				    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
				    
				  </div>
				  <button type="submit" class="btn btn-success">Login</button>
				  <a href="http://localhost:8080/NBJokes/forgotpass.jsp">Forgot your password?</a>
				  
			  </form>
			  </div>
		</div></center>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>