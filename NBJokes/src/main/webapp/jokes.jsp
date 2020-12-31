<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
	<title>Jokes</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>

<body style=" background-color: #eec0c6;
background-image: linear-gradient(315deg, #eec0c6 0%, #e58c8a 74%);
">

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
	      		<div>
		      		<form class="form-inline my-2 my-lg-0 ml-auto">
				      	<input class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search">
				      	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
				      		<i class="fas fa-search"></i>
				      	</button>
				    </form>
				</div>	
	  		</div>
	    	<div class="navbar-nav ml-auto">
	     		<div class="dropdown">
			  		<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    					<i class="fas fa-user"></i>
  					</button>
	  				<ul class="dropdown-menu dropdown-menu-right">
		  				<a class="dropdown-item" href="#">Profile</a>
		    			<a class="dropdown-item" href="#">Settings</a>
		    			<a class="dropdown-item" href="#">About us</a>
		    			<a class="dropdown-item" href="#">Help</a>
		    			<a class="dropdown-item" href="#">Log out</a>
	  				</ul>
				</div>
			</div>
	  	</div>
	</nav>

	<br>
	<div class="container">
		<div class="jumbotron">
			<form  method="post" action="RecordPost" >
				<div class="form-group" >
			    	<label for="exampleFormControlTextarea1">  </label>
			    	<textarea name="contenu" class="form-control" placeholder="Write your joke !!" id="exampleFormControlTextarea1" rows="3"></textarea>
				</div>

				<div class="text-center">
					<button class="btn btn-outline-success">Post</button>
				</div>
			</form>
		</div>
	</div>

	<br>
<%@page  import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.SQLException,java.sql.Statement,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,java.util.*,java.util.function.Supplier" 
%>
<%
try {
	   Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
		String user="root";
		String password="root";
		Connection conn= DriverManager.getConnection(url, user, password);
		Statement stm= conn.createStatement();
		Statement stm2= conn.createStatement();

		int i=0;
		List<Integer> listIds = new ArrayList<Integer>();
		System.out.println("jokes servlet was called successfully");
		
		String email = (String) session.getAttribute("email");
		System.out.println("your email is "+ email);
		
		ResultSet res1=stm.executeQuery("SELECT city FROM jeeproject_db.user WHERE email='"+email+"';");
		res1.next();
	    String city = res1.getString("city");
	    System.out.println("first query successfully executed, the city is :"+city);
	    
		ResultSet res=stm.executeQuery("SELECT firstname,lastname,contenu,nbr_like,nbr_dislike,post_id FROM jeeproject_db.post , jeeproject_db.user\r\n" + 
				"where localisation='"+city+"' and auteur=email order by date desc;\r\n" + 
				"");
		
	    System.out.println("second query successfully executed");

		while(res.next()) {
		String name=res.getString("firstname");
		String lsname=res.getString("lastname");
		String contenu=res.getString("contenu");
		int voteUp=Integer.parseInt(res.getString("nbr_like"));
		int voteDown=Integer.parseInt(res.getString("nbr_dislike"));
		int post_id=Integer.parseInt(res.getString("post_id"));
		listIds.add(post_id);
		int id=listIds.get(i);
		i++;
		
		ResultSet res2=stm2.executeQuery("SELECT count(*) as NUM FROM jeeproject_db.commentaire WHERE post_id='"+id+"'");
		res2.next();
		int comments_count = res2.getInt("NUM");
	    System.out.println("second query successfully executed");

		%>
		
		<form >
		  
		 
		<div class="container">
		<div class="jumbotron" >
			<div>
				<i class="fas fa-user fa-7x"></i><p><%= name +" " + lsname%></p>
			</div>
			
			<div style="background:#e5989b !important" class="jumbotron">
				<p><%= contenu%>
				</p>

				<div>
				  	<div class="row">
				  		<a style="color: #FFFFFF;" href="http://localhost:8080/NBJokes/LikePost?id=<%=id%>&k=1">
				    	<button type="button" class="btn btn-secondary mr-1">	
				    		vote up <i class="fas fa-arrow-alt-circle-up"><%= voteUp%></i> 
				    	</button>
				  		<a style="color: #FFFFFF;" href="http://localhost:8080/NBJokes/DislikePost?id=<%=id%>&k=1">
						<button type="button" class="btn btn-secondary mr-1">
							vote <i class="fas fa-arrow-alt-circle-down"><%= voteDown%></i>
						</button>
						<a style="color: #FFFFFF;" href="http://localhost:8080/NBJokes/GetComments.jsp?id=<%=id%>">
							<button type="button" class="btn btn-secondary">
							 comments 
							<i class="fas fa-comments"><%= comments_count%> </i>
							</button>
						</a> 
				  	</div>
				</div>
			</div>
			
		</div>
	</div>
	</form>
<%		}


		
  }catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
%>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>


</body>
</html>
