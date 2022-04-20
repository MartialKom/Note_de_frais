package com.octest.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.octest.forms.Comptable;
import com.octest.forms.Dbconnection;
import com.octest.forms.Employe;

/**
 * Servlet implementation class Servlet3
 */
@WebServlet("/Servlet3")
public class Servlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String num=request.getParameter("param"); String
		  log=request.getParameter("log"); String
		  numero=request.getParameter("numero"); String n=request.getParameter("num");
		  String etat=request.getParameter("etat");
		  
		  
		  if(num!= null) { if(Dbconnection.connexion==null) {Dbconnection.connecter();}
		  Comptable c = new Comptable(); int r= c.cloturer(num,
		  Dbconnection.connexion); Employe e = new Employe(); Servlet1.notes.clear();
		  e.get_evolution(Dbconnection.connexion, Dbconnection.statement);
		  this.getServletContext().getRequestDispatcher("/consultation2.jsp").forward(
		  request, response); } else if(log!=null) { if(Dbconnection.connexion==null)
		  {Dbconnection.connecter();} Employe e = new Employe(); Employe e1 = new
		  Employe(); e1 = e.search(log, Dbconnection.connexion,
		  Dbconnection.statement); request.setAttribute("Employe", e1);
		  request.setAttribute("numero", numero);
		  this.getServletContext().getRequestDispatcher("/detail.jsp").forward(request,
		  response);
		  
		  }
		  
		  else if(etat!=null) { if(Dbconnection.connexion==null) { Dbconnection.connecter();
		  }
		  
		  Comptable c = new Comptable(); Employe e = new Employe();
		  if(etat.equals("valider")) {c.valider(n, Dbconnection.connexion);
		  
		  Servlet1.notes.clear(); e.get_evolution(Dbconnection.connexion,
		  Dbconnection.statement);
		  this.getServletContext().getRequestDispatcher("/consultation3.jsp").forward(
		  request, response); } else {c.rejeter(n, Dbconnection.connexion);
		  Servlet1.notes.clear(); e.get_evolution(Dbconnection.connexion,
		  Dbconnection.statement);
		  this.getServletContext().getRequestDispatcher("/consultation3.jsp").forward(
		  request, response); } }
		  
		  
		  else
		  this.getServletContext().getRequestDispatcher("/Authentification.jsp").forward(
				  request, response);
		 
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String NumN=request.getParameter("NumN");
		  String MV=request.getParameter("MV");
		  String login=request.getParameter("login");
		  if(NumN!=null) {
			  if(Dbconnection.connexion==null) {Dbconnection.connecter();}
			  Comptable c = new Comptable();
			  c.modifierMontant(NumN, MV, Dbconnection.connexion);
			  Employe e = new Employe();
			  Employe e1=new Employe();
			  Servlet1.notes.clear();
			  e.get_evolution(Dbconnection.connexion, Dbconnection.statement);
			  e1=e.search(login, Dbconnection.connexion, Dbconnection.statement);
			  	
			  request.setAttribute("numero", NumN);
			  request.setAttribute("Employe", e1);
			  this.getServletContext().getRequestDispatcher("/detail.jsp").forward(request,response);
		  }
		  
		
	}

}
