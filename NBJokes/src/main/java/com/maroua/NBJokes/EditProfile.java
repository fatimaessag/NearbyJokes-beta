package com.maroua.NBJokes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	
      
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public EditProfile( ) {
        super();
        System.out.print("Edit Profile is being created as an objct");
     
    }
    
	
	protected void doGet(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
	
	}

	
	protected void doPost(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		System.out.print("dopost in edit profile was called successfully");
		// TODO Auto-generated method stub
		String firstname = Req.getParameter("First name");
		String lastname = Req.getParameter("Last name");
		String birthday = Req.getParameter("birthday");
		String address = Req.getParameter("adress");
		String city = Req.getParameter("city");
		String new_email = Req.getParameter("email").toLowerCase();
		String new_pass = Req.getParameter("password1");
		String new_pass2 = Req.getParameter("password2");
		String zip = Req.getParameter("zip");
		String entered_password = Req.getParameter("password0");
		
		
		
		HttpSession session = Req.getSession();
     	String old_email =  session.getAttribute("email").toString();
     	System.out.print("This session email is : "+old_email +"   , we r using it in edit profile servelt");

	     try {
	    	   Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
				String user="root";
				String password="root";
				Connection conn= DriverManager.getConnection(url, user, password);
				Statement stm= conn.createStatement();
				
				Boolean Valide =true;
				
				ResultSet res=stm.executeQuery("SELECT password FROM jeeproject_db.user WHERE email='" +old_email+"'");
				String Password=res.getString(1);
				
				if (!Password.equals(entered_password)) {
					Valide= false;
				}

				/*s'assurer que le nouveau email n'est pas déja pris par un autre utilisateur*/
				if(!new_email.equals("")) {
					res=stm.executeQuery("SELECT password FROM jeeproject_db.user WHERE email='" +new_email+"'");
					if (res.next()) {
						Valide = false;
					}
				} 
				if(  !new_pass.equals(new_pass2)) {
					Valide = false;
				}
				
				if (!Valide) {
					/*ERREUR, L OPERATION NE PEUT PAS S'EFFECTUER CAR CET EMAIL EST DEJA UTILISE OU LES MDPs ENTREES NE SONT PAS IDENTIQUES*/

					/* l'opération n'est pas effectuée , l'utilisateur est redérigé vers son profile:*/
		        	session.setAttribute("message", "your informations have not been updated successfully due to an error.");
					Req.getRequestDispatcher("/profile.jsp").forward(Req,Res);
					
				}else {
					/*changement du nom*/
					if (!firstname.equals("")) {
						PreparedStatement stmt=conn.prepareStatement("UPDATE jeeproject_db.user SET firstname ='?' WHERE email='?' ");
						stmt.setString(1,firstname);
						stmt.setString(2,old_email); 
						int i=stmt.executeUpdate();  }
					/*changement du lastname*/
					if (!lastname.equals("")) {
						PreparedStatement stmt2=conn.prepareStatement("UPDATE jeeproject_db.user SET lastname ='?' WHERE email='?' ");
						stmt2.setString(1,lastname);
						stmt2.setString(2,old_email); 
						int i=stmt2.executeUpdate();  }
					/*changement du birthday*/
					if (!birthday.equals("")) {
						PreparedStatement stmt3=conn.prepareStatement("UPDATE jeeproject_db.user SET birthday ='?' WHERE email='?' ");
						stmt3.setString(1,birthday);
						stmt3.setString(2,old_email); 
						int i=stmt3.executeUpdate();  }
					/*changement d' addresse*/
					if (!address.equals("")) {
						PreparedStatement stmt4=conn.prepareStatement("UPDATE jeeproject_db.user SET address ='?' WHERE email='?' ");
						stmt4.setString(1,address);
						stmt4.setString(2,old_email); 
						int i=stmt4.executeUpdate();  }
					/*changement du city*/
					if (!city.equals("")) {
						PreparedStatement stmt5=conn.prepareStatement("UPDATE jeeproject_db.user SET city ='?' WHERE email='?' ");
						stmt5.setString(1,city);
						stmt5.setString(2,old_email); 
						int i=stmt5.executeUpdate();  }
					/*changement du Mot de passe*/
					if (!new_pass.equals("")) {
						PreparedStatement stmt6=conn.prepareStatement("UPDATE jeeproject_db.user SET password ='?' WHERE email='?' ");
						stmt6.setString(1,new_pass);
						stmt6.setString(2,old_email); 
						int i=stmt6.executeUpdate();  }
					
					/*changement d'email */
					if (!new_email.equals("")) {
						PreparedStatement stmt7=conn.prepareStatement("UPDATE jeeproject_db.user SET password ='?' WHERE email='?' ");
						stmt7.setString(1,new_email);
						stmt7.setString(2,old_email); 
						int i=stmt7.executeUpdate();  }
					
					
					
					/* l'opération est effectuée avec succes, l'utilisateur est redérigé vers son profile:*/
					session = Req.getSession();
		        	session.setAttribute("message", "your informations have been updated successfully!");
					Req.getRequestDispatcher("/profile.jsp").forward(Req,Res);

				}
	
				
	     }catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     
	  

		 

		
	}

}
