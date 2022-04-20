package com.octest.forms;

import java.sql.Connection;
import java.sql.Statement;

public  interface Administration {
	
	
	public abstract String createUser(Employe e,Connection c);
	
	public abstract boolean deleteUser(Utilisateur u);
	
	public abstract boolean set_login(Utilisateur u, String login);
	
	public abstract String get_login(Utilisateur u);
	
	public abstract boolean set_mdp(Utilisateur u, String mdp);
	
	public abstract void getUser(Connection c, Statement s);
	
}
