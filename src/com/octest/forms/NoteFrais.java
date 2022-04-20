package com.octest.forms;

import java.sql.Date;

public class NoteFrais {
public String montant;
public String details;
public int etat;
public String objet;
public int numero;
public String login;
public float montant1;
public float montantV;
public Date date;
public NoteFrais(String montant, String details, int etat, String objet) {
	this.montant = montant;
	this.details = details;
	this.etat = etat;
	this.objet = objet;
}

public NoteFrais() {
	
}
public String getMontant() {
	return this.montant;
}
public void setMontant(String montant) {
	this.montant = montant;
}
public String getDetails() {
	return this.details;
}
public void setDetails(String details) {
	this.details = details;
}
public int getEtat() {
	return this.etat;
}
public void setEtat(int etat) {
	this.etat = etat;
}
public void setNumero(int n) {
	this.numero=n;
}

public String getObjet() {
	return this.objet;
}
public void setObjet(String objet) {
	this.objet = objet;
}
	
	
}
