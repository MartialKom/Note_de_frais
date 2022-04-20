package com.octest.forms;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.PreparedStatement;

public  class Utilisateur {
public String nom;
public String prenom;
private String login;
protected String mdp;
public String type;

public Utilisateur(String nom, String prenom, String login, String mdp, String type) {
	this.login=login;
	this.mdp=mdp;
	this.nom=nom;
	this.prenom=prenom; 
	this.type=type;
}

public Utilisateur() {
	
}

public String getNom() {
	return nom;
}
public void setNom(String nom) {
	this.nom = nom;
}
public String getPrenom() {
	return prenom;
}
public void setPrenom(String prenom) {
	this.prenom = prenom;
}
public String getLogin() {
	return login;
}
public void setLogin(String login) {
	this.login = login;
}
public String getMdp() {
	return mdp;
}
public void setMdp(String mdp) {
	this.mdp = mdp;
}

public static int authentification(String login, String mdp, Connection c) {

	
	String req="select * from utilisateurs where login=?";
	
	
		
		PreparedStatement prepare = null;
		try {
			c.setAutoCommit(false);
			prepare = (PreparedStatement) c.prepareStatement(req);
			prepare.setString(1, login);
	
		ResultSet r = null;
		
			r = prepare.executeQuery();
			if(!r.next()) {
				c.rollback();
				return 0; 
				}
			
			else {
				
				
				
				String conn="{? = call connexion (?,?)}";
				
				
					
					CallableStatement state = (CallableStatement) c.prepareCall(conn);
					state.registerOutParameter(1, Types.INTEGER);
					state.setString(2, mdp);
					state.setString(3, login);
					state.execute();
					
					int a = state.getInt(1);
				
					if(a==0) {
					c.rollback();
						return 0;  
				
					}
					else {
						c.commit();
					return 1;	
						
						}	
}
		} catch (SQLException e) {
			
			return 0; 
		}
	
}
	
public boolean deconnection(String login) {
	
	return true;
}

public Employe search(String login, Connection c, Statement s) {
	
	Employe e = new Employe();
	
	String req2="select * from employe where login=? lock in share mode";
	PreparedStatement prepare = null;
	try {
	prepare = (PreparedStatement) c.prepareStatement(req2);
	prepare.setString(1, login);
	ResultSet r = prepare.executeQuery();
	while(r.next()) {
		e.nom=r.getString("nom");
		e.setLogin(r.getString("login"));
		e.departement=r.getString("departement");
		
	}
	return e;
	}catch(SQLException ex) {
	return e;
	}
	
	
}
public String searchType(String login, Connection c, Statement s) {
	
	String req2="select type, nom from utilisateurs where login=? lock in share mode";
	String type=null;
	String nom=null;
	PreparedStatement prepare = null;
	try {
	prepare = (PreparedStatement) c.prepareStatement(req2);
	prepare.setString(1, login);
	ResultSet r = prepare.executeQuery();
	
	while(r.next()) {
		type=r.getString("type");
		nom=r.getString("nom");
	}
	if(type.equals("Service Comptable")) {
		return nom;
	}
	else return "Employe";
	
	}catch(SQLException e) {
		return e.getMessage();
	}
}

	}
	
	
	

