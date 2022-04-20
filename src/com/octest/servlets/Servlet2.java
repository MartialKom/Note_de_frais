package com.octest.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.octest.forms.Administrateur;
import com.octest.forms.Comptable;
import com.octest.forms.Dbconnection;
import com.octest.forms.Employe;
import com.octest.forms.NoteFrais;
import com.octest.forms.Utilisateur;


@WebServlet("/Servlet2")
public class Servlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static ArrayList<Utilisateur> users = new ArrayList<>();
       
 
    public Servlet2() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * Dbconnection.connecter(); Administrateur u = new Administrateur();
		 * users.clear(); u.getUser(Dbconnection.connexion, Dbconnection.statement);
		 * String res=request.getParameter("res"); request.setAttribute("res", res);
		 * 
		 * this.getServletContext().getRequestDispatcher("/Admin.jsp").forward(request,
		 * response);
		 */
		this.getServletContext().getRequestDispatcher("/Authentification.jsp").forward(request,
				  response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/jsp");
		Administrateur admin = new Administrateur();
		if(Dbconnection.connexion==null) {
		Dbconnection.connecter();}
		Administrateur u = new Administrateur();
		users.clear();
		u.getUser(Dbconnection.connexion, Dbconnection.statement);
		String nom =request.getParameter("nom");
		String log=request.getParameter("adminlogin");
		String pass= request.getParameter("adminpass");
		
		String newPass= request.getParameter("mdpN");
		String newlog=request.getParameter("loginN");
		String newNom= request.getParameter("nomN");
		String newprenom=request.getParameter("prenomN");
		String logina=request.getParameter("login");
		
		if(nom!=null) {
			String prenom=request.getParameter("prenom");
			String user=request.getParameter("user");
			String mdp=request.getParameter("pass");
			String departement = request.getParameter("dep");
			String type=request.getParameter("a");
			if(type.equals("Employe")) {
				Employe e = new Employe(nom, prenom, user, mdp, departement);
				String res=admin.createUser(e,Dbconnection.connexion);
				users.clear();
				u.getUser(Dbconnection.connexion, Dbconnection.statement);
				request.setAttribute("res", res);
				this.getServletContext().getRequestDispatcher("/consultation.jsp").forward(request, response);
			}
			else if(type.equals("Service de comptabilite")){
				
				  Comptable c = new Comptable(nom, prenom, user, mdp); 
				  String res=admin.createuserC(c,Dbconnection.connexion);
				  users.clear();
					u.getUser(Dbconnection.connexion, Dbconnection.statement);
					request.setAttribute("res", res);
				  this.getServletContext().getRequestDispatcher("/consultation.jsp").forward(request, response);
			}
			
		}
		
		if(log!=null) {
			if(Dbconnection.connexion==null) {
				Dbconnection.connecter();}
			
			int r=Administrateur.authentification(log, pass, Dbconnection.connexion);
			
			if(r==1) {
				this.getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);
			}
			else {
				request.setAttribute("r", "Mauvaise authentification");
				this.getServletContext().getRequestDispatcher("/Authentification.jsp").forward(request, response);
			}
		}
		
		if(newPass!=null) {
			Utilisateur u1= new Utilisateur(newNom,newprenom,newlog,newPass,null);
			
			String r=Administrateur.updateuser(u1, logina,Dbconnection.connexion);
			users.clear();
			u.getUser(Dbconnection.connexion, Dbconnection.statement);
			request.setAttribute("r", r);
				this.getServletContext().getRequestDispatcher("/consultation.jsp").forward(request, response);
			
		}
		
	}

}

