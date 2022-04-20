package com.octest.forms;

import java.sql.Connection;

public interface Comptabilite {

	public int cloturer(String numero, Connection c);
	
	public int valider(String numero, Connection c);
	
	public int rejeter(String numero, Connection c);
	
}
