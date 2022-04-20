<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.octest.forms.NoteFrais" import="com.octest.servlets.Servlet1" import="java.text.DecimalFormat" import="java.text.DecimalFormatSymbols"
  import="com.octest.forms.Employe"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Consultation</title>
	
   
      <link href="script1/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="script1/css/datatable.css">
      <script type="text/javascript" src="script1/css/Jquery.js" ></script>
      <script type="text/javascript" src="script1/css/datatable.js" ></script>
      <link href="script1/css/font-awesome.min.css" rel="stylesheet">
      
      <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
	
	
	
	
     
</head>
<body>
     			<%
     			String log=request.getParameter("login");
     			String  nom = (String) request.getParameter("nom");
     			String  dep = (String) request.getParameter("dep");
     			%>
      <div class="row animated fadeIn page-content">
        
        
        <div class="col-sm-12">
          <div class="panel panel-danger" style="border-color: rgb(115,131,140);">
            <div class="panel-heading" style="background-color:rgb(115,131,140);color: #FFFFFF;font-size: 15px;">
              <center><h3 class="panel-title"><i>Mes notes</i></h3></center>
            </div>
            <div class="panel-body">

            		<table class="table table-bordered table-striped" id="tableau">
                  <thead>
                    <tr>
<!--                       <th style="width: 20px;  text-align: center"><b> Numero </b></th> -->
                      <th style="width: 20px;  text-align: center"><b>Objet</b> </th>
                      <th style="width: 20px;  text-align: center"><b>Détails</b></th>
                       <th style="width: 20px;  text-align: center"><b> Montant requis</b></th>
                      <th style="width: 20px;  text-align: center"><b> Montant validé</b></th>
                      <th style="width: 20px;  text-align: center"> <b>Etat</b> </th>
                          <th style="width: 10px; text-align: center"><b> Action</b></th> 
                                      				
                    </tr>
                     </thead>
                     <tbody>    
                     
                     <%
                    
                     DecimalFormat format = new DecimalFormat("###,###,###");
                     DecimalFormatSymbols s = format.getDecimalFormatSymbols();
                     s.setGroupingSeparator('.');
                     format.setDecimalFormatSymbols(s);
                     int i=0;
                     for(NoteFrais n: Servlet1.notes){
                    	 if(n.login.equals(log)){
                    	  out.println("<tr>");
                    	 // out.println("<th>"+n.numero+"</th>");
                          out.println("<th>"+n.objet+"</th>");
                          out.println("<th>"+n.details+"</th>");
                         
                          if(n.etat==0){
                        	    out.println("<th>"+format.format(n.montant1)+" FCFA</th>");
                          	  out.println("<th>"+0.00+" FCFA</th>");
                          out.println("<th style='background-color:rgb(0,119,0); text-align:center;'>Ouvert</th>");
                          out.println("<th style='text-align:center;'><a href='modifnote.jsp?param="+n.numero+"&param2="+log+"'><button class='btn btn-secondary'>Modifier</button> </a>");
                          }
                          else if(n.etat==1)
                          {
                        	  out.println("<th>"+format.format(n.montant1)+" FCFA</th>");
                          	  out.println("<th>"+0.00+" FCFA</th>");
                        	  out.println("<th style='background-color:rgb(255,136,17); text-align:center;'>Cloturée</th>");
  out.println("<th style='text-align:center;'><b><i>Aucune Action possible</i></b></th>");
                    	 }
                    	 else if(n.etat==2){
                    		 out.println("<th>"+format.format(n.montant1)+" FCFA</th>");
                         	  out.println("<th>"+format.format(n.montantV)+" FCFA</th>");
                    		 out.println("<th style='background-color:rgb(89,187,72); text-align:center;'>Validée</th>");
                    		 out.println("<th style='text-align:center;'><a href='ser4?numero="+n.numero+"&nom="+nom+"&dep="+dep+"'><button class='btn btn-secondary'>Imprimer facture</button> </a>");
                    	 }
                          
                    	 else if (n.etat==3){
                    		 out.println("<th>"+format.format(n.montant1)+" FCFA</th>");
                         	  out.println("<th>"+0.00+" FCFA</th>");
                    		 out.println("<th style='background-color:rgb(228,32,27); text-align:center;'>Rejetée</th>");
                    		 out.println("<th style='text-align:center;'><b><i>Aucune Action possible</i></b></th>");
                    	 }
                          
                    	 else if (n.etat==4){
                    		 out.println("<th>"+format.format(n.montant1)+" FCFA</th>");
                        	  out.println("<th>"+format.format(n.montantV)+" FCFA</th>");
                    		 out.println("<th style='background-color:rgb(0,128,64); text-align:center;'>Déjà Imprimé</th>");
                    		 out.println("<th style='text-align:center;'><b><i>Aucune Action possible</i></b></th>");
                    	 }
                        i=i+1;  
                     }
                    	 if(i==10) break;
                     }
                     %>
                     			
            			</tbody>
  <script type="text/javascript">
    $(document).ready(function() {
      $('#tableau').DataTable();
    });
  </script>
 
            </div>
          </div>
          </div>
          

        </div>
      </div>
</body>
</html>