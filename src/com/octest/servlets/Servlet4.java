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
 * Servlet implementation class Servlet4
 */
@WebServlet(description = "Servlet d'impression de la facture", urlPatterns = { "/Servlet4" })
public class Servlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String numero=request.getParameter("numero");
		Comptable c = new Comptable();
		if(Dbconnection.connexion==null) {Dbconnection.connecter();}
		if(numero!=null) {
		int r= c.fermer(numero,Dbconnection.connexion);
		
		Employe e = new Employe(); Servlet1.notes.clear();
		  e.get_evolution(Dbconnection.connexion, Dbconnection.statement);
		this.getServletContext().getRequestDispatcher("/imprimer.jsp").forward(request,response);
		}
		
		this.getServletContext().getRequestDispatcher("/Authentification.jsp").forward(request,response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
