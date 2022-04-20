package com.octest.forms;

import java.sql.Connection;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

public class Comptable extends Utilisateur implements Comptabilite{
	
	public static String departement="Service Comptable";
 public Comptable(String nom, String prenom, String login, String mdp) {
		super(nom, prenom, login, mdp,departement);

	}
 public Comptable() {
	 
 }
@Override
public int cloturer(String numero, Connection c) {
	
	String req="Update note set etat='Cloture' where Numero=?";
	String req2= "Update note set montantV=note.montantTotal where numero=?";
	try {
	c.setAutoCommit(false);
	PreparedStatement prepare=(PreparedStatement) c.prepareStatement(req);
	PreparedStatement prepare2=(PreparedStatement) c.prepareStatement(req2);
	prepare.setString(1, numero);
	prepare2.setString(1, numero);
	prepare.executeUpdate();
	prepare2.executeUpdate();
	c.commit();
	return 1;
	}catch(SQLException e) {
		return 0;
	}
	
	
}
@Override
public int valider(String numero, Connection c) {
	
String req="Update note set etat='Valider' where Numero=?";
	
	try {
	c.setAutoCommit(false);
	PreparedStatement prepare=(PreparedStatement) c.prepareStatement(req);
	prepare.setString(1, numero);
	
	prepare.executeUpdate();
	c.commit();
	return 1;
	}catch(SQLException e) {
		return 0;
	}
}
@Override
public int rejeter(String numero, Connection c) {
	
String req="Update note set etat='Rejeter' where Numero=?";
	
	try {
	c.setAutoCommit(false);
	PreparedStatement prepare=(PreparedStatement) c.prepareStatement(req);
	prepare.setString(1, numero);
	
	prepare.executeUpdate();
	c.commit();
	return 1;
	}catch(SQLException e) {
		return 0;
	}
}

public int fermer(String numero, Connection c) {
String req="Update note set etat='Imprime' where Numero=?";
	
	try {
	c.setAutoCommit(false);
	PreparedStatement prepare=(PreparedStatement) c.prepareStatement(req);
	prepare.setString(1, numero);
	
	prepare.executeUpdate();
	c.commit();
	return 1;
	}catch(SQLException e) {
		return 0;
	}
}

public int modifierMontant(String numero, String NM, Connection c) {
	
	String req="Update note set montantV=? where Numero=?";

	try {
	c.setAutoCommit(false);
	PreparedStatement prepare=(PreparedStatement) c.prepareStatement(req);
	prepare.setString(1, NM);
	prepare.setString(2, numero);
	
	prepare.executeUpdate();
	c.commit();
	return 1;
	}catch(SQLException e) {
		return 0;
	}
	
}


}
