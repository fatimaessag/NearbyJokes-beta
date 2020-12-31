<!DOCTYPE html>
<html>
<head>
	<title>Profile</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body style="background-image: linear-gradient(315deg, #eec0c6 0%, #e58c8a 74%);">

	<nav class="navbar navbar-expand-lg navbar-light bg-white">
	  	<a class="navbar-brand" href="#">
	    	<img src="logo.jpeg" width="50" height="70" class="d-inline-block align-top" alt="" loading="lazy">
	  	</a>
	  	<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    	<div class="navbar-nav">
		      	<div class="nav-item active" >
			        <a class="nav-link" href="#" style="font-family: Montserrat, sans-serif; font-size: 1.5em;margin-top: -0.3em;font-weight: 800;color: rgba(0, 0, 0, 1);text-transform: none;font-style: normal;text-decoration: none;line-height: 1.4em;letter-spacing: 0px;text-shadow: 0px 0px 0px rgba(0, 0, 0, 1);}">NBJokes<span class="sr-only">(current)</span>
					</a>
		      	</div>
	  		</div>
		    <div class="navbar-nav ml-auto">
		     	<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    			Profile
		  			</button>
		  			<ul class="dropdown-menu dropdown-menu-right">
		    			<a class="dropdown-item" href="#">Settings</a>
		    			<a class="dropdown-item" href="#">About us</a>
		    			<a class="dropdown-item" href="#">Help</a>
		    			<a class="dropdown-item" href="#">Log out</a>
		  			</ul>
				</div>
			</div>
		</div>
	</nav>

	<div class="row">
		<div class="col-8">
			<div class="container" style="margin-top: 40px">
				<div class="jumbotron" >
					<div>
						<i class="fas fa-user fa-7x"></i><p>name</p>
						<!-- <small class="text-muted">10 min ago</small> -->
					</div>
					<div style="background-image: linear-gradient(315deg, #eec0c6 0%, #e58c8a 100%);" class="jumbotron">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
						proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
						<div>
						  	<div class="row">
								<button type="button" class="btn btn-secondary mr-1">
						    		vote <i class="fas fa-arrow-alt-circle-up"> 0 </i> 
						    	</button>
								<button type="button" class="btn btn-secondary mr-1">
									vote <i class="fas fa-arrow-alt-circle-down"> 0 </i>
								</button>
								<a style="color: #FFFFFF;" href="http://localhost:8080/NearByJokes/GetComments.jsp?id=<%= "chihab ID hna"%>">
									<button type="button" class="btn btn-secondary mr-1">
									 comments 
									<i class="fas fa-comments"> 0 </i>
									</button>
								</a>
								<a style="color: #FFFFFF " 
				 					href="http://localhost:8080/NearByJokes/editpost.jsp?id=<%= "chihab ID hna"%>">
									<button type="button" class="btn btn-secondary mr-1">
										edit <i class="fas fa-edit"></i>
									</button>
								</a>
						  	</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="jumbotron" >
					<div>
						<i class="fas fa-user fa-7x"></i><p>name</p>
						<!-- <small class="text-muted">10 min ago</small> -->
					</div>
					<div style="background-image: linear-gradient(315deg, #eec0c6 0%, #e58c8a 100%);" class="jumbotron">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
						proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
						</p>
						<div>
						  	<div class="row">
								<button type="button" class="btn btn-secondary mr-1">
						    		vote <i class="fas fa-arrow-alt-circle-up"> 0 </i> 
						    	</button>
								<button type="button" class="btn btn-secondary mr-1">
									vote <i class="fas fa-arrow-alt-circle-down"> 0 </i>
								</button>
								<a style="color: #FFFFFF;" href="http://localhost:8080/NearByJokes/GetComments.jsp?id=<%= "chihab dir ID hna "%>">
									<button type="button" class="btn btn-secondary mr-1">
									 comments 
									<i class="fas fa-comments"> 2 </i>
									</button>
								</a> 

								<a style="color: #FFFFFF " 
				 					href="http://localhost:8080/NearByJokes/editpost.jsp?id=<%= "chihab dir ID hna "%>">
									<button type="button" class="btn btn-secondary ">
										edit <i class="fas fa-edit"></i>
									</button>
								</a>
						  	</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-4">
			<div class="container" style="margin-top: 40px">
				<h1>Personal Information:</h1>	
				<form  method="post" action="SignUp" >
				  	<div class="form-row">
				    	<div class="col-md-6 mb-3">
				      		<label for="validationDefault01">First name</label>
				      		<input name="First name" placeholder="chihab" readonly="readonly" type="text" class="form-control" id="validationDefault01" value="" required>
				    	</div>
				    	<div class="col-md-6 mb-3">
				      		<label for="validationDefault02">Last name</label>
				      		<input name ="Last name" placeholder="" readonly="readonly" type="text" class="form-control" id="validationDefault02" value="" required>
				    	</div>
				  	</div>
		  			<div class="form-group">
						<label for="validationDefault03">Select birth date</label>
						<input type="date" name="birthday" placeholder="" readonly="readonly" max="2020-12-31" min="1900-01-01" class="form-control" id="validationDefault03" required>
					</div>
		  			<br>
				  	<div class="form-row">
				    	<div class="col-md-6 mb-3">
					      	<label for="validationDefault04">Adress</label>
					      	<input name="adress" placeholder="" readonly="readonly" type="text" class="form-control" id="validationDefault04" required>
				    	</div>
					    <div class="col-md-3 mb-3">
					      	<label for="validationDefault05">City</label>
					      	<input name="city" placeholder="" readonly="readonly" type="text" class="form-control" id="validationDefault05">
					      	
						    
					    </div>
					    <div class="col-md-3 mb-3">
					      	<label for="validationDefault06">Zip</label>
					      	<input name ="zip" placeholder="" readonly="readonly"  type="text" class="form-control" id="validationDefault05" required>
					    </div>
				  	</div>

				  	<div class="form-row">
				    	<div class="col-md-6 mb-3">
				     	 	<label for="validationDefault07">Email Adress</label>
				     	 	<input name="email" placeholder="" readonly="readonly"  type="email" class="form-control" id="validationDefault01" value="" required>
				     	 	<small id="emailHelp" class="form-text text-muted">
				     	 		We'll never share your email with anyone else.
				     	 	</small>
				   	 	</div>
				 	</div>


				 	 

				 	<div class="text-center">
				 		<a style="color: #FFFFFF " 
				 			href="http://localhost:8080/NBJokes/editprofile.jsp?id=<%= "chihab ID hna"%>">
							<button type="button" style="width: 200px" class="btn btn-success ">
							 Edit Profile 
							</button>
						</a>
			        </div>
				
			</form>
			</div>
		</div>
	</div>

	
	<nav aria-label="Page navigation example">
	  	<ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      	<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    <li class="page-item">
		    	<a class="page-link" href="#">1</a></li>
		    <li class="page-item">
		    	<a class="page-link" href="#">2</a></li>
		    <li class="page-item">
		    	<a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">Next</a>
		    </li>
	  	</ul>
	</nav>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>