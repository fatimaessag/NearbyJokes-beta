package com.maroua.NBJokes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.ParseInfo;

/**
 * Servlet implementation class Record_Comment
 */
@WebServlet("/RecordPost")
public class RecordPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecordPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = Req.getSession();
		String email =(String) session.getAttribute("email");
		String contenu = Req.getParameter("contenu");

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now();  
		String date=dtf.format(now);  
		 
		
		 
	     

	     try {
	    	   Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
				String user="root";
				String password="root";
				Connection conn= DriverManager.getConnection(url, user, password);
				
				/*getting the localisation of the user*/
				Statement stm1= conn.createStatement();
				ResultSet res=stm1.executeQuery("SELECT city FROM jeeproject_db.user WHERE email='" +email+"'");
				res.next();
				String city=res.getString(1);
				
				
				
				Statement stm2= conn.createStatement();
				ResultSet j=stm2.executeQuery("SELECT Max(post_id) FROM jeeproject_db.post \r\n" + 
						"");
				j.next();
				int Old_post=Integer.parseInt(j.getString(1));
				int post_id= Old_post+1;
				

				int i=stm2.executeUpdate("INSERT INTO jeeproject_db.post ()  VALUES ('"+post_id+"','"+email+"','"+contenu+"','"+date+"',0, 0,0, '"+city+"')");
			    
				/*need to redirect*/
				session = Req.getSession();
	        	session.setAttribute("message", "Your post was successfully published");
				Req.getRequestDispatcher("/jokes.jsp").forward(Req,Res);
				
	     }catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
			
	     
	  

		 

		
	}

}