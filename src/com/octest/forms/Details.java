package com.octest.forms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Details {

	public static String detail;
	public static String setDetail(HttpServletRequest request, HttpServletResponse response) {
		
		String libelle = request.getParameter("lib");
		
		String ld = request.getParameter("ld");
		String la = request.getParameter("la");
		String nbt = request.getParameter("nbt");
		String dd = request.getParameter("dd");
		String df = request.getParameter("df");
		String nomRestau = request.getParameter("nrestau");
		String nomSalle = request.getParameter("nsalle");
		String prixNuit = request.getParameter("Pnuit");
		String villeRestau = request.getParameter("nville");
		String repasInclu = request.getParameter("repasI");
		String dateRestau = request.getParameter("dateRestau");
		String nbjour= request.getParameter("nbrejours");
		
		
		String ps = request.getParameter("autreprecision");
		
	switch(libelle) {
	case "Deplacement":
		
		detail = "Lieu de depart:" + ld + " destination:" + la + ". Trajet fait:" + nbt + " fois. Du " + dd
		+ " Au " + df + ". PS: " + ps + "";
		
		break;
		
	case "Hotel":
		
		detail= "hotel situé à:" + villeRestau + ", Prix de la nuit:" + prixNuit + "FCFA. Repas inclus:" + repasInclu +". Durée:" + nbjour +" jours, Du " + dd + " Au " + df + ". PS:" + ps + "";  
		
		break;
		
	case "Diner avec un particulier" :
		
		detail= "Nom du restaurant:" + nomRestau + ", Ville:" + villeRestau + ". Le:" + dateRestau + ". PS: " + ps + "";
		
		break;
		
	case "Location de salle":
		
		detail= "Nom de la salle:" + nomSalle + ", Ville:" + villeRestau + ". Durée:" + nbjour + "jours, Du" + dd + " Au " + df + ". PS:" + ps + "";
		
		break;
	
	
	}
		
		
		
		return detail;
	
	}
	
	
	
}
