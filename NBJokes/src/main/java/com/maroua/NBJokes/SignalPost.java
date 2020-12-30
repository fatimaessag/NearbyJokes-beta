package com.maroua.NBJokes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/SignalPost")
public class SignalPost extends HttpServlet {
	
      
    
    public SignalPost( ) {
        super();
     
    }
    
	
	protected void doGet(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println("signal servlet is being called");
		String email = Req.getParameter("email");
		 int post_id = Integer.parseInt(Req.getParameter("id"));


	     try {
	    	   Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
				String user="root";
				String db_password="root";
				Connection conn= DriverManager.getConnection(url, user, db_password);
				Statement stm= conn.createStatement();
				
				
				ResultSet j=stm.executeQuery("SELECT nbr_signal FROM jeeproject_db.post WHERE post_id ='"+post_id+"'");
				j.next();
				int new_nbr_signal= Integer.parseInt(j.getString("nbr_signal"))+1;				

				/* --- */
				PreparedStatement stmt=conn.prepareStatement("UPDATE jeeproject_db.post SET nbr_signal =? WHERE post_id=? ");
				
				stmt.setInt(1,new_nbr_signal);
				stmt.setInt(2,post_id); 

				/*il nous manque encore une solution pour interdir le même utilisateur de "signalr" un poste maintes fois*/
				/*on pense à établir une table par utilisateur où les activités seront enregistrés, chose qui nous permettera de préciser s'il a déja aimer ce post ou non*/
				int i=stmt.executeUpdate();  
				
				HttpSession session = Req.getSession();
	        	session.setAttribute("color", "red");
	        	session.setAttribute("message", "You signald the post");
				Req.getRequestDispatcher("/jokes.jsp").forward(Req,Res);

	     }catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     
		  
	
	}

	
	protected void doPost(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = Req.getParameter("email");
		 int post_id = Integer.parseInt(Req.getParameter("post_id"));


	     try {
	    	   Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
				String user="root";
				String db_password="root";
				Connection conn= DriverManager.getConnection(url, user, db_password);
				Statement stm= conn.createStatement();
				
				
				ResultSet j=stm.executeQuery("SELECT nbr_signal FROM jeeproject_db.post WHERE post_id ='"+post_id+"'");
				
				int old_nbr_signal= Integer.parseInt(j.getString(1));				

				/* --- */
				PreparedStatement stmt=conn.prepareStatement("UPDATE jeeproject_db.post SET nbr_signal ='?' WHERE post_id='?' ");
				
				stmt.setInt(1,old_nbr_signal +1);
				stmt.setInt(2,post_id); 

				/*il nous manque encore une solution pour interdir le même utilisateur de "signalr" un poste maintes fois*/
				/*on pense à établir une table par utilisateur où les activités seront enregistrés, chose qui nous permettera de préciser s'il a déja aimer ce post ou non*/
				int i=stmt.executeUpdate();  

	     }catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     
	  

		 

		
	}

}
