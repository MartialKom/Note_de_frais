package com.octest.forms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.PreparedStatement;


public class Inscriptionform {
public String resultat;
public int c;



public void connexion(HttpServletRequest request) {
	
	String lien="jdbc:mysql://localhost:3306/Banques";
	String user="root";
	String pass="mercip@p@123";
	Connection connexion=null;
	Statement statement = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e1) {
	
	}
	try {
		connexion=DriverManager.getConnection(lien, user, pass);
	} catch (SQLException e1) {
		
	}
	
	try {
		statement= (Statement) connexion.createStatement();
		
		
	} catch (SQLException e) {
		
	}
	
	
	
	String userConn = request.getParameter("UserN2");
	String passConn = request.getParameter("pass2");
	String req="select * from userAdmin where user_name=?";
	if(userConn!=null) {
	try {
		connexion.setAutoCommit(false);
		PreparedStatement prepare= (PreparedStatement) connexion.prepareStatement(req);
		
		prepare.setString(1, userConn);
		connexion.setAutoCommit(false);
		ResultSet r=prepare.executeQuery();
		if(!r.next()) {
			resultat="Mauvaise authentification";
			connexion.rollback();}
			
			else {
		
	
	
	String conn="{? = call connexion (?,?)}";
	
	
		
		CallableStatement state = (CallableStatement) connexion.prepareCall(conn);
		state.registerOutParameter(1, Types.INTEGER);
		state.setString(2, passConn);
		state.setString(3, userConn);
		state.execute();
		
		int a = state.getInt(1);
		c=a;
		if(c==0) {
			resultat="Mauvaise authentification";
			connexion.rollback();
		}
		else
		connexion.commit();}
	} catch (SQLException e) {
resultat=e.getMessage();
	}
	}
	}

public String getResultat() {
	return this.resultat;
}

public void setResultat(String resultat) {
	this.resultat = resultat;
}
}
