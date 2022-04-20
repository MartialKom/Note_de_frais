package com.octest.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Timer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.octest.forms.Administrateur;
import com.octest.forms.Dbconnection;
import com.octest.forms.Employe;
import com.octest.forms.Envoi;
import com.octest.forms.NoteFrais;
import com.octest.forms.Utilisateur;
import com.octest.forms.Details;
import com.octest.forms.DetectFace;

@WebServlet("/Servlet1")
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static ArrayList<NoteFrais> notes = new ArrayList<>();

	public Servlet1() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.getServletContext().getRequestDispatcher("/Authentification.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/jsp");

		String a = (String) request.getAttribute("a");
		Employe e = new Employe();

		String login = request.getParameter("login");
		String mdp = request.getParameter("mdp");

		String nom = request.getParameter("nom");
		String libelle = request.getParameter("lib");
		String montant = request.getParameter("mt");
		String log2 = request.getParameter("log2");

		String num = request.getParameter("num");
		if (num != null) {
			String detail;
				detail = Details.setDetail(request, response);
			
			NoteFrais nf = new NoteFrais(montant, detail, 0, libelle);
			Utilisateur u = new Utilisateur();
			notes.clear();
			e.set_details(num, nf, Dbconnection.connexion);
			e.get_evolution(Dbconnection.connexion, Dbconnection.statement);

			request.setAttribute("login", log2);
			this.getServletContext().getRequestDispatcher("/traitement1.jsp").forward(request, response);
		} else {
			if (libelle != null) {
				String detail;
			
				detail = Details.setDetail(request, response);
				
				NoteFrais nf = new NoteFrais(montant, detail, 0, libelle);
				Utilisateur u = new Utilisateur();
				notes.clear();
				String rs =e.soummetre(nf, nom, Dbconnection.connexion);
	 
				e.get_evolution(Dbconnection.connexion, Dbconnection.statement);
					
				request.setAttribute("login", nom);
				request.setAttribute("rs", rs);
				this.getServletContext().getRequestDispatcher("/traitement1.jsp").forward(request, response);

			}

			else if (login != null) {
				if(Dbconnection.connexion==null) {
				Dbconnection.connecter();}
				notes.clear();
				e.get_evolution(Dbconnection.connexion, Dbconnection.statement);
				int r = Utilisateur.authentification(login, mdp, Dbconnection.connexion);
				if (r == 1) {
					
					String[] args = new String[2];				
					//DetectFace.main(args);
					Utilisateur u = new Utilisateur();
					String type = u.searchType(login, Dbconnection.connexion, Dbconnection.statement);
					if(type.equals("Employe")) {
					e = u.search(login, Dbconnection.connexion, Dbconnection.statement);
					request.setAttribute("employe", e);
					this.getServletContext().getRequestDispatcher("/user.jsp").forward(request, response);}
					
					else  {
						HttpSession session = request.getSession();
						
						
						
						
			session.setAttribute("nom", type);
		
			String[] tab = {"titre1", "titre2", "titre3"};
			session.setAttribute("tableau", tab);
						this.getServletContext().getRequestDispatcher("/serviceComptable.jsp").forward(request, response);}
				}

				if (r == 0) {
					request.setAttribute("r", "Mauvaise authentification");
					this.getServletContext().getRequestDispatcher("/Authentification.jsp").forward(request, response);
				}
				
				if (r == 3) {
					request.setAttribute("r", "Vous n'avez pas les droits");
					this.getServletContext().getRequestDispatcher("/Authentification.jsp").forward(request, response);
				}
			}

		}

	}

}
