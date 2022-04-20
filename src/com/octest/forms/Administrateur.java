package com.octest.forms;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.PreparedStatement;
import com.octest.servlets.Servlet2;


public class Administrateur implements Administration{
public String nom;
public String login;
private String mdp;

public Administrateur() {
	this.nom="Sans nom";
	this.login="Admin";
	this.mdp="admin1234";
}
//Méthodes modifiant les paramètres de l'administrateur
public String getNom() {
	return nom;
}

public void setNom(String nom) {
	this.nom = nom;
}

public String getLogin() {
	return login;
}

public void setLogin(String login) {
	this.login = login;
}

public void setMdp(String mdp) {
	this.mdp = mdp;
}

//Réalisation de l'interface Administration
@Override
public String createUser(Employe e, Connection connexion) {

	String req="insert into utilisateurs (nom,prenom,login,mot_de_passe,type) values (?,?,?,MD5(?),?)";
	
	String req2="insert into employe (nom,prenom,login,mot_de_passe,departement) values (?,?,?,MD5(?),?)";
	try {
	connexion.setAutoCommit(false);
	PreparedStatement prepare=(PreparedStatement) connexion.prepareStatement(req);
	prepare.setString(1, e.nom);
	prepare.setString(2, e.prenom);
	prepare.setString(3, e.getLogin());
	prepare.setString(4, e.getMdp());
	prepare.setString(5, "Employe");	
	prepare.executeUpdate();
	PreparedStatement prepares=(PreparedStatement) connexion.prepareStatement(req2);
	prepares.setString(1, e.nom);
	prepares.setString(2, e.prenom);
	prepares.setString(3, e.getLogin());
	prepares.setString(4, e.getMdp());
	prepares.setString(5, e.departement);
	prepares.executeUpdate();
	
	connexion.commit();
	return null;
	}catch(SQLException ex) {
		try {
			connexion.rollback();
		} catch (SQLException e1) {
		
		}
		return ex.getMessage();
	}
	
 
	
}
public String createuserC(Comptable c, Connection connexion) {
	
String req="insert into utilisateurs (nom,prenom,login,mot_de_passe,type) values (?,?,?,MD5(?),?)";
	
	String req2="insert into service_comptable (nom,prenom,login,mot_de_passe) values (?,?,?,MD5(?))";
	
	try {
	connexion.setAutoCommit(false);
	PreparedStatement prepare=(PreparedStatement) connexion.prepareStatement(req);
	prepare.setString(1, c.nom);
	prepare.setString(2,c.prenom);
	prepare.setString(3, c.getLogin());
	prepare.setString(4, c.getMdp());
	prepare.setString(5, c.type);	
	prepare.executeUpdate();
	PreparedStatement prepares=(PreparedStatement) connexion.prepareStatement(req2);
	prepares.setString(1, c.nom);
	prepares.setString(2, c.prenom);
	prepares.setString(3, c.getLogin());
	prepares.setString(4, c.getMdp());
	prepares.executeUpdate();
	
	connexion.commit();
	return null;
	}catch(SQLException e1) {
		
		
		try {
			connexion.rollback();
		} catch (SQLException e) {
	
		}
		return e1.getMessage();
	}
	
	
}


@Override
public boolean deleteUser(Utilisateur u) {

	return false;
}
@Override
public boolean set_login(Utilisateur u, String login) {
	// TODO Auto-generated method stub
	return false;
}
@Override
public String get_login(Utilisateur u) {
	
	return null;
}
@Override
public boolean set_mdp(Utilisateur u, String mdp) {
	// TODO Auto-generated method stub
	return false;
}


public static int authentification(String login, String mdp, Connection c) {

	
	String req="select * from administrateur where login=?";
	
	
		
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
				
				
				
				String conn="{? = call connexionAd (?,?)}";
				
				
					
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
@Override
public void getUser(Connection c, Statement s) {
	String req="select * from utilisateurs ";
	try {
	ResultSet r=s.executeQuery(req);
	while(r.next()) {
		String nom=r.getString("nom");
		String prenom=r.getString("prenom");
		String login=r.getString("login");
		String type = r.getString("type");
		
		Utilisateur u = new Utilisateur(nom,prenom,login,null,type);
		Servlet2.users.add(u);
	}
	}catch(SQLException e) {
		return;
	}
	return;
}

public static String  updateuser(Utilisateur u, String login, Connection c) {
	
	String req="update utilisateurs set nom=? , prenom=? , login=? , mot_de_passe=MD5(?) where login=?";
	
	try {
		c.setAutoCommit(false);
		PreparedStatement prepare=(PreparedStatement) c.prepareStatement(req);
		prepare.setString(1, u.nom);
		prepare.setString(2, u.prenom);
		prepare.setString(3, u.getLogin());
		prepare.setString(4, u.getMdp());
		prepare.setString(5, login);
		
		prepare.executeUpdate();
		c.commit();
		return "l";
		}catch(SQLException e) {
			return e.getMessage();
		}
	
	
	
}


}
