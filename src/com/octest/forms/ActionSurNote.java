package com.octest.forms;

import java.sql.Connection;
import java.sql.Statement;

public interface ActionSurNote {

	
	public abstract boolean supprimerNote();
	
	public abstract void get_evolution(Connection c, Statement s);
	
	public abstract boolean set_details(String num, NoteFrais n, Connection c);
	
	public abstract String soummetre(NoteFrais nf,String log, Connection c);
	
	public abstract boolean set_montant();
}
