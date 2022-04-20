package com.octest.forms;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;
import com.octest.servlets.Servlet1;

public class Employe extends Utilisateur implements ActionSurNote {

	String departement;
	public Employe(String nom, String prenom, String login, String mdp, String departement) {
		super(nom, prenom, login, mdp, "Employe");
		this.departement=departement;
	}
	public Employe() {
		
	}
	
	public String getDepartement() {
		return this.departement;
	}
	public void setDepartement(String departement) {
		this.departement = departement;
	}

	@Override
	public boolean supprimerNote() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void get_evolution(Connection c, Statement s) {
		String req="select * from note order by Numero desc";
		try {
		ResultSet r=s.executeQuery(req);
		String montant = null;
		while(r.next()) {
			int numero=r.getInt("Numero");
			Float montant1 = r.getFloat("montantTotal");
			String etat=r.getString("etat");
			String objet=r.getString("objet");
			String details = r.getString("details");
			String login=r.getString("login");
			Date date = r.getDate("date");
			Float montantV = r.getFloat("montantV");
			
		if(etat.equals("Ouvert")) {
			NoteFrais n= new NoteFrais(montant, details, 0, objet);
			n.setNumero(numero);
			n.login=login;
			n.montant1=montant1;
			n.date=date;
			n.montantV=montantV;
			Servlet1.notes.add(n);
			}
		else if(etat.equals("Cloture")) {
			NoteFrais n= new NoteFrais(montant, details, 1, objet);
			n.setNumero(numero);
			n.login=login;
			n.montant1=montant1;
			n.date=date;
			n.montantV=montantV;
			Servlet1.notes.add(n);
		} else if(etat.equals("Valider")) {
			
		NoteFrais n= new NoteFrais(montant, details, 2, objet);
		
		n.setNumero(numero);
		n.login=login;
		n.montant1=montant1;
		n.date=date;
		n.montantV=montantV;
		Servlet1.notes.add(n);
		}
		
		else if(etat.equals("Rejeter")) {
			NoteFrais n= new NoteFrais(montant, details, 3, objet);
			
			n.setNumero(numero);
			n.login=login;
			n.montant1=montant1;
			n.date=date;
			n.montantV=montantV;
			Servlet1.notes.add(n);
		}
		
		else if(etat.equals("Imprime")) {
			NoteFrais n= new NoteFrais(montant, details, 4, objet);
			
			n.setNumero(numero);
			n.login=login;
			n.montant1=montant1;
			n.date=date;
			n.montantV=montantV;
			Servlet1.notes.add(n);
		}
		
			
		
		}
	
		}catch(SQLException e) {
		
		}
		
	}

	@Override
	public boolean set_details(String num, NoteFrais nf ,Connection c) {
		
		String req="update note set montantTotal=? , details=? , objet=? , date=now() where numero=?";
		
		
	
		
		try {
			c.setAutoCommit(false);
			PreparedStatement prepare=(PreparedStatement) c.prepareStatement(req);
			prepare.setString(1, nf.montant);
			prepare.setString(2, nf.details);
			prepare.setString(3, nf.objet);
			prepare.setString(4, num );
			
			prepare.executeUpdate();
			c.commit();
			return true;
			}catch(SQLException e1) {
				return false;
			}
		
	}

	@Override
	public String soummetre(NoteFrais nf, String log, Connection c)  {
		String req="insert into note (montantTotal,details,objet,login,date) values (?,?,?,?,now())";
		
		try {
		c.setAutoCommit(false);
		PreparedStatement prepare=(PreparedStatement) c.prepareStatement(req);
		prepare.setString(1, nf.montant);
		prepare.setString(2, nf.details);
		prepare.setString(3, nf.objet);
		prepare.setString(4, log );
		
		prepare.executeUpdate();
		
		
		
		
			c.commit();
			 int en=Envoi.main(null);
			 if(en==1) {
			return "Opération réussie";}
			 else return "Le mail n'a pas été envoyé";
		
		}catch(SQLException e) {
			try {
				c.rollback();
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			}
			return "Echec de l'enregistrement de la note";
		}
		

	}

	@Override
	public boolean set_montant() {
		// TODO Auto-generated method stub
		return false;
	}

	
}
