package com.maroua.NBJokes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	
      
    
    public SignUp( ) {
        super();
     
    }
    
	
	protected void doGet(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
	
	}

	
	protected void doPost(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String name = Req.getParameter("First name");
		 String lastname = Req.getParameter("Last name");
		 String birthday = Req.getParameter("birthday");
		 String address = Req.getParameter("adress");
		 String city = Req.getParameter("city");
		 String email = Req.getParameter("email");
		 String pass1 = Req.getParameter("password1");
		 String zip = Req.getParameter("zip");
		 String pass2 = Req.getParameter("password2");
	     

	     try {
	    	   Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
				String user="root";
				String password="root";
				Connection conn= DriverManager.getConnection(url, user, password);
				Statement stm= conn.createStatement();

				int i=stm.executeUpdate("INSERT INTO jeeproject_db.user ()  VALUES ('"+email.toLowerCase()+"','"+name+"','"+lastname+"','"+birthday+"','"+address+"','"+city+"','"+zip+"','"+pass1+"')");
				if(i==1) {
					/*this should only be executed if the mail is nt already used by someone else*/
					System.out.println("now we will redirect you to acceuil");
		        	/*send to main page to see nearbyjokes depending on where the user is*/
		        	HttpSession session = Req.getSession();
		        	session.setAttribute("email", email);
		        	session.setAttribute("message", "Welcome, you are connected using ur email :"+email);
	
					Req.getRequestDispatcher("/jokes.jsp").forward(Req,Res);
				} else {
					System.out.println("Email already used by someone else, use forgot email");
		        	/*send to main page to see nearbyjokes depending on where the user is*/
					Req.getRequestDispatcher("/signup.jsp").forward(Req,Res);}
					
	     }catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     
	  

		 

		
	}

}
