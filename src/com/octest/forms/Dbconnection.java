package com.octest.forms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Dbconnection {
public static  Connection connexion=null;
public static  Statement statement=null;
	
	public static void connecter() {
		String lien="jdbc:mysql://localhost:3306/NoteDeFrais";
		String user="root";
		String pass="mercip@p@123";
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
		
		}
		try {
			connexion=DriverManager.getConnection(lien, user, pass);
		} catch (SQLException e1) {
			
		}
		
		try {
			statement=connexion.createStatement();
		}catch(SQLException e) {
			
		}
	
		 
	}

}
