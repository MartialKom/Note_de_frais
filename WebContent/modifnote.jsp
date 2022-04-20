<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>

    <title></title>
      <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="script3/css/bootstrap.min.css" rel="stylesheet">    
    <link href="script3/css/theme.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="script1/css/styleperso.css">
    
    <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-editable.css">
	<link rel="stylesheet" type="text/css" href="assets/css/dropzone.min.css">
	<script src="assets/js/jquery-3.3.1.min.js"></script>
	
    <style type="text/css">
 body{
 background-color:rgb(158,158,158);
 }
 </style>
    <script src="dist/jquery.js"></script>
    
     <script type="text/javascript">
      $(document).ready(function(){
        $('#selection').change(function(){
        	
            libelle = this.value;
  
           if (libelle == 'Deplacement') {
           
            $('#nom_restau').hide();
            $('#1nom_restau').hide();
            $('#name_salle').hide();
            $('#1name_salle').hide();
            $('#date_restaut').hide();
            $('#1date_restaut').hide();
            $('#ville_restau').hide();
            $('#1ville_restau').hide();
            $('#prix_nuit').hide();
            $('#1prix_nuit').hide();
            $('#repas').hide();
            $('#1repas').hide();
            $('#1nbr_jours').hide();
            $('#nbr_jours').hide();
            
            $('#lieu_depart').show();
            $('#1lieu_depart').show();
            $('#lieu_arriver').show();
            $('#1lieu_arriver').show();
            $('#trajet_fait').show();
            $('#1trajet_fait').show();
            $('#date_debut').show();
            $('#1date_debut').show();
            $('#date_fin').show();
            $('#1date_fin').show();
           }

           if (libelle =='Hotel') {
            $('#nbr_jours').hide();
            $('#lieu_depart').hide();
            $('#1lieu_depart').hide();
            $('#lieu_arriver').hide();
            $('#1lieu_arriver').hide();
            $('#trajet_fait').hide();
            $('#1trajet_fait').hide();
            $('#nom_restau').hide();
            $('#1nom_restau').hide();
            $('#date_restaut').hide();
            $('#1date_restaut').hide();
            $('#name_salle').hide();
            $('#1name_salle').hide();

            $('#ville_restau').show();
            $('#1ville_restau').show();
           
            $('#nbr_jours').show();
            $('#1nbr_jours').show();
            $('#prix_nuit').show();
            $('#1prix_nuit').show();
            $('#repas').show();
            $('#1repas').show();
            $('#date_debut').show();
            $('#1date_debut').show();
            $('#date_fin').show();
            $('#1date_fin').show();

           }

           if (libelle == 'Diner avec un particulier') {
            $('#nbr_jours').hide();
            $('#lieu_depart').hide();
            $('#1lieu_depart').hide();
            $('#lieu_arriver').hide();
            $('#1lieu_arriver').hide();
            $('#trajet_fait').hide();
            $('#1trajet_fait').hide();
            $('#name_salle').hide();
            $('#1name_salle').hide();
            $('#prix_nuit').hide();
            $('#1prix_nuit').hide();
            $('#repas').hide();
            $('#1repas').hide();
            $('#1nbr_jours').hide();
            $('#nbr_jours').hide();
            $('#date_debut').hide();
            $('#1date_debut').hide();
            $('#date_fin').hide();
            $('#1date_fin').hide();

            $('#nom_restau').show();
            $('#1nom_restau').show();
            $('#ville_restau').show();
            $('#1ville_restau').show();
            $('#date_restaut').show();
            $('#1date_restaut').show();
           }
           if (libelle == 'Location de salle') {
            $('#nbr_jours').hide();
            $('#lieu_depart').hide();
            $('#1lieu_depart').hide();
            $('#lieu_arriver').hide();
            $('#1lieu_arriver').hide();
            $('#trajet_fait').hide();
            $('#1trajet_fait').hide();
            $('#nom_restau').hide();
            $('#1nom_restau').hide();
            $('#date_restaut').hide();
            $('#1date_restaut').hide();
            $('#prix_nuit').hide();
            $('#1prix_nuit').hide();
            $('#repas').hide();
            $('#1repas').hide();
            

            $('#ville_restau').show();
            $('#1ville_restau').show();
            $('#name_salle').show();
            $('#1name_salle').show();
            $('#nbr_jours').show();
            $('#1nbr_jours').show();
            $('#date_debut').show();
            $('#1date_debut').show();
            $('#date_fin').show();
            $('#1date_fin').show();
           }
 
        });
      });
 
    </script>
 
  </head>
  
  <%String log=request.getParameter("param");
  String login=request.getParameter("param2");
  %>

  <body>
      <div class="row animated fadeIn page-content">
       <div class="col-sm-2">
        </div>
        <div class="col-sm-8 animated bounce">
        <div class="panel panel-info" style="border-color: rgb(91,155,213)">
            <div class="panel-heading"style="background-color:rgb(91,155,213);color: #FFFFFF;font-size: 15px">
              <center><h3 class="panel-title">Ma note de frais</h3></center>
            </div>
            <div class="panel-body">
             <form action="ser1" method="post" >
                <div class="col-sm-4">
                   <label>Numero:</label>     	
                    <% out.println("<input type='number' name='num' value='"+log+"' readonly='readonly' >");%>
                </div>  
                 <div class="col-sm-4">
                   <label>Login:</label>     	
                    <% out.println("<input type='text' name='log2' value='"+login+"' readonly='readonly' >");%>
                </div>  
                <div class="col-sm-4">
                	<label>Libellé:</label>
                    <select id="selection" name="lib"  required>
                    <option></option>
                    	<option >Deplacement</option>
                    	<option >Hotel</option>
                      <option >Diner avec un particulier</option>
                    	<option >Location de salle</option>
                    </select>
                </div> 
                <div class="col-sm-4">
                	<label>Montant Total:</label>
                	<input type="number" name="mt" required>
                </div>
                <div class="col-sm-12">
                	<br><div class="menu-bar">
                	<p><b>Plus de Details:</b></p>
                	</div>
                </div>
                <div class="col-sm-4">
                	<input type="text" value="Lieu de départ:" readonly style="border:none;" id="1lieu_depart">
                	<input type="text" name="ld" id="lieu_depart"><br>
                  <input type="text" value="nom restaurant:" readonly style="border:none;" id="1nom_restau">
                  <input type="text" name="nrestau" id="nom_restau"><br>
                  <input type="text" value="nom de salle:" readonly style="border:none;" id="1name_salle">
                  <input type="text" name="nsalle" id="name_salle"><br>
                  <input type="text" value="Prix nuit:" readonly style="border:none;" id="1prix_nuit">
                  <input type="number" name="Pnuit" id="prix_nuit">
                </div>
                <div class="col-sm-4">
                  <input type="text" value="Lieu d'arrivé:" readonly style="border:none;" id="1lieu_arriver">
                	<input type="text" name="la" id="lieu_arriver"><br>
                  <input type="text" value="ville:" readonly style="border:none;" id="1ville_restau">
                  <input type="text" name="nville" id="ville_restau"><br>
                  <input type="text" value="Repas inclu:" readonly style="border:none;" id="1repas">
                   <select id="repas" name="repasI">
                     <option>oui</option>
                     <option>non</option>
                   </select>


                </div>
                 <div class="col-sm-4">
                 <input type="text" value="Trajet fait" readonly style="border:none;" id="1trajet_fait">
                	<select id="trajet_fait" name="nbt">
                		<option>1</option>
                		<option>2</option>
                		<option>3</option>
                		<option>4</option>
                		<option>5</option>
                	</select>
                  <input type="text" value="date:" readonly style="border:none;" id="1date_restaut">
                  <input type="date" id="date_restaut" name="dateRestau"><br>
                  <input type="text" value="Nombre de jour:" readonly style="border:none;" id="1nbr_jours">
                 <select id="nbr_jours" name="nbrejours">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                  </select>
                </div>
                <div class="col-sm-2">
                	<br><input type="text" value="Du" readonly style="border:none;" id="1date_debut">
                	<input type="date" name="dd" id="date_debut">
                </div>
                <div class="col-sm-2">
                	<br><input type="text" value="Au" readonly style="border:none;" id="1date_fin">
                	<input type="date" name="df" id="date_fin">
                </div>
                <div class="col-sm-12"><br>
                	<p ><b>Autre précision? </b></p>
                	<textarea name="autreprecision" rows="8" cols="120" placeholder="ajouter une precision si nécessaire:">
                		
                	</textarea><br>
                </div>

               
                  
                  <div class="col-sm-3"></div>
                  <div class="col-sm-3"></div>
                   <div class="col-sm-3"><br><button type="submit" class="btn btn-primary" align="rigth">Soummetre</button></div>
                

             </form> 
            </div>
          </div>
          </div>
          <div class="col-sm-4">
        </div>
        </div>
      </div>
  </body>
</html>

 