<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>comments</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body style="background-color: pink ; background-position: cover ">
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
		  				<a class="dropdown-item" href="#"><i class="fas fa-user-circle"></i> Profile</a>
		    			<a class="dropdown-item" href="#"><i class="fas fa-cog"></i> Settings</a>
		    			<a class="dropdown-item" href="#"><i class="fas fa-address-card"></i> About us</a>
		    			<a class="dropdown-item" href="#"><i class="fas fa-question-circle"></i> Help</a>
		    			<a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt"></i> Log out</a>
	  				</ul>
				</div>
			</div>
	  	</div>
	</nav>
	<br>
	
			<%@page  import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.SQLException,java.sql.Statement,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse"
%>
<%

int post_id=Integer.parseInt(request.getParameter("id"));
session.setAttribute("post_id", post_id);

int id = post_id;

;
%>
<%
try {		Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
			String user="root";
			String password="root";
			Connection conn= DriverManager.getConnection(url, user, password);
			Statement stm= conn.createStatement();
			Statement stm2= conn.createStatement();
			
			ResultSet res1=stm.executeQuery("SELECT firstname,lastname,contenu,nbr_like,nbr_dislike,date  FROM jeeproject_db.post , jeeproject_db.user\r\n" + 
					"where post_id='"+post_id+"' and auteur=email order by date;\r\n");
			res1.next();
			String name=res1.getString("firstname");
			String lsname=res1.getString("lastname");
			String contenu=res1.getString("contenu");
			int voteUp=Integer.parseInt(res1.getString("nbr_like"));
			int voteDown=Integer.parseInt(res1.getString("nbr_dislike"));
			String date = res1.getString("date");
			
			ResultSet res2=stm2.executeQuery("SELECT count(*) as NUM FROM jeeproject_db.commentaire WHERE post_id='"+id+"'");
			res2.next();
			int comments_count = res2.getInt("NUM");
			System.out.println("second query successfully executed");
		%>
		<div class="container">
		<div class="jumbotron" >
			<div>
				<i class="fas fa-user fa-7x"></i><p><%= name +" " + lsname%></p>
			</div>
			
			<div style="background:#e5989b !important" class="jumbotron">
				
				<p><%= contenu%>
				</p>
				<div class="row">
				  		<a style="color: #FFFFFF;" href="http://localhost:8080/NBJokes/LikePost?id=<%= id%>&k=2">
				    	<button type="button" class="btn btn-secondary mr-1">	
				    		vote up <i class="fas fa-arrow-alt-circle-up"><%= voteUp%></i> 
				    	</button>
				  		<a style="color: #FFFFFF;" href="http://localhost:8080/NBJokes/DislikePost?id=<%= id%>&k=2">
						<button type="button" class="btn btn-secondary mr-1">
							vote down <i class="fas fa-arrow-alt-circle-down"><%= voteDown%></i>
						</button>
						<a style="color: #FFFFFF;">
						<button type="button" class="btn btn-secondary mr-1">
							 <i class="fas fa-comments"><%= comments_count%> </i> Comments
						</button>
						</a>
						
							
						<a style="color: #FFFFFF;">
							<button type="button" class="btn btn-secondary">
							<small> <%= date%></small>
							</button><i></i>
						
				  	</div>
				
			</div>
			<br>
			<form  method="post" action="Record_Comment" >
				<div class="form-group" >
			    	<label for="exampleFormControlTextarea1">  </label>
			    	<textarea name="contenu" class="form-control" placeholder="Write your comment" id="exampleFormControlTextarea1" rows="2"></textarea>
				</div>

				<div class="text-center">
					<button class="btn btn-outline-success">Comment</button>
				</div>
			</form>

			<br>
			<%		


		
  }catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
%>
			
<%
try {			System.out.println("ENTRING THE SHOW COMMENT LOOP");
	   Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
		String user="root";
		String password="root";
		Connection conn= DriverManager.getConnection(url, user, password);
		Statement stm= conn.createStatement();
		
		
		System.out.println("GETTING A COMMENT");

		ResultSet res=stm.executeQuery("SELECT  C.contenu,nbr_love,C.date FROM jeeproject_db.commentaire C,jeeproject_db.post P where C.post_id='"+post_id+"' and P.post_id='"+post_id+"' order by C.date desc" + 
				"");
		while(res.next()) {
		String contenu_comment=res.getString(1);
		System.out.println(contenu_comment);
		String nbr_love=res.getString(2);
		String date = res.getString(3);
		
		System.out.println("SHOWING THE COMMENT");

		
		%>
			<div class="card">
			</b>
			  	<div class="card-body">
			    	<p style="color:#000000";><%= contenu_comment%>
				</p>
			  	</div>
			</div>

			<div class="row mr-1">
				<a style="color: #FFFFFF;" href="http://localhost:8080/NBJokes/LoveComment?redirect=GetComments?id="+post_id>
		    	<button type="button" class="btn btn-secondary mr-1" style=" margin: auto; ">
		    		love <i class="far fa-heart"> <%= nbr_love%> </i>  
		    	</button>
				
				
				<button type="button" class="btn btn-secondary">
					 <i class="fas fa-comments"> <%= date%></i>
				</button>
		  	</div>
		  	<%		}


		
  }catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
%>
		  	
		  	
		</div>
	</div>
	







	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>
